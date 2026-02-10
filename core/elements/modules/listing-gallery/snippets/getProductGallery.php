<?php

/**
 * Сниппет получает галерею товара и преобразует в необходимый массив данных
 *
 * @product_id - ID товара
 */

if (!$product_id) {
    return;
}

// >>> cache
if (!class_exists("CustomCache")) {
    include MODX_BASE_PATH .
        "core/elements/modules/custom-cache/CustomCache.php";
}
$cachefolder = "listing-gallery/" . $modx->context->key;
$cc = new CustomCache($cachefolder);
// <<<

// >>> minishop
if (!$minishop) {
    $minishop = $modx->getService("miniShop2");
}
// <<<

$filename = $product_id;
if (!($output = $cc->get($filename))) {
    $data = [
        "images" => [],
    ];

    $query = $modx->newQuery('msProductFile');
    $query->where([
        'product_id' => $product_id,
        'path:LIKE' => '%small%'
    ]);
    $query->limit(5);
    $query->sortby('rank', 'asc');
    $files = $modx->getIterator('msProductFile', $query);


    $query = "SELECT * FROM modx_ms2_product_files WHERE product_id = $product_id AND `path` LIKE '%small%' ORDER BY `rank` ASC";
    $st = $modx->query($query);

    $files = $st->fetchAll(PDO::FETCH_ASSOC);

    $data['images'] = array_map(function ($file){
        return [
            "url" => str_replace("small/", "", $file['url']),
            "thumb" => $file['url']
        ];
    }, $files);



    $cc->set($filename, $data);

    $output = $data;
}

return $output;
