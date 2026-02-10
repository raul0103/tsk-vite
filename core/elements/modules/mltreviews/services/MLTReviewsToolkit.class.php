<?php

class MLTReviewsToolkit {
  public $modx;
  public $cacheP;
  public function __construct($modx) {
    $this->modx = $modx;
    if(!isset($modx->mainService)){
      $modx->getService('mainService', 'mainService', MODX_CORE_PATH . 'components/mltreviews/services/');
    }
    $cacheName = 'MLTReviewsToolkit';
    $this->cacheP = $modx->cacheManager->getCacheProvider('', [
      xPDO::OPT_CACHE_KEY => 'default/services/' . $cacheName . '/' . $modx->context->key . '/'
    ]);
  }

  public function __destruct() {

  }

  public function log($m) {
    file_put_contents(MODX_BASE_PATH."/output.txt", $m, FILE_APPEND);
  }

  public function execute($st) {
    $res = $st->execute();
    ++$this->modx->executedQueries;
    return $res;
  }

  //Условие для запроса контекста
  public function whereContext($q) {
    $q->where([
      ['context:is' => null],
      ['context' => $this->modx->context->key]
    ], xPDOQuery::SQL_OR);
  }

  public function wherePublished($q) {
    $q->where(['published' => 1]);
  }

  //Условие для запроса - источник = $source или null
  public function whereSourceOrNull(string $source, $q) {
    $q->where([
      ['source:is' => null],
      ['source' => $source]
    ], xPDOQuery::SQL_OR);
  }

  public function whereSource(string $source, $q) {
    $q->where(['source' => $source]);
  }

  //Выбор whereSource или whereSourceOrNull в зависимости от источника (Яндекс)
  //Высокоуровневый метод бизнес-логики
  public function whereSourceBusiness(string $source, $q) {
    if($source == 'yandex')$this->whereSourceOrNull($source, $q);
    else $this->whereSource($source, $q);
  }

  //Общий рейтинг по всем источникам
  public function getCommonRate() {
    $r = $this->cacheP->get('common_rate');
    if($r)return $r;
    $q = $this->modx->newQuery('mltReview');
    $q->select("avg(rating) as rate");
    $this->wherePublished($q);
    $this->whereContext($q);
    $st = $q->prepare();
    //echo $q->toSQL()."\n";
    $res = $this->execute($st);
    $res = $st->fetchAll(PDO::FETCH_ASSOC);
    $res = floor($res[0]['rate']*10)/10; //округление до десятых
    $this->cacheP->set('common_rate', $res);
    return $res; 
  }

  public function getSourceRate(string $source) {
    $r = $this->cacheP->get($source.'_rate');
    if($r)return $r;
    $q = $this->modx->newQuery('mltReview');
    $q->select("avg(rating) as rate");
    if($source == 'yandex')$this->whereSourceOrNull($source, $q);
    else $this->whereSource($source, $q);
    $this->wherePublished($q);
    $this->whereContext($q);
    $st = $q->prepare();
    $res = $this->execute($st);
    $res = $st->fetch(PDO::FETCH_ASSOC);
    $res = floor($res['rate']*10)/10;
    $this->cacheP->set($source.'_rate', $res);
    return $res;
  }

  public function rateFormat($rate) {
    return sprintf("%.1F", $rate);
  }

  //Кол-во отзывов в текущем контексте
  public function reviewAmount() {
    $r = $this->cacheP->get('reviewAmount');
    if($r)return $r;
    $q = $this->modx->newQuery('mltReview');
    $q->select("count(*) as cnt");
    $this->wherePublished($q);
    $this->whereContext($q);
    $st = $q->prepare();
    //echo $q->toSQL()."\n";
    $res = $this->execute($st);
    $res = $st->fetchAll(PDO::FETCH_ASSOC);
    $res = $res[0]['cnt']*1; //Возвратить число
    $this->cacheP->set('reviewAmount', $res);
    return $res;
  }

}