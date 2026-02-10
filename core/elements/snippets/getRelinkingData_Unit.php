<?php
$options = $modx->resource->loadData()->get('options');

// Данный способо не подходит, так как если масса у товара не заполнена, она вообще не попадет в выборку, поэтому проверку на massa и unit делаем в цикле
// if ($options['massa'][0]) {
//     $whereMassa = '"massa:!=": "' . $options['massa'][0] . '",';
// }
// if ($options['unit'][0]) {
//     $whereUnit = '"unit:!=": "' . $options['unit'][0] . '",';
// }
$optionFilters = '{' . $whereMassa . $whereUnit . '"proizvoditel:=": "' . $options['proizvoditel'][0] . '", "teplotvornost-kkal-kg:=": "' . $options['teplotvornost-kkal-kg'][0] . '", "zolnost:=": "' . $options['zolnost'][0] . '", "vlazhnost:=": "' . $options['vlazhnost'][0] . '", "sera:=": "' . $options['sera'][0] . '", "marka:=": "' . $options['marka'][0] . '", "frakciya:=": "' . $options['frakciya'][0] . '", "vyhod-letuchih:=": "' . $options['vyhod-letuchih'][0] . '"}';

$json = $modx->runSnippet('msProducts', [
    'parents' => 0,
    'resources' => '-' . $modx->resource->id,
    'depth' => 9000,
    'limit' => 100,
    'optionFilters' => $optionFilters,
    'context' => $modx->resource->context_key,
    'tpl' => '@INLINE "{$id}": { "unit":"{$_pls[\'unit\'][0]}","massa":"{$_pls[\'massa\'][0]}" },',
    'tplWrapper' => '@INLINE { [[+output]] } ',
]);

$json = preg_replace('~[\r\n]+~', '', $json);
$json = str_replace(', }', '}', $json);
$products = json_decode($json, 1);

$result['item_unit'] = [];
foreach ($products as $id => $product) {
    if ($product['unit'] !== $options['unit'][0] && $product['massa'] !== $options['massa'][0]) {
        $result['item_unit'][$id] = $product['unit'];
    }
}

return $result;
