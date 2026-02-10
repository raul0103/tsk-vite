<?php

// ------------------------------------
// Проведение валидации
// ------------------------------------
if (empty($src)) {
    $src = '';
}

// В ходе тестирования я замечал, что почему-то в некоторых случаях накладывается несколько водных знаков на одно фото. То есть несколько раз сниппет вызывается для одной картинки. Не знаю, почему так. Может, MODX так работает. Я вроде бы для каждой картинки всего 1 раз вызываю сниппет. Но данная строка исправляет этот баг.
if (strpos($src, '/imgWithWatermark/') !== false) {
    return $src;
}

$pathToImage = $_SERVER['DOCUMENT_ROOT'] . $src;
if (!file_exists($pathToImage) || is_dir($pathToImage)) {
    return $src;
}


// ------------------------------------
// Установка путей и названий
// ------------------------------------
// Название файла - это хеш его содержимого и ".расширение"
$filename = md5(file_get_contents($pathToImage)) . '.' . pathinfo($pathToImage)['extension'];
$pathToResultFolder = MODX_ASSETS_PATH . 'images/imgWithWatermark/' . $modx->resource->context_key;
$pathToResultFile = $pathToResultFolder . '/' . $filename;
$result = str_replace($_SERVER['DOCUMENT_ROOT'], '', $pathToResultFile);


// ------------------------------------
// Проверка существования файла - может, он уже есть
// ------------------------------------
if (file_exists($pathToResultFile)) {
    return $result;
}


// ------------------------------------
// Определение переменных
// ------------------------------------
// Пути
$pathToWatermark = MODX_ASSETS_PATH . 'template/img/best-price.png';

// Размеры картинки
$imageSizes = getimagesize($pathToImage);
$imageWidth1Percent = $imageSizes[0] / 100;
$imageHeight1Percent = $imageSizes[1] / 100;

// Размеры водного знака
$watermarkSizes = getimagesize($pathToWatermark);
// Максимальная ширина водного знака - не более 20 процентов от ширины картинки
$watermarkMaxWidth = $imageWidth1Percent * 40;
if ($watermarkMaxWidth > $watermarkSizes[0]) {
    $watermarkMaxWidth = $watermarkSizes[0];
}
$watermarkRatioPercents = $watermarkMaxWidth / $watermarkSizes[0];
$watermarkMaxWidth = round($watermarkMaxWidth);
// Максимальная высота водного знака должна быть пропорциональна его максимальной ширине
$watermarkMaxHeight = round($watermarkSizes[1] * $watermarkRatioPercents);

// Сдвиги
$offsetX = round(($watermarkMaxWidth / 2) + $imageWidth1Percent * 3);
$offsetY = round(($watermarkMaxHeight / 2) + $imageHeight1Percent * 3);


// ------------------------------------
// Создание папки
// ------------------------------------
if (!is_dir($pathToResultFolder)) {
    mkdir($pathToResultFolder, 0777, true);
}


// ------------------------------------
// Работа с phpThumb
// ------------------------------------
$phpThumb = $modx->getService('modphpthumb', 'modPhpThumb', MODX_CORE_PATH . 'model/phpthumb/', []);
$phpThumb->setSourceFilename($pathToImage);
$phpThumb->setParameter('fltr', "wmi|$pathToWatermark|" . $offsetX . "x" . $offsetY . "|100|$watermarkMaxWidth|$watermarkMaxHeight");
$phpThumb->setParameter('q', "95");
$resultError = null;

if ($phpThumb->GenerateThumbnail()) {
    if (!$phpThumb->renderToFile($pathToResultFile)) {
        $modx->log(1, 'Ошибка сохранения изображения в [' . $pathToImage . ']');
        $resultError = $src;
    }
} else {
    $modx->log(1, print_r($phpThumb->debugmessages, 1));
    $resultError = $src;
}

// Phpthumb иногда добавляет 2 и более водных знака на одну картинку. Данная строка исправляет это
$phpThumb->resetObject();
if (!empty($resultError)) {
    return $resultError;
}

return $result;
