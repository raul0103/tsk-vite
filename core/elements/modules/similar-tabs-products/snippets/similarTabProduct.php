<?php

/** @var modX $modx */
$prod = $modx->getOption("resource", $scriptProperties, $modx->resource);
$limitPerCategory = $modx->getOption("limit", $scriptProperties, 8);
$tpl = $modx->getOption("tpl", $scriptProperties, "@FILE modules/similar-tabs-products/chunks/similar-tab-products.tpl");

// Получаем объект товара
$productId = $prod->id;

$pdoTools = $modx->getService("pdoTools");

if (!$prod) {
    return;
}

// Получаем характеристики текущего товара
$tablePrefix = $modx->getOption('table_prefix');
$currentOptions = [];

$q = $modx->query("SELECT `key`, `value` FROM {$tablePrefix}ms2_product_options WHERE product_id = {$productId}");
while ($row = $q->fetch(PDO::FETCH_ASSOC)) {
    $currentOptions[$row['key']] = $row['value'];
}

// Получаем значение TV-поля similarProducts
$tvValue = json_decode($prod->getTVValue("similarProducts"), true);
if (empty($tvValue)) {
    echo 'Нет сопутствующих категорий';
}

// Результирующий массив сопутствующих товаров по категориям
$similarByCategory = [];
$categoryNames = [];

foreach ($tvValue as $value) {
    $categoryId = (int)$value['category_id'];
    $filterOptions = json_decode($value['options'], true);

    // Получаем название категории
    $categoryResource = $modx->getObject('modResource', $categoryId);
    if ($categoryResource) {
        $categoryNames[$categoryId] = $categoryResource->get('menutitle') ?: $categoryResource->get('pagetitle');
    } else {
        $categoryNames[$categoryId] = 'Категория #' . $categoryId;
    }

    $conditions = [];
    foreach ($filterOptions as $condition) {
        $key = $condition['key'];
        $val = $condition["value"] ?? null;
        if ($val !== null) {
            // Экранируем значения для безопасности
            $escapedKey = $modx->quote($key);
            $escapedVal = $modx->quote($val);
            $conditions[] = "(`o`.`key` = {$escapedKey} AND `o`.`value` = {$escapedVal})";
        }
    }

    $matchedProductIds = [];

    if (!empty($conditions)) {
        // Собираем SQL-запрос
        $conditionSql = implode(" OR ", $conditions);

        $sql = "
        SELECT p.id, COUNT(*) as match_count
        FROM {$tablePrefix}site_content p
        JOIN {$tablePrefix}ms2_product_options o ON p.id = o.product_id
        WHERE p.parent = {$categoryId}
          AND p.id != {$productId}
          AND ({$conditionSql})
        GROUP BY p.id
        ORDER BY match_count DESC
        LIMIT {$limitPerCategory}
    ";

        $result = $modx->query($sql);
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            $matchedProductIds[] = $row['id'];
        }
    }

    // Если совпадений нет — получаем просто все товары из категории
    if (empty($matchedProductIds)) {
        $q = "SELECT id FROM {$tablePrefix}site_content WHERE parent = {$categoryId} AND id != {$productId}
                                 ORDER BY menuindex ASC LIMIT {$limitPerCategory}";
        $fallback = $modx->query($q);

        while ($row = $fallback->fetch(PDO::FETCH_ASSOC)) {
            $matchedProductIds[] = $row['id'];
        }
    }

    // Сохраняем результат по категории
    $similarByCategory[$categoryId] = $matchedProductIds;
}

$output = $pdoTools->getChunk($tpl, [
    "tabs" => $similarByCategory,
    "categoryNames" => $categoryNames
]);

return $output;