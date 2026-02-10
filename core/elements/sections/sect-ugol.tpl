<section class="wrapper">
    <div class="about-gallery">
        {set $images = [
        '/assets/template/img/ugol/1.jpg',
        '/assets/template/img/ugol/2.jpg',
        '/assets/template/img/ugol/3.jpg',
        '/assets/template/img/ugol/4.jpg',
        '/assets/template/img/ugol/5.jpg',
        '/assets/template/img/ugol/6.jpg'
        ]}

        <div class="about-gallery__img-wrap">
            <img class="about-gallery__img" src="/assets/template/img/ugol/1.jpg">
        </div>
        <div class="swiper">
            <div class="swiper-container">
                <div class="swiper-buttons">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
                <div class="about-gallery__slider swiper-wrapper">
                    {foreach $images as $idx => $img}
                    <div data-fancybox="pilorama" href="{$img}"
                        class="swiper-slide about-gallery__slider-item{if $idx == 0} hidden{/if}">
                        {set $imgsmall = 'phpthumbon' | snippet : [
                        'input' => $img,
                        'options' => '&w=400&h=272&zc=1'
                        ]}
                        <img class="about-gallery__slider-item-img" src="{$imgsmall}">
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>

    {$content}

</section>