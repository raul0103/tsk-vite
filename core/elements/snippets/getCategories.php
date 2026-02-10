<?php

// Взял отсюда и немного улучшил:
// https://docs.modx.pro/komponentyi/minishop2/poleznyie-vyiborki/vyivod-ssyilok-na-dopolnitelnyie-kategorii-tovara

if (empty($id)) {
    $id = $modx->resource->id;
}

$cacheName = $id;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'strong_cache/file_snippets/getCategories/' . $modx->context->key,
];

if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    if (empty($tpl)) {
        $tpl = '@INLINE [[+id]]';
    }
    if (empty($separator)) {
        $separator = ',';
    }

    $pdo = $modx->getService('pdoFetch');

    $conditions = ['product_id' => $id];
    $options = [
        'innerJoin' => [
            'msCategory' => ['on' => 'msCategoryMember.category_id = msCategory.id']
        ],
        'select' => ['msCategory' => 'all'],
        'sortby' => 'msCategory.id'
    ];
    $rows = $pdo->getCollection('msCategoryMember', $conditions, $options);

    $output = [];
    foreach ($rows as $row) {
        $output[] = $pdo->getChunk($tpl, $row);
    }

    $result = implode($separator, $output);
    $modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

return $result;
