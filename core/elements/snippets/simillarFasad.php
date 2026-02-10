<?php

require_once MODX_CORE_PATH . "elements/class/Product/Product.php";

if(in_array(36783, $modx->getParentIds($modx->resource->parent, 10, ['context_key' => $modx->resource->context_key])))
{
    $charactes = [
        "tip" => "Комплектующие",
        "proizvoditel" => $modx->resource->proizvoditel[0],
        "ottenok" => $modx->resource->ottenok[0],
    ];
    $requiredCharacterMatches = 3;
    $sortCharacter = "tipkomplik";
    $sort = [
        "J-профиль" => 1,
        "H-профиль" => 2,
        "Планка начальная" => 3,
        "Планка соединительная" => 4
    ];
}
elseif(in_array(34819, $modx->getParentIds($modx->resource->parent, 10, ['context_key' => $modx->resource->context_key]))){
    $charactes = [
        "tip" => "Комплектующие",
        "proizvoditel" => $modx->resource->proizvoditel[0],
        "ottenok" => $modx->resource->ottenok[0],
    ];
    $requiredCharacterMatches = 3;
    $sortCharacter = "tipkomplik";
    $sort = [
        "J-профиль" => 1,
        "H-профиль" => 2,
        "Планка начальная" => 3,
        "Планка соединительная" => 4
    ];
}elseif(in_array(36784, $modx->getParentIds($modx->resource->parent, 10, ['context_key' => $modx->resource->context_key]))){
    $charactes = [
        "tip" => "Комплектующие",
        "proizvoditel" => $modx->resource->proizvoditel[0],
        "ottenok" => $modx->resource->ottenok[0],
    ];
    $requiredCharacterMatches = 3;
    $sortCharacter = "tipkomplik";
    $sort = [
        "J-профиль" => 1,
        "H-профиль" => 2,
        "Планка начальная" => 3,
        "Планка соединительная" => 4
    ];
}

if(!isset($charactes)) return[];

$product = new Product($modx);
$idsProduct = $product->similarProduct->forCharacters($charactes, $requiredCharacterMatches);

return $product->similarProduct
->sortForCharacter($idsProduct,	$sortCharacter,
    $sort);
