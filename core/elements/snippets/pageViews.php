<?php

/**
 * Увеличивает кол-во просмотров страницы
 */

$resource = $modx->getObject('modResource', $modx->resource->id);
$tv_value = intval($resource->getTVvalue($tv));

$tv = $modx->getObject('modTemplateVar', array('name' => 'page_views'));
$tvs = $modx->getObject('modTemplateVarResource', array('tmplvarid' => $tv->id, 'contentid' => $resource->get('id')));
if ($tvs) {
    $viewTv = $tvs->get('value');
    $tvs->set('value', intval($viewTv) + 1);

    $tvs->save();
} else {
    $tvn = $modx->newObject('modTemplateVarResource');
    $tvn->set('tmplvarid', $tv->id);
    $tvn->set('contentid', $resource->get('id'));
    $tvn->set('value', 1);

    $tvn->save();
}
