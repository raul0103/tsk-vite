<section class="wrapper">
    <div class="about-gallery">
        {set $images = [
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-01.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-02.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-03.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-04.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-05.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-06.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-07.jpg',
        '/assets/template/img/plitaopsb/delivery/plitaosb-delivery-08.jpg'
        ]}

        <div class="about-gallery__img-wrap">
            <img class="about-gallery__img" src="/assets/template/img/plitaopsb/delivery/plitaosb-delivery-08.jpg">
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
</section>