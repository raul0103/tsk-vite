<?php
session_start();

// Откликаться будет ТОЛЬКО на ajax запросы
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest' || empty($_REQUEST['ajax_action'])) {
    return;
}

$result = '';
switch ($_REQUEST['ajax_action']) {
    case 'getProductVideo':
        $result = json_encode(['video' => $modx->resource->getTVValue('video')], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        break;
    case 'setSessionArticleFavorites':
        $_SESSION['article_favorites'] = $_REQUEST['data'];
        $result = json_encode(['status' => 'success'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        break;
    case "prdouctImage":

        $product_id = $_REQUEST['product_id'];
        $sql = "SELECT * FROM modx_ms2_product_files WHERE product_id = " . $product_id;
        $statement = $modx->query($sql);
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
        $count = count($rows);

        if ($count > 0) {
            $site_url = $modx->getOption("site_url");
            $site_url = "https://krovlyasp.ru/";
            $src = $site_url . (isset($rows[1]) ? $rows[1]['url'] : $rows[0]['url']); // Выбираем вторую картинку из директории small
        }

        $result = $modx->toJSON(
            [
                'success' => true,
                'count' => $count,
                'src' => $src
            ]
        );
        break;
    case 'articleLike':
        if ($_REQUEST['article_id']) {
            $sql = "SELECT * FROM modx_site_tmplvar_contentvalues WHERE contentid = {$_REQUEST['article_id']} AND tmplvarid = 42";
            $statement = $modx->query($sql);
            $rows = $statement->fetchAll(PDO::FETCH_ASSOC);

            if (count($rows) == 0) {
                $count = 0;
            } else {
                $count = $rows[0]['value'];
            }

            if ($_REQUEST['increment'] == 'true') {
                $count = $count + 1;
            } else {
                $count = $count - 1;
                $count = $count < 0 ? 0 : $count;
            }

            if (count($rows) == 0) {
                $sql = "INSERT INTO modx_site_tmplvar_contentvalues (value,contentid,tmplvarid) VALUES ($count,{$_REQUEST['article_id']},42)";
            } else {
                $sql = "UPDATE modx_site_tmplvar_contentvalues SET value = $count WHERE contentid = {$_REQUEST['article_id']} AND tmplvarid = 42";
            }

            $exec = $modx->exec($sql);

            $result = json_encode(['status' => 'success', 'message' => $exec], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        } else {
            $result = json_encode(['status' => 'error', 'message' => 'Не указан article_id'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        }
        break;
    case 'instruction':
        $pdoTools = $modx->getService("pdoTools");
        $result = $pdoTools->runSnippet("@FILE snippets/instructionArray.php");
        break;
    case 'pkt-calc':
        if (empty($_REQUEST['tolsh'])) {
            $result = json_encode(['status' => false], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        } else {
            $limit = 10;
            $sql = "SELECT sc.id FROM modx_site_content AS sc
            LEFT JOIN modx_ms2_product_options AS po ON po.product_id = sc.id
            WHERE sc.context_key = 'policarbonat'
            AND po.`key` = 'item_thickness'
            AND po.value = " . $_REQUEST['tolsh'] . "
            LIMIT $limit";
            $statement = $modx->query($sql);
            $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
            if ($rows) {
                $ids = '';
                foreach ($rows as $row) {
                    $ids .= $row['id'] . ',';
                }
                $data = $modx->runSnippet('msProductsMy', [
                    'parents' => 0,
                    'resources' => $ids,
                    'tpl' => '@FILE sections/popular/pop-slide.tpl',
                    // 'tpl' => '@INLINE 
                    // <div class="pkt-calc__products__item">
                    //     <div class="pkt-calc__products__item-image"><img src="{$image}"></div>
                    //     <div class="pkt-calc__products__item-title">{$pagetitle}</div>
                    //     <div class="pkt-calc__products__item-price">{$price} руб</div>
                    // </div>'
                ]);
                $result = json_encode(['status' => true, 'data' => $data], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            } else {
                $result = json_encode(['status' => false], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            }
        }
        break;
}

exit($result);
