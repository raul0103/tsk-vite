<?php

try{

  require_once MODX_CORE_PATH."elements/modules/mltreviews/services/MLTReviewsToolkit.class.php";
  $toolkit = new MLTReviewsToolkit($modx);

  return $toolkit->reviewAmount();

}catch(Exception $e){
  return 0;
}