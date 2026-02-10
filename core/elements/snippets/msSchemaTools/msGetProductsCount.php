<?php

// Устанавливаем tv для вводных данных
$ids = $modx->getOption('ids', $scriptProperties, '', true);
$addIds = $modx->getOption('addIds', $scriptProperties, '', true);
$thousandsSep = $modx->getOption('thousandsSep', $scriptProperties, '', true);
$addDecimals = $modx->getOption('addDecimals', $scriptProperties, false, true);
$decimalsSep = $modx->getOption('decimalsSep', $scriptProperties, '.', true);
$addDecimals = ($addDecimals == true) ? 2 : 0;

// Получаем название кеша по вводным данным
$cacheName = md5(implode('__', [$modx->resource->id, $ids, $addIds, $thousandsSep, $addDecimals, $decimalsSep]));
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $modx->resource->context_key . '/msGetProductsCount/'
];
// Читаем кеш, если он есть. Или высчитываем результат, если кеша нет
if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    $result = [];

    $msSchemaTools = $modx->getService('msSchemaTools', 'msSchemaTools', MODX_CORE_PATH . 'components/msschematools/model/', $scriptProperties);
    if (!$msSchemaTools) {
        return 'Could not load msSchemaTools class!';
    }

    if (empty($ids)) {
        if (!$msSchemaTools->checkCategory($modx->resource->id)) {
            return;
        }
        $ids = [$modx->resource->id];
    } else {
        $ids = explode(',', $ids);
        $ids = array_map('trim', $ids);
        $ids = array_map('strtolower', $ids);
    }

    foreach ($ids as $id) {
        if (!$msSchemaTools->checkCategory($id)) {
            continue;
        }
        $pids = array_merge([$id], $modx->getChildIds($id));
        $arr = [];
        $q = $modx->newQuery('msProduct');
        $q->where(['class_key' => 'msProduct', 'parent:IN' => $pids, 'published' => 1, 'deleted' => 0]);
        $q->select('`msProduct`.`id`');
        if ($q->prepare() && $q->stmt->execute()) {
            $arr = $q->stmt->fetchAll(PDO::FETCH_COLUMN);
        }
        $q = $modx->newQuery('msProduct');
        $q->leftJoin('msCategoryMember', 'Member', '`Member`.`product_id` = `msProduct`.`id`');
        $q->where(['class_key' => 'msProduct', 'Member.category_id:IN' => $pids, 'published' => 1, 'deleted' => 0]);
        $q->select('`msProduct`.`id`');
        if ($q->prepare() && $q->stmt->execute()) {
            $arr2 = $q->stmt->fetchAll(PDO::FETCH_COLUMN);
            if (!empty($arr2)) {
                $arr = array_unique(array_merge($arr, $arr2));
            }
        }

        if ($arr) {
            $addIds_res = ($addIds) ? "_$id" : '';
            $number = number_format(count($arr), $addDecimals, $decimalsSep, $thousandsSep);

            $result['total_count' . $addIds_res] = $number;
        }
    }

    $modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

// Устанавливаем плейсхолдеры
if (!empty($result)) {
    $modx->setPlaceholders($result);
}
