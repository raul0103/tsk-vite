<?php

$context = $modx->resource->get('context_key');

$cacheName = 'createMenu';
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheName . '/' . $modx->context->key . '/',
];

if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    require_once MODX_CORE_PATH . 'elements/snippets/v3/data/' . $context . '.php';
    $result = [
        'values' => getMenuData()
    ];

    if ($context == 'gazobeton') {
        foreach ($result['values'] as $brandId => $brandData) {
            $tv = $modx->getObject('modTemplateVar', array('name' =>'mainImage'));
            $result['values'][$brandId]['column1']['img'] = $tv->getValue($brandId);
        }
    }

    switch ($context) {
        case 'gazobeton':
            $result['column1'] = ['title' => 'Товар', 'type' => 'simple'];
            $result['column2'] = ['title' => 'Плотность', 'type' => 'simple'];
            $result['proizvoditeli'] = ['title' => 'Производители', 'type' => 'simple'];
            $result['column3'] = ['title' => 'Размеры', 'type' => 'composite'];
            $result['massa'] = ['title' => 'Масса', 'type' => 'simple'];
            $result['sezon'] = ['title' => 'Сезон', 'type' => 'simple'];
            $result['vidyblokov'] = ['title' => 'Виды блоков', 'type' => 'simple'];
            break;
        default:
            $result['column1'] = ['title' => 'Товар', 'type' => 'simple'];
            $result['column2'] = ['title' => 'Производитель', 'type' => 'simple'];
    }

    $modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

return $result;
