{set $all_reviews ='@FILE modules/mltreviews/snippets/mltReviewItems.php' | snippet : [
'ratingRowClass' => 'mlt-reviews__item-header-rating',
'ratingItemClass' => 'mlt-reviews__item-header-rating-item',
'context' => $_modx->context.key
'tpl' => '@FILE: modules/mltreviews/chunks/tplItemReview.tpl',
'tplOuter' => '@FILE: modules/mltreviews/chunks/tplItemOuter.tpl'
]}

{set $ya_reviews ='@FILE modules/mltreviews/snippets/mltReviewItems.php' | snippet : [
'ratingRowClass' => 'mlt-reviews__item-header-rating',
'ratingItemClass' => 'mlt-reviews__item-header-rating-item',
'context' => $_modx->context.key
'tpl' => '@FILE: modules/mltreviews/chunks/tplItemReview.tpl',
'tplOuter' => '@FILE: modules/mltreviews/chunks/tplItemOuter.tpl'
'source' => 'yandex'
]}

{set $goog_reviews ='@FILE modules/mltreviews/snippets/mltReviewItems.php' | snippet : [
'ratingRowClass' => 'mlt-reviews__item-header-rating',
'ratingItemClass' => 'mlt-reviews__item-header-rating-item',
'context' => $_modx->context.key
'tpl' => '@FILE: modules/mltreviews/chunks/tplItemReview.tpl',
'tplOuter' => '@FILE: modules/mltreviews/chunks/tplItemOuter.tpl'
'source' => 'google'
]}

{set $_2gis_reviews ='@FILE modules/mltreviews/snippets/mltReviewItems.php' | snippet : [
'ratingRowClass' => 'mlt-reviews__item-header-rating',
'ratingItemClass' => 'mlt-reviews__item-header-rating-item',
'context' => $_modx->context.key
'tpl' => '@FILE: modules/mltreviews/chunks/tplItemReview.tpl',
'tplOuter' => '@FILE: modules/mltreviews/chunks/tplItemOuter.tpl'
'source' => '2gis'
]}

{set $srcRates = '@FILE modules/mltreviews/snippets/sourceRates.php' | snippet}

<div class="sect-otzyvy__tabs">
    <a href="#" class="sect-otzyvy__tab-button active" data-source="all">Все отзывы</a>
    {if $ya_reviews.amount}
    <a href="#" class="sect-otzyvy__tab-button" data-source="yandex"><img src="assets/template/tpl-imgs/review-icons/yandex.svg"> Яндекс {$srcRates.yandex}</a>
    {/if}
    {if $goog_reviews.amount}
    <a href="#" class="sect-otzyvy__tab-button" data-source="google"><img src="assets/template/tpl-imgs/review-icons/google.png"> Google {$srcRates.google}</a>
    {/if}
    {if $_2gis_reviews.amount}
    <a href="#" class="sect-otzyvy__tab-button" data-source="2gis"><img src="assets/template/tpl-imgs/review-icons/2gis.png"> 2GIS {$srcRates['2gis']}</a>
    {/if}
</div>

<div class="sect-otzyvy__slide-source" data-source="all" style="display: none;">
    {$all_reviews.output}
</div>
<div class="sect-otzyvy__slide-source" data-source="yandex" style="display: none;">
    {$ya_reviews.output}
</div>
<div class="sect-otzyvy__slide-source" data-source="google" style="display: none;">
    {$goog_reviews.output}
</div>
<div class="sect-otzyvy__slide-source" data-source="2gis" style="display: none;">
    {$_2gis_reviews.output}
</div>

<div class="swiper-container sect-otzyvy__slider-container">
    <div class="swiper-wrapper sect-otzyvy__slider">
        {$all_reviews.output}
    </div>
</div>

<div class="swiper-buttons sect-otzyvy__swiper-buttons" style="display: none;">
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>