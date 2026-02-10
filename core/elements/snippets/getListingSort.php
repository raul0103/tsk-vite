<?php

$cacheFolder = 'getListingSort';
$cacheName = $modx->resource->id;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheFolder . '/' . $contextKey . '/',
];

if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    if (($modx->resource->context_key == 'plitaosb' && !in_array($modx->resource->id, [70019, 70296, 70812, 71660, 71661, 71662, 71663, 71664, 71665, 71666, 71667, 71668, 80949, 80950, 80951, 80952, 80953, 80954, 80955, 89877, 80956, 80957, 80958, 80959, 80961, 80962, 80963, 14264, 14246, 14230, 14210, 14212, 66818]))) {
        $result = 'price';
    } else {
        $result = 'popular';
    }

    $modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

return $result;
