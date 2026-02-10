<?php

$ratingRowClass = $modx->getOption('ratingRowClass', $scriptProperties, 'reviews-popup__rate');
$ratingItemClass = $modx->getOption('ratingItemClass', $scriptProperties, 'reviews-popup__rate-item');
$context = $modx->getOption('context', $scriptProperties, $modx->context->key);
$output = [];

try{
require_once MODX_CORE_PATH."elements/modules/mltreviews/services/MLTReviewsToolkit.class.php";
$toolkit = new MLTReviewsToolkit($modx);

$cacheName = 'reviews-data';
$cacheKey = 'reviews-data';
$cacheP = $modx->cacheManager->getCacheProvider('', [
  xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheName . '/' . $modx->context->key . '/'
]);

$r = $cacheP->get($cacheKey);
if($r)return $r;

$st = $modx->query("SELECT avg(rating) as rate, count(*) as cnt from modx_mltreviews where published = 1 and (context is null or context = '$context')");
//file_put_contents(MODX_BASE_PATH."/output.txt", print_r($st, true), FILE_APPEND);

  $res = $st->fetchAll(PDO::FETCH_ASSOC);
  $rate = $toolkit->rateFormat(floor($res[0]['rate']*10)/10); 
  $output['rate'] = $rate; /////////////////////////////
  $review_cnt = $res[0]['cnt'];
  $suffix = ' отзывов';
  $reminder = $review_cnt % 100;
  if($reminder < 21 && $reminder > 4)$suffix = ' отзывов';
  else{
    switch($review_cnt % 10){
      case 1:
        $suffix = ' отзыв';
        break;
      case 2:
      case 3:
      case 4:
        $suffix = ' отзыва';
      break;
    }
  }


  $output['count_txt'] = $review_cnt.$suffix; ////////////////////////

  $rating_html = "<div class='$ratingRowClass'>";
  for ($i = 1; $i <= 5; $i++) {
      if ($i <= $rate) $active_class = 'active';
      else $active_class = '';
      $rating_html .= "<span class='$ratingItemClass $active_class'></span>";
  }
  $rating_html .= "</div>";
  $output['rating_html'] = $rating_html; ///////////////////////////

  $cacheP->set($cacheKey, $output);
  return $output;
}catch(Exception $e){
  return;
}