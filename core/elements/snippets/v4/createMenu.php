<?php

$tpl = $modx->getOption("tpl", $scriptProperties, "@FILEchunks/v4/menu.tpl");
$context = $modx->getOption("context", $scriptProperties, $modx->resource->context_key);


$fileMenu = "assets/template/json/menu/v4/$context.json";
if(file_exists($fileMenu)){
    $contentMenu = file_get_contents($fileMenu);
    $menu = json_decode($contentMenu, 1);
}else{
    return;
}

$pdo = $modx->getService("pdoTools");
return $pdo->getChunk($tpl, ["menu" => $menu]);