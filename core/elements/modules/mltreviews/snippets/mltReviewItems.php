<?php
/**
 * @var int $user_reviews - Если 1 то выведет ожидающие модерации отзывы пользователя
 * @var int $resource_id - ID ресурса к которому привязаны отзывы
 * @var string $tpl - Обертка отзыва
 * @var string $tplOuter - Обертка отзывов
 * @var string $ratingRowClass - Класс для обертки рейтинга
 * @var string $ratingItemClass - Класс для элемента рейтинга
 * @var string $source - источник отзывов, будут выведены только отзывы из этого источника
 * @var string $context - брать отзывы с этого контекста + те, где контекст не заполнен
 */

if (!$pdoTools = $modx->getService("pdoTools")) return;

// Если это вызов неопубликованных комментариев пользователя, то проверяем их дату, и если дата больше user_reviews_days_difference то выводим его на страницу как опубликованный
if (!function_exists('publishedUserReview')) {
    function publishedUserReview($review)
    {
        $user_reviews_days_difference = 3; // Если отзыв пользователя старше 3х дней - опубликовать

        $date_time = new DateTime($review->createdon);
        $current_date = new DateTime();

        $interval = $current_date->diff($date_time);
        $days_difference = $interval->days;

        if ($days_difference > $user_reviews_days_difference) {
            return true;
        } else {
            return false;
        }
    }
}

$modx->getService('mainService', 'mainService', MODX_CORE_PATH . 'components/mltreviews/services/');

try{

    require_once MODX_CORE_PATH."elements/modules/mltreviews/services/MLTReviewsToolkit.class.php";
    $toolkit = new MLTReviewsToolkit($modx);

    if (empty($tpl)) {
        $tpl = '@FILE modules/mltreviews/chunks/tplItemReview.tpl';
    }
    if (empty($tplOuter)) {
        $tplOuter =  '@FILE modules/mltreviews/chunks/tplItemOuter.tpl';
    }

    $user_session = $_REQUEST['PHPSESSID'] ?: $_COOKIE['PHPSESSID'];

    $where = [];
    if ($user_reviews) {
        $where['session'] = $user_session;
        $where['published'] = 0;
    }

    if ($resource_id) {
        $where['resource_id'] = $resource_id;
    }

    $query = $modx->newQuery('mltReview');

    if ($source)$toolkit->whereSourceBusiness($source, $query);

    if ($limit) {
        $query->limit($limit);
    }
    if(!empty($where)){
        $query->where($where);
    }

    $query->sortby('createdon',"DESC");

    if ($context)$toolkit->whereContext($query);


    $items = $modx->getCollection('mltReview', $query);

    $output = '';
    $amount = 0;

    foreach ($items as $item) {
        if (
            ($user_reviews && !publishedUserReview($item)) || // Если это найденные неопубликованные отзывы пользователя и они меньше определенного времени - публикуем
            (!$user_reviews && $user_session == $item->session && publishedUserReview($item)) // Если это отзыв принадлежит пользователю, и он старше 3х дней - публикуем
        ) {
            $item->set('published', 1);
        }

        if (!$item->published) continue;

        $rating_html = "<div class='$ratingRowClass'>";
        for ($i = 1; $i <= 5; $i++) {
            if ($i <= $item->rating) $active_class = 'active';
            else $active_class = '';

            $rating_html .= "<span class='$ratingItemClass $active_class'></span>";
        }
        $rating_html .= "</div>";

        $enen_odd = $amount % 2; //0 - четный индекс, 1 - нечетный
        $logo = '/assets/template/tpl-imgs/review-icons/yandex.svg';
        switch ($item->get('source')){
            case 'yandex':
                $logo = '/assets/template/tpl-imgs/review-icons/yandex.svg';
            break;
            case 'google':
                $logo = '/assets/template/tpl-imgs/review-icons/google.png';
            break;
            case '2gis':
                $logo = '/assets/template/tpl-imgs/review-icons/2gis.png';
            break;
        }

        //file_put_contents(MODX_BASE_PATH.'/output.txt', print_r($item, true));
        $output .= $pdoTools->getChunk($tpl, array_merge(['rating_html' => $rating_html, 'idx' => $amount, 'evenodd' => $enen_odd, 'logo' => $logo], $item->toArray()));
        $amount++;
    }

    // Оборачиваем результаты
    $output = $pdoTools->getChunk($tplOuter, [
        'items' => $output,
        'amount' => $amount
    ]);

    //$output = trim($output);

    //file_put_contents(MODX_BASE_PATH."/output.txt", $source."\n", FILE_APPEND);
    //file_put_contents(MODX_BASE_PATH."/output.txt", print_r($output, true), FILE_APPEND);

    return ['output' => $output,
            'amount' => $amount];

}catch(Exception $e){

}