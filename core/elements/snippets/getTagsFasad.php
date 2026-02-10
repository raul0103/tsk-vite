<?php

/**
 * Собирает и теги производителей и теги вложенных категорий 
 */

$cacheFolder = 'getTags';
$cacheName = $modx->resource->id;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheFolder . '/' . $modx->resource->context_key . '/',
];

// Нужно для получения доступа к файловым сниппетам и чанкам
$pdoTools = $modx->getService('pdoTools');
$output = '';

// -------------------------------
// Пробуем получить теги из TV categoryCustomTags
// -------------------------------
$categoryCustomTags = $modx->resource->getTVValue('categoryCustomTags');
if (!empty($categoryCustomTags) && $categoryCustomTags != '[]') {

    $categoryCustomTags = json_decode($categoryCustomTags, true);

    foreach ($categoryCustomTags as $val) {
        switch ($val['type']) {
            case 'selection':
                // TODO: вместо получения modResource для каждой итерации лучше написать 1 SQL запрос для всех итераций. Работать будет ГОРАЗДО быстрее.
                $resource = $modx->getObject('modResource', $val['resource_id']);

                // $title есть в MIGX, можно взять оттуда. Но тогда если он обновится у ресурса, то надо будет обновить его и в MIGX поле (пересохранить), а это неудобно.
                $title = $resource->menutitle;
                $uri = $resource->uri;
                $img = $resource->getTVValue('mainImage');
                break;
            case 'creation':
                $title = $val['hidden_title'];
                $uri = $val['uri'];
                $img = '/' . $val['img'];
                break;
        }

        $output .= $pdoTools->getChunk('@FILE sections/category/listing-tags-item.tpl', [
            'tv.mainImage' => $img,
            'menutitle' => $title,
            'uri' => $uri
        ]);
    }
}

// Параметры для вызова сниппета, вывод которого будет в return
$params = [
    'parents' => $modx->resource->id,
    'tpl' => '@FILE sections/category/listing-tags-item.tpl',
    '-tplWrapper' => "@FILE sections/category/listing-tags-wrapper.tpl",
    'templates' => '5,4,28',
    'includeTVs' => 'mainImage',
    'sortby' => 'menuindex,id',
    'sortdir' => 'ASC',
    'limit' => 0,
    'depth' => 0,
    'select' => 'id,menutitle,uri'
];
if (!empty($params['resources'])) {
    $params['sortby'] = 'FIELD(modResource.id, ' . $params['resources'] . ')';
    $params['sortdir'] = '';
    $params['templates'] = '';
    $params['parents'] = 0;
}
$output .= $modx->runSnippet('pdoResources', $params);

$result = $pdoTools->getChunk('@FILE sections/category/listing-tags-wrapper.tpl', [
    'output' => $output
]);


return $result;
