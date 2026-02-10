<?php

/**
 * Снипет для поиска товара на складах
 * Возвращает JSON с результатами поиска
 */

/** @var modX $modx */
require_once MODX_CORE_PATH . "elements/modules/stocks/php/stock-constant.php";
require_once MODX_CORE_PATH . "elements/modules/stocks/php/stock.class.php";

const ALIAS_CATALOG = "catalog";

// Получение параметров
$queryPhrase = $modx->getOption("query", $scriptProperties, "");
$context = $modx->getOption("context", $scriptProperties, $modx->context->get('key'));
$stockName = $modx->getOption("stockName", $scriptProperties, "");
$limit = (int)$modx->getOption("limit", $scriptProperties, 10);

// Проверка обязательных параметров
if (empty($queryPhrase)) {
    return json_encode([
        'success' => false,
        'error' => 'Поисковый запрос не может быть пустым'
    ]);
}

if (empty($stockName)) {
    return json_encode([
        'success' => false,
        'error' => 'Название склада не указано'
    ]);
}

try {
    // Формирование where
    $wherePagetitle = [];
    $queryWordsArray = [];

    foreach (explode(' ', $queryPhrase) as $index => $queryWord) {
        if (stristr($queryWord, ',') || stristr($queryWord, '.')) {
            $queryWord = preg_replace('/[, .]/', '[,\.]', $queryWord);
            $wherePagetitle[$index] = '`msProduct`.`pagetitle` REGEXP :queryWord' . $index;
        } else {
            $queryWord = '%' . $queryWord . '%';
            $wherePagetitle[$index] = '`msProduct`.`pagetitle` LIKE :queryWord' . $index;
        }
        $queryWordsArray['queryWord' . $index] = $queryWord;
    }

    $wherePagetitle = '(' . implode(' AND ', $wherePagetitle) . ')';
    $queryWordsArray['queryPhrase'] = '%' . $queryPhrase . '%';
    $whereArticle = '(`Data`.`article` LIKE :queryPhrase)';
    $where = $wherePagetitle . ' OR ' . $whereArticle;

    // Получение данных из БД
    $query = "SELECT `msProduct`.`id` 
            
          FROM `modx_site_content` AS `msProduct` 
            
          LEFT JOIN `modx_ms2_products` `Data` ON `msProduct`.`id` =  `Data`.`id` 
          LEFT JOIN `modx_site_tmplvar_contentvalues` `TVhitspage` ON `TVhitspage`.`contentid` = `msProduct`.`id` AND `TVhitspage`.`tmplvarid` = 7 
          LEFT JOIN `modx_site_tmplvar_contentvalues` `TVpriority1` ON `TVpriority1`.`contentid` = `msProduct`.`id` AND `TVpriority1`.`tmplvarid` = 17 
            
          WHERE  `msProduct`.`class_key` = 'msProduct' 
                AND `msProduct`.`published` = 1 
                AND `msProduct`.`deleted` = 0 
                AND `msProduct`.`context_key` = '" . $context . "'
                AND ($where) 
            
          GROUP BY msProduct.id 
          ORDER BY CAST(`TVpriority1`.`value` AS DECIMAL(13,3)) ASC, CAST(`TVhitspage`.`value` AS DECIMAL(13,3)) ASC
                     LIMIT " . $limit;

    $stmt = $modx->prepare($query);
    $queryResult = $stmt->execute($queryWordsArray);

    if ($queryResult === false) {
        return json_encode([
            'success' => false,
            'error' => 'Ошибка выполнения запроса к базе данных'
        ]);
    }

    $data = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (empty($data)) {
        return json_encode([
            'success' => true,
            'products' => [],
            'message' => 'Товары по запросу не найдены'
        ]);
    }

    // Получение каталога для определения шаблона склада
    $catalog = $modx->getObject(
        'modResource',
        [
            'alias' => ALIAS_CATALOG,
            "context_key" => $context
        ]
    );

    if (empty($catalog)) {
        $modx->log(modX::LOG_LEVEL_ERROR, "Каталог не найден для контекста ({$context})");
        return json_encode([
            'success' => false,
            'error' => 'Каталог не найден'
        ]);
    }

    $stockTemplates = json_decode($catalog->getTVValue('stocksTemplates'), true);
    $stocksNames = getStocksNamesByContext($context);
    $resultStocks = [];

    // Обработка каждого найденного товара
    foreach ($data as $productId) {
        // Проверяем кеш для этого товара
        $cacheKey =  CACHE_KEY . $context . "/". 'search_' . $productId;
        $cachedStocks = $modx->cacheManager->get($cacheKey);
        
        if (!empty($cachedStocks)) {
            $resultStocks[$productId] = $cachedStocks;
            continue;
        }

        $parentIds = $modx->getParentIds($productId, 10, array('context' => $context));
        $stockTemplate = null;

        // Поиск подходящего шаблона склада
        foreach ($stockTemplates as $template) {
            $templateCategory = $template['category'] ?? null;
            $isMatched = is_array($templateCategory)
                ? !empty(array_intersect($parentIds, $templateCategory))
                : in_array($templateCategory, $parentIds);

            if ($isMatched) {
                $stockTemplate = $template;
                break;
            }
        }

        if (!$stockTemplate) {
            continue;
        }

        $templateCountLimitStocks = constant("TEMPLATE_{$stockTemplate['template']}_COUNT_LIMIT_STOCKS");
        $templateCountNotStocks = constant("TEMPLATE_{$stockTemplate['template']}_COUNT_NOT_STOCKS");
        $templateMinLimit = isset($stockTemplate['min_limit']) ? (int)$stockTemplate['min_limit'] : null;
        $templateMaxLimit = isset($stockTemplate['max_limit']) ? (int)$stockTemplate['max_limit'] : null;

        $stockTemplateObj = new StockTemplate(
            $stocksNames,
            $templateCountLimitStocks,
            $templateCountNotStocks,
            $productId,
            $templateMinLimit,
            $templateMaxLimit
        );
        $stocks = $stockTemplateObj->make();
        
        // Кешируем результат
        $modx->cacheManager->set($cacheKey, $stocks, CACHE_TIME);
        $resultStocks[$productId] = $stocks;
    }

    // Функция для поиска количества на складе
    if (!function_exists("searchCountStock")) {
        function searchCountStock($stockData, $searchStock)
        {
            foreach ($stockData as $stock) {
                if ($searchStock == $stock['title']) {
                    return $stock["count"];
                }
            }
            return null;
        }
    }

    // Функция для определения статуса товара на складе
    if (!function_exists("getStockStatus")) {
        function getStockStatus($count)
        {
            if ($count >= MIN_STOCKS && $count <= MAX_STOCKS) {
                return 'normal'; // товар в нормальном диапазоне
            } elseif ($count >= MIN_LIMIT_STOCKS && $count <= MAX_LIMIT_STOCKS) {
                return 'limited'; // товар с ограниченным количеством
            } elseif ($count == 0) {
                return 'request'; // товар под запрос
            } else {
                return 'normal'; // по умолчанию нормальный статус
            }
        }
    }

    $finalResults = [];

    foreach ($resultStocks as $productId => $values) {
        $count = searchCountStock($values['stocks']['limitStocks'], $stockName);
        $countLimit = searchCountStock($values['stocks']['stocks'], $stockName);
        $finalCount = $count ?? $countLimit ?? 0;

        $product = $modx->getObject("modResource", $productId);
        if ($product) {
            $finalResults[] = [
                "id" => $productId,
                "title" => $product->get('pagetitle'),
                "count" => $finalCount,
                "status" => getStockStatus($finalCount),
                "url" => $modx->makeUrl($productId)
            ];
        }
    }

    return json_encode([
        'success' => true,
        'products' => $finalResults,
        'query' => $queryPhrase,
        'stockName' => $stockName,
        'total' => count($finalResults)
    ]);
} catch (Exception $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, "Ошибка в warehouseSearch: " . $e->getMessage());
    return json_encode([
        'success' => false,
        'error' => 'Произошла ошибка при поиске товаров'
    ]);
}

