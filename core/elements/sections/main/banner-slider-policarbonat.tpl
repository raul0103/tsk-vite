{set $sliders = [
[
'image' => '/assets/template/img/banners-slider/policarbonat/1.jpg',
'button' => true
],
[
'image' => '/assets/template/img/banners-slider/policarbonat/2.jpg'
],
[
'image' => '/assets/template/img/banners-slider/policarbonat/3.jpg'],
]}
<section class="banner-slider" style="margin-bottom: 60px;">
    <div class="wrapper">
        <div class="banner-slider__row">
            <div class="banner-slider__big swiper" style="max-width:100%">
                <div class="banner-slider__big-wrapper swiper-wrapper">
                    {foreach $sliders as $slider}
                        <a class="banner-slider__big-item swiper-slide" {if $slider['uri']}href="{$slider['uri']}"{/if}>
                            <img src="{$slider['image']}">
                            {if $slider['button']}
                                <span
                                data-btn-key="banner-main"
                                data-fancybox=""
                                data-src="#cost-delivery"
                                class="banner__slide-link delivery__banner-btn-text yellow-btn"
                            >
                                <svg class="banner__text-2" viewBox="0 0 235 50">
                                <text x="0" y="21">Оставить заявку и получить</text>
                                <text x="16" y="40">скидку 30% на доставку</text>
                                </svg>
                            </span>
                        {/if}
                        </a>
                    {/foreach}
                </div>
                <div class="swiper-button swiper-button-next"></div>
                <div class="swiper-button swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
</section>