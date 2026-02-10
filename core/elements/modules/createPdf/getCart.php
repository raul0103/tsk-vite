<?php
header("Access-Control-Allow-Origin: *"); // Allow your client’s origin
header("Access-Control-Allow-Methods: POST, OPTIONS");   // Allow necessary HTTP methods
header("Access-Control-Allow-Headers: Content-Type, X-Requested-With");
header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
  // Respond with 200 OK and the necessary CORS headers
  http_response_code(200);
  exit(0);
}
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'fetch') {return;}
// if ((empty($_POST['action']))||(!isset($_POST))) {return 'no_action';}

$result='';
$scriptProperties = array(
    'json_response' => true,
    'max_count' => 1000,
    'allow_deleted' => false,
    'allow_unpublished' => false
  );
$miniShop2 = $modx->getService('minishop2','miniShop2', MODX_CORE_PATH . 'components/minishop2/model/minishop2/', $scriptProperties);
$miniShop2->initialize($modx->context->key, $scriptProperties);
$cart=$miniShop2->cart->get();
$products = [];
$response = [
  'success' => false,
];
if(!count($cart)) {
  $response['error'] = 'empty cart';
  return json_encode($response);
}
foreach ($cart as &$product){
  $product['article'] = $modx->getObject('msProduct', $product['id'])->get('artikul');
  $product['name'] = $modx->getObject('msProduct', $product['id'])->get('pagetitle');
  $products[] = $product;
}
$response['success'] = true;
$response['products'] = $products;

return json_encode($response, JSON_UNESCAPED_UNICODE);
