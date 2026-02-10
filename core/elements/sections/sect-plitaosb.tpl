<section class="wrapper">
    <div class="about-gallery">
        {set $images = [
        '/assets/template/img/plitaopsb/raspil/ceh-pargolovo.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-pargolovo1.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-pargolovo3.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-pargolovo-2.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-revolucii.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-revolucii1.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-revolucii2.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-sergievo.jpg',
        '/assets/template/img/plitaopsb/raspil/ceh-sergievo2.jpg'
        ]}

        <div class="about-gallery__img-wrap">
            <img class="about-gallery__img" src="/assets/template/img/plitaopsb/raspil/ceh-pargolovo.jpg">
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