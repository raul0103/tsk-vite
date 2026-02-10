<section class="wrapper">
    <div class="about-gallery">
        {set $images = [
        "/assets/template/img/plitaopsb/sklad/1.jpg",
        "/assets/template/img/plitaopsb/sklad/4.jpg" ,
        "/assets/template/img/plitaopsb/sklad/5f4eee124a62211d66068115d6840ff9.jpg",
        "/assets/template/img/plitaopsb/sklad/9.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_1.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_2.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_3.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_4.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_5.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_6.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_7.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_8.jpg",
        "/assets/template/img/plitaopsb/sklad/Screenshot_9.jpg",
        "/assets/template/img/plitaopsb/sklad/склад.jpg",
        ]}

        <div class="about-gallery__img-wrap">
            <img class="about-gallery__img" src="/assets/template/img/plitaopsb/sklad/Screenshot_5.jpg">
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

    {set $sklads = [
    [
    "id" => 132685,
    "pagetitle" => "Склад метро Пионерская"
    ],
    [
    "id" => 132686,
    "pagetitle" => "Склад Парнас"
    ],
    [
    "id" => 132687,
    "pagetitle" => "Склад Красносельский район"
    ],
    [
    "id" => 132688,
    "pagetitle" => "Склад Шушары"
    ],
    [
    "id" => 132689,
    "pagetitle" => "Склад Полюстрово"
    ],
    [
    "id" => 132690,
    "pagetitle" => "Склад Мурино"
    ],
    [
    "id" => 132691,
    "pagetitle" => "Склад Новосаратовка"
    ],
    [
    "id" => 132692,
    "pagetitle" => "Склад метро Волковская"
    ],
    [
    "id" => 132693,
    "pagetitle" => "Склад метро Ладожская"
    ],
    [
    "id" => 132694,
    "pagetitle" => "Склад Колтуши"
    ],
    [
    "id" => 132695,
    "pagetitle" => "Склад Предпортовая"
    ],
    [
    "id" => 132696,
    "pagetitle" => "Склад Шафировский проспект"
    ],
    [
    "id" => 132697,
    "pagetitle" => "Склад метро Парк Победы"
    ],
    [
    "id" => 132698,
    "pagetitle" => "Склад Гатчина"
    ],
    [
    "id" => 132699,
    "pagetitle" => "Склад Ржевка"
    ]
    ]}

    <div class="sect-pilorama__addresses-wrap content-block">
        <p class="sect-pilorama__address-header">Адреса складов</p>
        {foreach $sklads as $sklad}
            <p class="sect-pilorama__address"><a href="{$sklad['id'] | url}">{$sklad['pagetitle']}</a></p>
        {/foreach}
        </p>
    </div>

    {$content}

</section>