<?php

/** @var modX $modx */
require_once MODX_CORE_PATH . "elements/modules/stocks/php/stock-constant.php";
require_once MODX_CORE_PATH . "elements/modules/stocks/php/stock.class.php";

if (empty($tplWrapper)) {
    $tplWrapper = "@FILE modules/warehoses/chunks/wrapper.tpl";
}

if (empty($tpl)) {
    $tpl = "@FILE modules/warehoses/chunks/product-on-warehouse.tpl";
}

if (empty($parents)) {
    return "Не указан parents";
}

if (empty($unique)) {
    return "Не указан уникальный ключ (unique)";
}


if (empty($start)) {
    $start = 300;
}

if (empty($end)) {
    $end = 1600;
}

if (empty($prefix)) {
    $prefix = "л.";
}
if (empty($where)) {
    $where = [];
}

if (empty($context)) {
    $context = (string)$modx->context->get('key');
}

if (empty($stockName)) {
    $stockName = (string)$modx->resource->get('pagetitle');
}

if (!isset($useCache)) {
    $useCache = 1;
}

if (!function_exists("warehousesList")) {
    function warehousesList(
        string $tplWrapper,
        string $tpl = "@FILE modules/warehoses/chunks/product-on-warehouse.tpl",
        $parents,
        int $start,
        int $end,
        $unique,
        string $prefix,
        $where,
        string $context,
        string $stockName,
        bool $useCache
    ) {
        /**@var ModX $modx */
        /**@var pdoTools $pdoTools */
        global $modx;

        $pdoTools = $modx->getService("pdoTools");
        $rows = "";
        $output = "";

        $productsIds = $modx->runSnippet("msProducts", [
            "parents" => $parents,
            "returnIds" => 1,
            "limit" => 0,
        ]);

        $products = $modx->getCollection("modResource", [
            "id:IN" => explode(",", $productsIds),
            "published" => 1,
            "deleted" => 0
        ]);

        $catalogAlias = 'catalog';
        $catalog = $modx->getObject(
            'modResource',
            [
                'alias' => $catalogAlias,
                'context_key' => $context
            ]
        );

        $stockTemplates = [];
        if (!empty($catalog)) {
            $stockTemplates = json_decode($catalog->getTVValue('stocksTemplates'), true);
        }

        $canUseStocks = !empty($stockTemplates) && is_array($stockTemplates);

        $getTemplateForProduct = function (int $productId) use ($stockTemplates, $modx, $context) {
            $parentIds = $modx->getParentIds($productId, 10, ['context' => $context]);
            foreach ($stockTemplates as $template) {
                $templateCategory = $template['category'] ?? null;
                $isMatched = is_array($templateCategory)
                    ? !empty(array_intersect($parentIds, $templateCategory))
                    : in_array($templateCategory, $parentIds);
                if ($isMatched) {
                    return $template;
                }
            }
            return null;
        };

        $getStockCountForProduct = function (int $productId) use ($getTemplateForProduct, $modx, $context, $stockName, $useCache, $canUseStocks) {
            if (!$canUseStocks) {
                return null;
            }

            $stocksNames = getStocksNamesByContext($context);

            $cacheKey = CACHE_KEY . $context . "/" . 'search_' . $productId;
            $stocksData = $useCache ? $modx->cacheManager->get($cacheKey) : null;

            if (empty($stocksData)) {
                $tmpl = $getTemplateForProduct($productId);
                if (!$tmpl) {
                    return null;
                }

                $distribution = getStockDistributionByTemplate(
                    (int)($tmpl['template'] ?? 0),
                    count($stocksNames)
                );
                $tmplCountLimit = (int)$distribution['limitStocks'];
                $tmplCountNot = (int)$distribution['notStocks'];
                $minLimit = getStockTemplateRangeValue($tmpl, 'min_limit');
                $maxLimit = getStockTemplateRangeValue($tmpl, 'max_limit');

                // Генерация в том же формате, что и в карточке товара (stocks.php).
                $stockTemplateObj = new StockTemplate($stocksNames, $tmplCountLimit, $tmplCountNot, $productId, $minLimit, $maxLimit);
                $stocksData = $stockTemplateObj->make();

                if ($useCache) {
                    $modx->cacheManager->set($cacheKey, $stocksData, CACHE_TIME);
                }
            }

            if (!is_array($stocksData)) {
                return null;
            }

            $stocksRoot = isset($stocksData[STOCK_KEY_STOCKS])
                ? $stocksData[STOCK_KEY_STOCKS]
                : (isset($stocksData['stocks']) ? $stocksData['stocks'] : []);

            if ($stockName !== '') {
                foreach (['limitStocks', 'stocks'] as $key) {
                    if (!empty($stocksRoot[$key]) && is_array($stocksRoot[$key])) {
                        foreach ($stocksRoot[$key] as $row) {
                            if (isset($row['title']) && $row['title'] === $stockName) {
                                return (int)($row['count'] ?? 0);
                            }
                        }
                    }
                }
                return 0;
            }

            $total = 0;
            foreach (['limitStocks', 'stocks'] as $key) {
                if (!empty($stocksRoot[$key]) && is_array($stocksRoot[$key])) {
                    foreach ($stocksRoot[$key] as $row) {
                        if (isset($row['count'])) {
                            $total += (int)$row['count'];
                        }
                    }
                }
            }

            return $total;
        };

        foreach ($products as $product) {
            $count = $getStockCountForProduct((int)$product->id);

            if ($count === null) {
                if (!empty($where)) {
                    foreach ($where as $conditional) {
                        $parents = explode(",", $conditional["parents"]);
                        if (in_array($product->parent, $parents) && $conditional["unique"] == $unique) {
                            $start = $conditional["start"];
                            $end = $conditional["end"];
                            break;
                        }
                    }
                }

                $count = $pdoTools->runSnippet("@FILE snippets/random.php", [
                    "id" => $product->id,
                    "start" => $start,
                    "end" => $end,
                    "unique" => $unique
                ]);
            }

            $rows .= $pdoTools->getChunk($tpl, [
                "pagetitle" => $product->pagetitle,
                "count" => $count,
                "prefix" => $prefix,
            ]);
        }

        $output = $pdoTools->getChunk($tplWrapper, [
            "output" => $rows
        ]);

        return $output;
    }
}


return warehousesList(
    $tplWrapper,
    $tpl,
    $parents,
    $start,
    $end,
    $unique,
    $prefix,
    $where,
    $context,
    $stockName,
    (bool)$useCache
);

