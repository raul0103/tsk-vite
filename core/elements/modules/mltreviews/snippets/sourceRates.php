<?php

try{
  require_once MODX_CORE_PATH."elements/modules/mltreviews/services/MLTReviewsToolkit.class.php";

  $toolkit = new MLTReviewsToolkit($modx);

  $rate = $toolkit->getCommonRate();

  $output = [];
  $output['all'] = $toolkit->rateFormat($rate);

  $sources = [ 'yandex', 'google', '2gis' ];

  foreach($sources as $source){
    $r = $toolkit->getSourceRate($source);
    $output[$source] = $toolkit->rateFormat($r);
  }

  return $output;
}catch(Exception $e){
  return;
}