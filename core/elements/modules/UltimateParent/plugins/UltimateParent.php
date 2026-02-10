<?php
$eventName = $modx->event->name;
if($eventName != 'OnDocFormSave')return;
//$modx->log(xPDO::LOG_LEVEL_ERROR, $resource->get('class_key'));
if($resource->get('class_key') != 'msProduct')return;
$id = $resource->get('id');
//$modx->log(xPDO::LOG_LEVEL_ERROR, "product id: ".$id);
try{
  include_once MODX_CORE_PATH."elements/modules/UltimateParent/services/UltimateParentService.inc.php";
  $svc = new UltimateParentService($modx);
  $up = $svc->getUltimateParent($id, $resource);
  //$modx->log(xPDO::LOG_LEVEL_ERROR, "Ultimate parent: ".$up );
  $svc->setUltimateParent($id, $up);
}catch(Exception|Error $e) {
  $modx->log(xPDO::LOG_LEVEL_ERROR, $e->getMessage());
}