{set $contex_key = $_modx->context.key}
{set $params = [
    'krovlya' => [
        'small-banner-url' => 134003
    ]
]}

<section class="main_banner_section">
    <div class="wrapper">
        <div class="main_banner_block">
            <div class="main_banner_wrapper">
                {set $slider = [
                    '001.jpg','003.jpg','004.jpg'
                ]}
                <div class="swiper main_slider_type1" >
                    <div class="swiper-wrapper">
                        {foreach $slider as $slide}
                            <div class="swiper-slide">
                                <img src="assets/images/banner_v2/{$contex_key}/{$slide}">
                            </div>
                        {/foreach}
                    </div>
                </div>
                <button data-btn-key="header-link" data-fancybox="" data-src="#header-callback">Заказать</button>
                <div class="navigation_row">
                    <div class="main_slider_type1_prev"></div>
                    <div class="main_slider_type1_next"></div>
                </div>
                <div class="pagination_row"></div>
            </div>
            <div class="main_banneer_offside">
                <img src="assets/images/banner_v2/{$contex_key}/off001.jpg">
                <a href="{$_modx->makeUrl($params[$contex_key]['small-banner-url'])}">Перейти</a>
            </div>
        </div>
    </div>
</section>