<?php
$cacheFolder = 'getTags';
$cacheName = $modx->resource->id;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheFolder . '/' . $modx->resource->context_key . '/',
];
if(empty($tplTagsItem))
{
    $tplTagsItem = "@FILE sections/category/listing-tags-item.tpl";
}

if(empty($tplTagsErapper))
{
    if ($modx->resource->context_key == 'kirpich-m') {
        $tplTagsErapper = "@FILE sections/category/listing-tags-arrows-wrapper.tpl";
    } else {
        $tplTagsErapper = "@FILE sections/category/listing-tags-wrapper.tpl";
    }
}

if(empty($limit))
{
    $limit = 0;
}



//if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
// -------------------------------
// Пробуем получить теги из TV categoryCustomTags
// -------------------------------
$categoryCustomTags = $modx->resource->getTVValue('categoryCustomTags');
if (!empty($categoryCustomTags) && $categoryCustomTags != '[]') {
    // Нужно для получения доступа к файловым сниппетам и чанкам
    $pdoTools = $modx->getService('pdoTools');

    $output = '';
    $categoryCustomTags = json_decode($categoryCustomTags, true);
    $count = 1;
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

        $output .= $pdoTools->getChunk($tplTagsItem, [
            'tv.mainImage' => $img,
            'menutitle' => $title,
            'uri' => $uri
        ]);

        if($count == $limit)
        {
            break;
        }
        $count ++;
    }

    $result = $pdoTools->getChunk($tplTagsErapper, [
        'output' => $output,
    ]);
    //$modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

// -------------------------------
// Не удалось получить теги из TV categoryCustomTags. Получаем теги по дочерним категориям или по специально определенному набору
// -------------------------------
else {
    // Параметры для вызова сниппета, вывод которого будет в return
    $params = [
        'parents' => $modx->resource->id,
        'tpl' => $tplTagsItem,
        'tplWrapper' => $tplTagsErapper,
        'templates' => '5,4,28',
        'includeTVs' => 'mainImage',
        'sortby' => 'menuindex,id',
        'sortdir' => 'ASC',
        'limit' => $limit,
        'depth' => 0,
        'select' => 'id,menutitle,uri'
    ];

    // Регионы для утеплителей
    switch ($modx->resource->parent) {
        case 13127:
            $params['parents'] = 4;
            break;
        case 10987:
            $params['parents'] = 3028;
            break;
        case 13128:
            $params['parents'] = 3989;
            break;
        case 13129:
            $params['parents'] = 4950;
            break;
        case 13130:
            $params['parents'] = 5911;
            break;
        case 13131:
            $params['parents'] = 6872;
            break;
        case 13132:
            $params['parents'] = 7833;
            break;
    }

    // Спрятать ненужные теги на арматуре
    if ($modx->resource->context_key == 'armatura-178') {
        $params['where'] = '{"hidemenu:=": 0}';
    }

    /*
    // Определение наборов тегов. TODO: Надо эти теги забить в TV categoryCustomTags. Чтобы можно было изменить их без помощи программиста
    $tagsIds = [];
    switch ($modx->resource->id) {
        // Страница "Каталог" на pro-fanera
        case 66777:
            $tagsIds = [
                67217,
                67235,
                67203,
                67209,
                68747,
                80859,
                80860,
                80861,
                80862,
                80863,
                80864,
                92920,
                80865,
                80866,
                80918,
                80919,
                80920,
                80921,
                80922,
                80923,
                80924,
                80925,
                80926,
                80927,
                80928,
                80929,
                80930,
                80931,
                80932,
                80933
            ];
            break;

        // Страница "Продажа досок" на Пиломатериалах
        case 80986:
            $tagsIds = [
                48826,
                95588,
                95594,
                48827,
                48828,
                48825,
                80817,
                80818,
                80819,
                80820,
                80821,
                80823,
                80824,
                80825,
                80826,
                80827,
                80828,
                80829,
                80832,
                80833,
                80834,
                80835,
                80836,
                95637,
                95640,
                95641,
                95642,
                95643,
                95644,
                95646,
                95647,
                95636,
                95635,
                95638,
                95634
            ];
            break;

        // Страница "Термообработанная древесина" на fasady-pro
        case 27898:
            $tagsIds = [
                34068,
                34078,
                34079,
                79526,
                28191,
                34071,
                34065,
                34066,
                34083,
                34075
            ];
            break;

        // Страница "Металлочерепица" на Кровле
        case 16788:
            $tagsIds = [
                12069,
                16789,
                15436,
                56941,
                44676,
                44677,
                44678,
                44679,
                44680,
                44681,
                11760,
                37621,
                12070,
                12071,
                12073,
                12074,
                76923,
            ];
            break;

        // Страница "Фальцевая кровля" на Кровле
        case 22594:
            $tagsIds = [
                22595,
                49196
            ];
            break;

        // Страница "Штакетник" на Кровле
        case 81059:
            $tagsIds = [
                81060,
                86230,
                81061,
                81062,
                81063,
                81064,
                81065,
                81066,
                81067,
                81068,
                81069,
                81070,
                81071,
                81072,
                86231,
                86232,
                86233
            ];
            break;

        // Страница "Рулонная кровля" на Кровле
        case 26261:
            $tagsIds = [
                92693,
                22751,
                37622,
                56941
            ];
            break;

        // Страница "Профлист" на Кровле
        case 86214:
            $tagsIds = [
                26581,
                81051,
                15436,
                56941,
                81059,
                89854,
                89857,
                89858,
                89859,
                89860,
                89861,
                89862,
                89863,
                89864,
                89865,
                89866,
                89867,
                89869,
                89870,
                93906,
                93907,
                93908,
                93909,
                93910,
                93911,
                93912,
                93913,
                93914,
                93915,
                93916,
                93917,
                93918,
            ];
            break;

        // Страница "Гибкая черепица" на Кровле
        case 15428:
            $tagsIds = [
                18297,
                15535,
                15440,
                18322,
                15485,
                49210,
                56941
            ];
            break;

        // Страница "Ондулин" на Кровле
        case 16783:
            $tagsIds = [
                36871,
                16805,
                16786,
                16784,
                56941
            ];
            break;

        // Страница "Водосточная система" на Кровле
        case 18853:
            $tagsIds = [
                92413,
                92418,
                56941,
                26378,
                18854,
                26248,
                26262,
                26382
            ];
            break;

        case 22596:
            $tagsIds = [
                22598,
                22597,
                92856
            ];
            break;

        case 22599:
            $tagsIds = [
                22600,
                92858
            ];
            break;

        case 92964:
            $tagsIds = [
                93025,
                93023,
                93024,
                93022,
                93179
            ];
            break;

        case 95588:
            $tagsIds = [
                80549,
                80551,
                80552,
                80823,
                80824,
                80825,
                80826,
                80827,
                80828,
                80829,
                80574,
                80573,
                80832,
                80833,
                80834,
                80835,
                80836
            ];
            break;
    }
    
    if (!empty($tagsIds)) {
        $params['resources'] = implode(',', $tagsIds);
    }
    */

    // Результат
    if (!empty($params['resources'])) {
        $params['sortby'] = 'FIELD(modResource.id, ' . $params['resources'] . ')';
        $params['sortdir'] = '';
        $params['templates'] = '';
        $params['parents'] = 0;
    }

    if($scriptProperties['brikety'] == 1){
        $params['resources'] = '-105307,-111122,-111121,-105308,-111123';
    }
    if($scriptProperties['brikety'] == 2){
        $params['resources'] = '-105309,-105310,-105311,-105312';
    }

    $result = $modx->runSnippet('pdoResources', $params);
    //$modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}
//}


return $result;