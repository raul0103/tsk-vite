<?php

/**
 * Выбираем с какого сниппета получаем данные
 * Если есть выбранный город в сессиях тогда отдаем ему преимущество
 */

if ($_SESSION['city_change'] == 'msk') {
    $snippet_name = 'cityChanger';
} else {
    $snippet_name = 'utm';
}
$utmVal = $modx->runSnippet($snippet_name, ['val' => 'city']);

$newPhone = $modx->runSnippet($snippet_name, ['val' => 'phone']);
$newEmail = $modx->runSnippet($snippet_name, ['val' => 'email']);
$newAddress = $modx->runSnippet($snippet_name, ['val' => 'address']);

// Меняем output
$output = &$modx->resource->_output;

if (!empty($newPhone)) {
    $output = str_ireplace($modx->getOption('phone'), $newPhone, $output);
}
if (!empty($newEmail)) {
    // Такая мера нужна, т.к. в значении есть код: [[++http_host]]
    $pdo = $modx->getService('pdoTools');
    $oldEmail = $pdo->getChunk('@CODE:' . $modx->getOption('email'));
    $output = str_ireplace($oldEmail, $newEmail, $output);
}
if (!empty($utmVal)) {
    $output = str_ireplace($modx->getOption('address'), $utmVal['address'], $output);
    if ($utmVal['pcase'])
        $output = str_ireplace(['Санкт-Петербурге', 'в СПб', 'в СПБ'],  [$utmVal['pcase'], 'в ' . $utmVal['pcase'], 'в ' . $utmVal['pcase']], $output);
    if ($utmVal['rcase'])
        $output = str_ireplace('Санкт-Петербурга', $utmVal['rcase'], $output);
    if ($utmVal['dcase'])
        $output = str_ireplace('Санкт-Петербургу', $utmVal['dcase'], $output);
    if ($utmVal['icase'])
        $output = str_ireplace('Санкт-Петербург', $utmVal['icase'], $output);

    // Для Москвы надо удалить с текста область
    if ($_SESSION['city_change'] == 'msk') {
        $output = str_ireplace(['на территории Ленинградской области', ' и Ленинградской области'], ['', ''], $output);
    }
}
