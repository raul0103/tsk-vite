<?php

require_once MODX_CORE_PATH . "elements/class/Product/Product.php";

class SimilarProduct
{
    protected $product;

    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    /*
     * $idsProduct = $product->similarProduct->forCharacters([
        "tip" => "Комплектующие", "proizvoditel" => "CertainTeed", "ottenok" => ""
     ], 2)
     */
    public function forCharacters(array $characters, int $requiredCharacterMatches): array
    {
        global $modx;
        $where = [];

        foreach($characters as $key => $value)
        {
            $element = [];
            $element['OR:' . "key" . ":="] = $key;
            $element["value:="] = $value;
            $where[] = $element;
        }

        $query = $modx->newQuery("msProductOption");
        $query->where(['modResource.context_key' => $this->product->getContext()]);
        $query->innerJoin('modResource','modResource', "modResource.id = msProductOption.product_id");
        $query->where($where);
        $query->prepare();
        $query->stmt->execute();

        $options = $query->stmt->fetchAll(PDO::FETCH_ASSOC);
        $products = [];

        foreach($options as $option)
        {
            $products[] = $option['msProductOption_product_id'];
        }

        $charecterMatches = array_count_values($products);

        $idProducts = [];

        foreach($charecterMatches as $idProduct => $count){

            if($count >= $requiredCharacterMatches)
            {
                $idProducts[] = $idProduct;
            }
        }

        return $idProducts;
    }



    //$product->similarProduct->sortForCharacter($idsProduct,	"tipkomplik", ["J-профиль" => 1, "H-профиль" => 2, "Планка начальная" => 3, "Планка соединительная" => 4])
    public function sortForCharacter(array $productsIds, string $characterKey, array $characterValues)
    {
        global $modx;
        $query = $modx->newQuery("msProductOption");
        $query->where(['product_id:IN' => $productsIds, "key" => $characterKey]);
        $query->prepare();
        $query->stmt->execute();
        $options = $query->stmt->fetchAll(PDO::FETCH_ASSOC);
        $products = [];

        usort($options, function($a, $b) use ($characterValues){
            $aOrder = $characterValues[$a['msProductOption_value']] ?? PHP_INT_MAX;
            $bOrder = $characterValues[$b['msProductOption_value']] ?? PHP_INT_MAX;

            return $aOrder <=> $bOrder;
        });

        foreach($options as $option)
        {
            $products[] = $option['msProductOption_product_id'];
        }

        return $products;

    }
}