<?php
try {
  $path = $modx->getOption('input', $scriptProperties, false);
  if(!$path)return;
  $host = $modx->getOption('http_host', null, false);
  if(!$host)return $path;
  $p = stripos($path, $host);
  if($p === false)return $path;
  $finalPos = $p + strlen($host) + 1;
  return substr($path, $finalPos);
}catch(Throwable $t) {
}