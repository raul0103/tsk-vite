<?php

$optionsLinks = $modx->resource->getTVValue("optionsLinks");
$value = $modx->getOption('value', $scriptProperties, '', true);
$key = $modx->getOption('key', $scriptProperties, '', true);


if (!function_exists("getLink")) {
    function getLink($key, $value, $optionsLinksArray)
    {
        foreach ($optionsLinksArray as $optionsLink){
            if($optionsLink['option_key'] == $key and $optionsLink['value'] == $value){
                return $optionsLink['link'];
            }
        }

        return null;
    }
}

if (!function_exists("resultLink")) {
    function resultLink($key, $value, $optionsLinksArray)
    {
        $result = [];
        $link = getLink($key, $value, $optionsLinksArray);
        $existLink = !empty($link);
        if($existLink){
            $result[] = "<a href='{$link}'>{$value}</a>";
        }else{
            $result[] = $value;
        }

        return $result;
    }
}

try {
    $optionsLinksArray = json_decode($optionsLinks, true);

    $result = [];
    if(is_array($value)){
        foreach ($value as $v){
            $result = resultLink($key, $v, $optionsLinksArray);
        }
    }else{
        $result = resultLink($key, $value, $optionsLinksArray);
    }

    return implode(", ", $result);
}catch (Exception $e ){
    $modx->log(1, "Ошибка в присвоении ссылки опциям товара");
}

return [];

