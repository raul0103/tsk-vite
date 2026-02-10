<?php

/**
 * Сгенерирует JSON файл с деревом каталога
 */
$CONTEXT_KEY = 'krovlya';
$TEMPLATES = [5, 19];

$items = $modx->getCollection('modResource', [
    'class_key' => 'msCategory',
    'context_key' => $CONTEXT_KEY,
    'template:in' => $TEMPLATES
]);

// Формирование массива ресурсов
$resources = [];
foreach ($items as $item) {
    $resources[$item->id] = [
        'id' => $item->id,
        'uri' => $item->uri,
        'name' => $item->menutitle ?: $item->pagetitle,
        'parent' => $item->parent,
        'children' => []
    ];
}

// Создание дерева
$tree = [];
foreach ($resources as $resource) {
    if ($resource['parent'] == 0) {
        $tree[] = &$resources[$resource['id']];
    } else {
        $resources[$resource['parent']]['children'][] = &$resources[$resource['id']];
    }
}

// Запись дерева в файл JSON
$jsonData = json_encode($tree, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

if ($jsonData === false) {
    echo "Ошибка при преобразовании массива в JSON: " . json_last_error_msg();
} else {
    $filePath = $_SERVER['DOCUMENT_ROOT'] . '/tree.json';
    if (file_put_contents($filePath, $jsonData) === false) {
        echo "Ошибка при записи JSON в файл.";
    } else {
        echo "Данные успешно записаны в файл tree.json.";
    }
}
