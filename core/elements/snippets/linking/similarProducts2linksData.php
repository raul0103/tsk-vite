<?php

$similar_products = $modx->getOption('input', $scriptProperties, false);
if(!$input)return;
$output = [];
foreach($similar_products as &$item) {
  $output[$item['id']] = $item['value'];
}
return $output;
