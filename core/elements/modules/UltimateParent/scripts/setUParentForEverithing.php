<?php

/*
  Скрипт заполняет кастомное поле ultimate_parent в таблице ms2_products
  Запустить скрипт из консоли достаточное количество раз
*/

$curr_offset = @$_SESSION['spfe_offset'];
$limit = 500;
$affected = 0;

try {
  include_once MODX_CORE_PATH."elements/modules/UltimateParent/services/UltimateParentService.inc.php";
  $svc = new UltimateParentService($modx);

  $qc = $modx->query("SELECT count(*) as cnt from modx_ms2_products");
  $qc->execute();
  $crows =$qc->fetchAll(PDO::FETCH_ASSOC);
  $count = $crows[0]['cnt'];

  if(!$curr_offset)$curr_offset = 0;

  $q = $modx->query("SELECT id from modx_ms2_products limit $curr_offset,$limit");
  if(!$q)throw new Exception('Can\'t build query');
  $res = $q->execute();
  if(!$res)throw new Exception('Can\'t execute query');
  $rows = $q->fetchAll(PDO::FETCH_ASSOC);

  foreach($rows as $row) {
    $id = $row['id'];
    //echo $id."\n";
    $up = $svc->getUltimateParent($id);
    $svc->setUltimateParent($id, $up);
    ++$affected;
  }

}catch(Exception $e) {
  $modx->log(xPDO::LOG_LEVEL_ERROR, $e->getMessage());
}

$curr_offset += $affected;
$_SESSION['spfe_offset'] = $curr_offset;
echo "Current offset: $curr_offset/$count";
//unset $_SESSION['spfe_offset'];