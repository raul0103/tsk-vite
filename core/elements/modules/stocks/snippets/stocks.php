<?php

/** @var modX $modx */
require_once MODX_CORE_PATH . "elements/modules/stocks/php/stock-constant.php";
require_once MODX_CORE_PATH . "elements/modules/stocks/php/stock.class.php";

const ALIAS_CATALOG = "catalog";

$productId = (int)$modx->getOption("productId", $scriptProperties, $modx->resource->id);
$context = (string)$modx->getOption("context", $scriptProperties, $modx->context->get('key'));

if (!$productId) {
    return '';
}

$stocksNames = getStocksNamesByContext($context);

$catalog = $modx->getObject(
    'modResource',
    array(
        'alias' => ALIAS_CATALOG,
        'context_key' => $context
    )
);

if (empty($catalog)) {
    $modx->log(modX::LOG_LEVEL_ERROR, "Catalog not found for context ({$context})");
    return '';
}

$stockTemplates = json_decode($catalog->getTVValue('stocksTemplates'), true);
if (empty($stockTemplates) || !is_array($stockTemplates)) {
    return '';
}

$cacheKey = CACHE_KEY . $context . "/" . 'search_' . $productId;
$resultStocks = $modx->cacheManager->get($cacheKey);

if (empty($resultStocks)) {
    $parentIds = $modx->getParentIds($productId, 10, array('context' => $context));
    $findStockTemplate = null;

    foreach ($stockTemplates as $stockTemplate) {
        $templateCategory = isset($stockTemplate['category']) ? $stockTemplate['category'] : null;
        $isMatched = is_array($templateCategory)
            ? !empty(array_intersect($parentIds, $templateCategory))
            : in_array($templateCategory, $parentIds);

        if ($isMatched) {
            $findStockTemplate = $stockTemplate;
            break;
        }
    }

    if (empty($findStockTemplate)) {
        $modx->log(modX::LOG_LEVEL_ERROR, "Stock template not found for product ({$productId})");
        return '';
    }

    $limitConstName = "TEMPLATE_{$findStockTemplate['template']}_COUNT_LIMIT_STOCKS";
    $notConstName = "TEMPLATE_{$findStockTemplate['template']}_COUNT_NOT_STOCKS";
    $templateCountLimitStocks = defined($limitConstName) ? (int)constant($limitConstName) : (int)MIN_LIMIT_STOCKS;
    $templateCountNotStocks = defined($notConstName) ? (int)constant($notConstName) : (int)MIN_STOCKS;
    $templateMinLimit = isset($findStockTemplate['min_limit']) ? (int)$findStockTemplate['min_limit'] : null;
    $templateMaxLimit = isset($findStockTemplate['max_limit']) ? (int)$findStockTemplate['max_limit'] : null;

    $stockTemplateObj = new StockTemplate(
        $stocksNames,
        $templateCountLimitStocks,
        $templateCountNotStocks,
        $productId,
        $templateMinLimit,
        $templateMaxLimit
    );
    $resultStocks = $stockTemplateObj->make();

    $modx->cacheManager->set($cacheKey, $resultStocks, CACHE_TIME);
}

if (!is_array($resultStocks)) {
    return '';
}

$pdo = $modx->getService('pdoTools');
$result = $pdo->getChunk("@FILE modules/stocks/chunks/output.tpl", array(
    "header" => isset($resultStocks[STOCK_KEY_HEADER]) ? $resultStocks[STOCK_KEY_HEADER] : array(),
    "stocks" => isset($resultStocks[STOCK_KEY_STOCKS]) ? $resultStocks[STOCK_KEY_STOCKS] : array(),
    "countStocks" => count($stocksNames),
));

return $result;
