<?php

$path = $modx->getOption("path", $scriptProperties, "");
$image = $modx->getOption("image", $scriptProperties, "");
$ext = $modx->getOption("ext", $scriptProperties, ".jpg,.jpeg,.png");

if(!$path){
    return;
}

if(!$image){
    return;
}

$full_path = MODX_BASE_PATH . $path;
$ext = explode(",", $ext);

foreach ($ext as $e){
    if(file_exists($full_path . $image . $e)){
        return $path . $image . $e;
    }
}

return $full_path . $image . $e;
