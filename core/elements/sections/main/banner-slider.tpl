{set $sliders = [
    [
        'uri' => '/show-room/',
        'image' => '/assets/template/img/banners-slider/kirpich-m/3.jpg'
    ],
]}
<section class="banner-slider">
    <div class="wrapper">
        <div class="banner-slider__row">
            <div class="banner-slider__big swiper">
                <div class="banner-slider__big-wrapper swiper-wrapper">
                    {foreach $sliders as $slider}
                    <a class="banner-slider__big-item swiper-slide" href="{$slider['uri']}">
                        <img src="{$slider['image']}?v=2">
                    </a>
                    {/foreach}
                </div>
{*                <div class="swiper-button swiper-button-next"></div>*}
{*                <div class="swiper-button swiper-button-prev"></div>*}
{*                <div class="swiper-pagination"></div>*}
            </div>
            <div class="banner-slider__small">
                <a class="banner-slider__small-button" href="/oblicovochnye/">
                    В каталог
                    <svg class="svg icon-arrow" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                        <use xlink:href="/assets/template/img/svg-sprite.svg#icon-arrow"></use>
                    </svg>
                </a>
                <a class="banner-slider__small-item" href="/oblicovochnye/">
                    <img src="/assets/template/img/banners-slider/kirpich-m/4-1.jpg">
                </a>
            </div>
        </div>
    </div>
</section>