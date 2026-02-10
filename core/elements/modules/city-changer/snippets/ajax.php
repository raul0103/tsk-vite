<?php

/**
 * Сниппет для получения HTML модального окна при ajax запросе
 */
$hxrw = $_SERVER['HTTP_X_REQUESTED_WITH'];
if (empty($hxrw) && strtolower($hxrw) != 'xmlhttprequest' && $_SERVER['REQUEST_METHOD'] != 'POST') return;

if ($_POST['action'] == 'get-html-modal') {
    if (in_array($modx->context->key, ['rasprodazha', 'krovlya'])) {
        die;
    }

    if (!in_array($modx->getPlaceholder('localdata')['subdomain_key'], ['msk', 'krasnodar'])) {
        die;
    }

    if (!$pdoTools = $modx->getService('pdoTools')) return;

    $modal_chunk = $pdoTools->getChunk('@FILE modules/city-changer/chunks/modals.tpl');
    die($modal_chunk);
}
