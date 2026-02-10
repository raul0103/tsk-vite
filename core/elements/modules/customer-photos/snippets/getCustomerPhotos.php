<?php

$tv_customer_photos_path =  trim($modx->resource->getTVValue('customer_photos_path'));
if (!$tv_customer_photos_path) return null;
$tv_customer_photos_path = "assets/" . $tv_customer_photos_path;

$full_path = MODX_BASE_PATH . $tv_customer_photos_path;
if (!is_dir($full_path)) return null;

// Получаем все файлы (без подкаталогов)
$files = [];

foreach (array_diff(scandir($full_path), ['.', '..']) as $filename) {
    $filepath = $full_path . DIRECTORY_SEPARATOR . $filename;
    if (is_file($filepath)) {
        $files[] = $tv_customer_photos_path . "/" . $filename;
    }
}

return $files;
