<?php

if (!function_exists('deleteDirectory')) {
    function deleteDirectory($dir)
    {
        if (!is_dir($dir)) return false;

        $files = array_diff(scandir($dir), array('.', '..'));

        foreach ($files as $file) {
            $filePath = $dir . '/' . $file;
            is_dir($filePath) ? deleteDirectory($filePath) : unlink($filePath);
        }

        return rmdir($dir);
    }
}

if (!function_exists('deleteFile')) {
    function deleteFile($filePath)
    {
        if (!is_file($filePath)) return false;

        return unlink($filePath);
    }
}

switch ($modx->event->name) {
    case 'EmodImportStart':
        $dirPath = $_SERVER['DOCUMENT_ROOT'] . '/core/custom-cache/listing-gallery';
        deleteDirectory($dirPath);
        break;

    case 'OnDocFormSave':
        $filePath = $_SERVER['DOCUMENT_ROOT'] . '/core/custom-cache/listing-gallery/' . $resource->context_key . '/' . $resource->id . '.php';
        deleteFile($filePath);
        break;
}
