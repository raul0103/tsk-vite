{set $contex_key = $_modx->context.key}

<section class="main_banner_section">
    <div class="wrapper">
        <div class="main_banner_block main_banner_block--uteplitel">
            <div class="main_banner_wrapper">
                {set $slider = [
                    'banner1.svg', 'banner2.svg'
                ]}
                <div class="swiper main_slider_type1" >
                    <div class="swiper-wrapper">
                        {foreach $slider as $slide}
                            <div class="swiper-slide">
                                <picture>
                                    <source media="(max-width: 600px)" srcset="assets/template/img/banners-full/{$contex_key}/mobile-{$slide}">
                                    <img src="assets/template/img/banners-full/{$contex_key}/{$slide}">
                                </picture>
                                <button data-btn-key="header-link" data-fancybox="" data-src="#header-callback">Забронировать скидку</button>
                            </div>
                        {/foreach}
                    </div>
                </div>

                <div class="navigation_row">
                    <div class="main_slider_type1_prev"></div>
                    <div class="main_slider_type1_next"></div>
                </div>
                <div class="pagination_row"></div>
            </div>
        </div>
    </div>
</section>