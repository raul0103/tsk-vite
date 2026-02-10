{if $_modx->resource.context_key == 'policarbonat'}
    {set $linksData = 'getRelinkingDataPolicarbonat' | snippet}
    {set $linksData['format'] = $linksData['razmer-mm']}
{elseif $_modx->resource.context_key == 'plitaosb'}
    {set $linksData = 'getRelinkingOSB' | snippet}
{elseif $_modx->resource.context_key == 'pilomat'}
    {set $linksData = 'getRelinkingPilomat' | snippet}
{else}
    {set $linksData = 'getRelinkingData_FormatThicknessSort' | snippet}
{/if}

{* Данные для блока посередине *}
{set $mc = $_modx->resource.middleContent}
{if $mc >= 2}
    {set $bottomText = 'Мы хотим помочь построить Ваш дом. <a href="tel:' ~ ('phone' | option) ~ '">Звоните</a> или <span data-fancybox data-src="#callback">оставляйте заявку</span>, будем рады Вам помочь!'}
    {set $textItem1 = 'Прямой дилерский договор с заводом-производителем позволяет держать цены ниже среднерыночных.'}
    {set $textItem2 = '4000 плит в наличии на складе. Вы можете приехать и выбрать нужный размер плит, а также убедиться в качестве наших изделий. При срочных заказах доставим заказ в течение 3 часов с момента подачи заявки.'}
    {set $textItem3 = 'Гарантируем качество продукции. Каждое штучное изделие проходит повторную проверку.'}
    {set $textItem4 = 'Получаете товар, проверяете качество и ТОЛЬКО после этого оплачиваете. Никакой предоплаты! Наше главное правило - понятные условия и порядок работы с заказчиком!'}

    {set $header1 = 'Оптовая цена'}
    {set $header2 = 'Наличие на складе'}
    {set $header3 = 'Качество'}
    {set $header4 = 'Оплата "по факту"'}

    {switch $mc}
        {case 2}
            {set $topText = '4 причины купить ОСБ плиту у нас'}
        {case 3}
            {set $topText = '4 причины купить гипсокартон у нас'}
        {case 4}
            {set $topText = '4 причины купить ГВЛ плиту у нас'}
        {case 5}
            {set $topText = '4 причины купить ДСП плиту у нас'}
        {case 6}
            {set $topText = '4 причины купить ЦСП плиту у нас'}
        {case 7}
            {set $topText = '4 причины купить фибролитовую плиту у нас'}
        {case 8}
            {set $topText = '4 причины купить лист фанеры у нас'}
            {set $textItem2 = '4000 наименований в наличии на складе. Вы можете приехать и выбрать нужный размер листа, а также убедиться в качестве наших изделий. При срочных заказах доставим заказ в течение 3 часов с момента подачи заявки.'}
        {case 9}
            {set $topText = '4 причины купить плиту МДВП у нас'}
        {case 10}
            {set $bottomText = $bottomText | replace : 'Мы хотим помочь построить Ваш дом' : 'Мы хотим помочь обустроить Ваш дом или построить теплицу'}
            {set $topText = '4 причины купить поликарбонат у нас'}
        {case 11}
            {set $topText = '4 причины купить пиломатериалы у нас'}
            {set $header1 = 'Лучшая цена'}
            {set $textItem1 = 'Прямые поставки леса и производительное оборудование позволяет выпускать продукцию по ценам ниже среднерыночных.'}
            {set $header2 = 'Наличие на складе'}
            {set $textItem2 = 'Более 400 м3 пиломатериалов всегда на складе. Вы можете приехать к нам на базу и выбрать требуемый материал. А также убедится в качестве наших изделий.'}
            {set $header3 = 'Качество'}
            {set $textItem3 = 'Каждое штучное изделие проходит повторную проверку. Доска, брус ровные, отвечают заявленным габаритам (отклонение не более 2%)'}
            {set $header4 = 'Оплата "по факту"'}
            {set $textItem4 = 'Получаете материал, проверяете качество и ТОЛЬКО после этого оплачиваете. Никакой предоплаты! Наше главное правило - понятные условия и порядок работы с заказчиком!'}
    {/switch}
{/if}

{if $_modx->resource.context_key == 'plity-mdvp'}
    {set $variable = $list}
{elseif $_modx->resource.context_key == 'pilomat'} 
    {set $variable = $_modx->resource['kol-vokub-sh'][0]}
{else}
    {set $variable = $m2}
{/if}

<div class="js-product{if $itemInCart?} js-product-in-cart{/if}{if $gallery?} product-card_with-gallery{/if}{if $_modx->resource.old_price?} js-product_with-discount{/if}"
        {* Выводим data-атрибуты *}
        {foreach $itemUnits as $key => $val}
            data-{$key}="{$val['val']}"
        {/foreach}

        {insert "file:blocks/get-data-attrs.tpl"}
>

    <div class="product-card__top-line">
        <span class="product-card__article product-card__article_pc">Арт. {$_modx->resource['article']}</span>
{*        <div class="product-card__availability">*}
{*            {if $_modx->resource.productNotAvailable == 1}*}
{*              <span class="product-card__availability-cross"></span>*}
{*              Нет в наличии*}
{*            {else}*}
{*              <svg class="svg icon-available" xmlns="http://www.w3.org/2000/svg"*}
{*                   xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">*}
{*                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-available"></use>*}
{*              </svg>*}
{*              В наличии*}
{*            {/if}*}
{*        </div>*}
        <div class="product-card__reviews">
            <div class="product-card__reviews-stars five">
                <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
                </svg>
                <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
                </svg>
                <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
                </svg>
                <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
                </svg>
                <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
                </svg>
            </div>
            {set $countReviews = 11}
            <span class="product-card__reviews-quantity">{$countReviews}
                {'@FILE snippets/formOfWord.php' | snippet : [
                'n' => $countReviews,
                'f1' => 'отзыв',
                'f2' => 'отзыва',
                'f5' => 'отзывов'
                ]}
            </span>
        </div>

        <div class="product-card__right-info">
            <span class="js-product__btn product-card__btn-compare js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}"
                  href="#">
                <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16"
                     height="16">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
                </svg>
            </span>
            <span class="js-product__btn product-card__btn-fav js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}" href="#">
                <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 21 18" width="21"
                     height="18">
                    <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
                </svg>
            </span>
            <script src="https://yastatic.net/share2/share.js"></script>
            <div class="ya-share2" data-copy="last" data-curtain data-shape="round" data-limit="0" data-more-button-type="short" data-services="vkontakte,odnoklassniki,telegram,whatsapp"></div>
        </div>
    </div>

    <div class="product-card__top">
        <meta itemprop="brand" content="{$_modx->getPlaceholder('brand')}">

        <div class="product-card__main-content">
            <div class="product-card__main-content-top">
                <div class="product-card__gallery">
                    <div class="product-card__img-wrap">
                        {if $itemVendor? && $_modx->resource.context_key !== 'onduline1'}
                            <div class="product-card__brand" data-val="{$itemVendor}"></div>
                        {/if}
                        {if $outputOldPrice?}
                            <div class="js-product__discount product-card__discount">Скидка {'!calculateDiscount' | snippet}%</div>
                        {/if}
                        <a href="{$hrefval}" class="product-card__img-link zoom-narrow" itemscope itemtype="http://schema.org/ImageObject">
                            <img class="product-card__img" src="{$fstImageSrc}" itemprop="contentUrl">
                        </a>
                    </div>

                    {$_modx->getPlaceholder('gallery')}
                </div>

                <div class="product-card__mobile product-card__fav-n-comp">
                    <span class="js-product__btn product-card__btn-compare js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}"
                          href="#">
                        <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16"
                             height="16">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
                        </svg>
                    </span>
                    <span class="js-product__btn product-card__btn-fav js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}" href="#">
                        <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 21 18" width="21"
                             height="18">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
                        </svg>
                    </span>
                    <script src="https://yastatic.net/share2/share.js"></script>
                    <div class="ya-share2" data-copy="last" data-curtain data-shape="round" data-limit="0" data-more-button-type="short" data-services="vkontakte,odnoklassniki,telegram,whatsapp"></div>
                </div>

                <div class="hidden" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
                    <meta itemprop="bestRating" content="5">
                    <meta itemprop="ratingValue" content="5">
                    <meta itemprop="ratingCount" content="82">
                </div>

                <div>
                <div class="warehouse">
                    <div class="warehouse__header">
                        <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zM227.3 387.3l184-184c6.2-6.2 6.2-16.4 0-22.6l-22.6-22.6c-6.2-6.2-16.4-6.2-22.6 0L216 308.1l-70.1-70.1c-6.2-6.2-16.4-6.2-22.6 0l-22.6 22.6c-6.2 6.2-6.2 16.4 0 22.6l104 104c6.2 6.2 16.4 6.2 22.6 0z"/></svg></i>
                        В наличии
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

                    <div class="warehouse__content">
                        <div class="warehouse__content-block">
                            <div class="header-small">Доставим</div>
                            <div class="list">
                                <div class="option">
                                    {set $sum = 0}

                                    {foreach $sklads as $sklad}
                                        {set $result = $_modx->runSnippet("@FILE modules/warehoses/snippets/searchDataSetWarehouse.php", [
                                            "parent" => $_modx->resource.parent,
                                            "warehouse" => $sklad['pagetitle']
                                        ])}

                                        {if !empty($result)}
                                            {set $sum += $_modx->runSnippet("@FILE snippets/random.php", [
                                                "id" => $_modx->resource.id,
                                                "start" => $result['start'],
                                                "end" => $result['end'],
                                                "unique" => md5($sklad['pagetitle'])
                                            ])}
                                            {else}
                                            {set $sum += $_modx->runSnippet("@FILE snippets/random.php", [
                                                "id" => $_modx->resource.id,
                                                "start" => 300,
                                                "end" => 1600,
                                                "unique" => md5($sklad['pagetitle'])
                                            ])}
                                        {/if}


                                    {/foreach}
                                    <span class="name">Сегодня &nbsp({$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])})</span><span class="value">
                                        {$sum} л.
                                         <svg class="check-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>

                                    </span>
                                </div>
                            </div>
                        </div>


                        <div class="content-block">
                            <div class="header-small">Доступно на 15 складах</div>
                            {if $_modx->getPlaceholder('localdata').main_contacts.email_prefix != "krasnodar"}
                            <div class="list">
                                {foreach $sklads as $sklad}
                                    <div class="option">
                                        <span class="name">
                                            <a href="{$sklad['id'] | url}">{$sklad['pagetitle']}</a>
                                        </span>
                                        <span class="value">
                                             {set $result = $_modx->runSnippet("@FILE modules/warehoses/snippets/searchDataSetWarehouse.php", [
                                             "parent" => $_modx->resource.parent,
                                             "warehouse" => $sklad['pagetitle']
                                             ])}
                                            {if !empty($result)}
                                                {set $inStock = $_modx->runSnippet("@FILE snippets/random.php", [
                                                "id" => $_modx->resource.id,
                                                "start" => $result['start'],
                                                "end" => $result['end'],
                                                "unique" => md5($sklad['pagetitle'])
                                                ])}
                                            {else}
                                                {set $inStock = $_modx->runSnippet("@FILE snippets/random.php", [
                                                "id" => $_modx->resource.id,
                                                "start" => 300,
                                                "end" => 1600,
                                                "unique" => md5($sklad['pagetitle'])
                                                ])}
                                            {/if}
                                            {if $inStock != 0}
                                                {$inStock} л.
                                            {else}
                                                <span class="notAvailable">нет в наличии</span>
                                            {/if}
                                            <svg class="check-icon {if $inStock === 0}out-of-stock{/if}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
                                        </span>
                                    </div>
                                {/foreach}
                            </div>
                            <span class="show-more-warehouse">Все склады</span>
                            {/if}
                        </div>
                    </div>
                </div>



                <div class="product-card__reasons">
                    <ul class="product-card__reasons-items-wrap">
                        <li class="product-card__reasons-item">
                            <span class="product-card__reasons-item-img product-card__reasons-item-img_icon_cut-white-black"></span>
                            Резка и распил                            <span class="product-card__reasons-tip">
                                    <svg class="svg icon-info" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                                        <use xlink:href="/assets/template/img/svg-sprite.svg#icon-info"></use>
                                    </svg>
                                    <span class="product-card__reasons-tip-text">Мы предоставляем услугу по профессиональной резке и распилу материала под Ваш запрос. Осуществим распил в день заказа по Вашей карте раскроя либо составим Вам карту бесплатно. Звоните и заказывайте плиты с распилом!</span>
                                </span>
                        </li>
                        <li class="product-card__reasons-item">
                            <span class="product-card__reasons-item-img product-card__reasons-item-img_icon_refund-black-white"></span>
                            Возврат 14 дней                               <span class="product-card__reasons-tip">
                                    <svg class="svg icon-info" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                                        <use xlink:href="/assets/template/img/svg-sprite.svg#icon-info"></use>
                                    </svg>
                                    <span class="product-card__reasons-tip-text">Если вас не устроит качество товара Вы сможете осуществить возврат в течении 14 дней после покупки. Мы вернем полную сумму заказа даже без предъявления чека.</span>
                                </span>
                        </li>

                    </ul>
                </div>
                </div>


            </div>

            {* На поликарбонате поле content выводится во вкладке "Описание", поэтому здесь выводить его не надо. Но здесь нужно вывести introtext *}
            {if $_modx->resource.context_key == 'policarbonat'}
                {if $_modx->resource.introtext ?}
                <article class="content-block">
                      {$_modx->resource.introtext}
                  </article>
                {/if}
            {else}
                {set $hideOnMobile = $_modx->resource.context_key == 'pilomat' && $_modx->resource.template == 21}
                {include 'file:sections/product/card-content-tab.tpl' mb=true hideOnMobile=$hideOnMobile contentSubClass=true}
            {/if}

            {if $_modx->resource.template == 51}
                {set $photos = json_decode($_modx->resource.reviewsPhoto, 1)}
                {if count($photos) > 0}
                    <div class="photos-of-our-customers">
                        <span class="photos-of-our-customers__header">Фото наших покупателей</span>
                        <div class="photos-of-our-customers__swiper-wrapper swiper-wrapper">
            
                            {foreach $photos as $reviewPhoto}
                                <a class="swiper-slide" data-fancybox="photos-of-our-customers" href="{$reviewPhoto.image}">
                                    <img src="{$reviewPhoto.image}"  alt=""/>
                                </a>
                            {/foreach}
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                {/if}
            {/if}
        </div>

        <div class="product-card__side-panel">



            {set $formatText = 'Формат, мм'}

            {if ($_modx->resource.context_key in list ['pro-fanera', 'policarbonat'])}
                {set $formatKey = 'razmer-mm'}

                {if $_modx->resource.context_key == 'policarbonat'}
                    {set $formatText = 'Размер, мм'}
                {/if}
            {else}
                {set $formatKey = 'format_text'}
            {/if}

            {if $linksData['format']?}
                <div class="product-card__relinking-block">
                    <div class="product-card__side-panel-text">{$formatText}</div>
                    <div class="product-card__relinking-items-wrap">
                        {foreach $linksData['format'] as $id => $val}
                            {if $_modx->resource[$formatKey][0] == $val}
                                <span class="product-card__relinking-item active">
                                    {$val}
                                </span>
                            {else}
                                <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="product-card__relinking-item">
                                    {$val}
                                </a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            {/if}

            {if $linksData['item_thickness']?}
                <div class="product-card__relinking-block">
                    <div class="product-card__side-panel-text">Толщина, мм</div>
                    <div class="product-card__relinking-items-wrap">
                        {foreach $linksData['item_thickness'] as $id => $val}
                            {if $_modx->resource['item_thickness'][0] == $val}
                                <span class="product-card__relinking-item active">
                                    {$val}
                                </span>
                            {else}
                                <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="product-card__relinking-item">
                                    {$val}
                                </a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            {/if}

            {if $linksData['item_width']?}
                <div class="product-card__relinking-block">
                    <div class="product-card__side-panel-text">Ширина</div>
                    <div class="product-card__relinking-items-wrap">
                        {foreach $linksData['item_width'] as $id => $val}
                            {if $_modx->resource['item_width'][0] == $val}
                                <span class="product-card__relinking-item active">
                                    {$val}
                                </span>
                            {else}
                                <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="product-card__relinking-item">
                                    {$val}
                                </a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            {/if}
            
            {if $linksData['product-sort']?}
                <div class="product-card__relinking-block">
                    <div class="product-card__side-panel-text">Сорт</div>
                    <div class="product-card__relinking-items-wrap">
                        {foreach $linksData['product-sort'] as $id => $val}
                            {if $_modx->resource['product-sort'][0] == $val}
                                <span class="product-card__relinking-item active">
                                    {$val}
                                </span>
                            {else}
                                <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="product-card__relinking-item">
                                    {$val}
                                </a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            {/if}

            {if $linksData['cvet']?}
              <div class="product-card__relinking-block">
                <div class="product-card__side-panel-text">Цвет</div>
                <div class="product-card__relinking-items-wrap">
                    {foreach $linksData['cvet'] as $id => $val}
                        {if $_modx->resource['cvet'][0] == $val}
                          <span title="{$val}" class="product-card__relinking-color active" data-val="{$val}"></span>
                        {else}
                          <a title="{$val}" href="{$_modx->makeUrl($id, '', '', 'full')}" class="product-card__relinking-color" data-val="{$val}"></a>
                        {/if}
                    {/foreach}
                </div>
              </div>
            {/if}

            {*
              Атрибут content нужен для поисковиков, т.к. это тег meta.
              Атрибут data-default нужен для расчета цены при смене ед. измерения. В data-default хранится цена за ед. измерения по умолчанию (без умножения на какие-либо коэффициенты) - как в админке.
            *}
            {if $outputOldPrice?}
                <meta class="js-product__price" data-default="{$defaultPrice}">
                <meta itemprop="price" class="js-product__new-price" data-default="{$defaultOldPrice}" content="{$defaultPrice}">
            {else}
                <meta itemprop="price" class="js-product__price" data-default="{$defaultPrice}" content="{$defaultPrice}">
            {/if}

            <meta itemprop="priceCurrency" content="RUB">
            <meta itemprop="weight" class="js-product__weight" content="{$_modx->resource['massa'][0]}">

            <input type="hidden" name="unit" value="1">
            <div class="js-product__ms2-elems">
                <form class="js-product__form-add ms2_form" method="post">
                    <input name="options" value="[]">
                    <input name="id" value="{$prodId}">
                    <input name="count" value="1">
                    <input name="ctx" value="{$_modx->resource.context_key}">
                    <button type="submit" name="ms2_action" value="cart/add">Добавить</button>
                </form>
                <form class="js-product__form-change ms2_form" method="post">
                    <input name="key" value="{$productKey}">
                    <input name="count" value="{$itemInCart?:1}">
                    <input name="ctx" value="{$_modx->resource.context_key}">
                    <button type="submit" name="ms2_action" value="cart/change">Изменить кол-во</button>
                </form>
            </div>

            {* На плитах МДВП главная цена - за м2, вторая цена - за лист *}
            {if $_modx->resource.context_key == 'plity-mdvp'}
                {set $title1 = 'м<sup>2</sup>'}
                {set $title2 = 'Лист'}
            {elseif $_modx->resource.context_key == 'pilomat'}
                {set $title1 = 'м<sup>3</sup>'}
                {set $title2 = 'Шт.'}
            {else}
                {set $title1 = 'Лист'}
                {set $title2 = 'м<sup>2</sup>'}
            {/if}

            <div class="js-product__controls js-product__controls_action_add">
                <div class="product-card__controls-block">
                    <div class="product-card__controls-elem">
                        <div class="product-card__side-panel-text">{$title1}</div>
                        <div class="custom-counter js-product__custom-counter{$extraClass}">
                            <span class="custom-counter__btn custom-counter__btn_dir_less">-</span>
                            <input name="count" data-purpose="first" class="custom-counter__amount product-card__amount_style_default" value="{$itemInCart?:1}" data-min="{$dataMin}">
                            <span class="custom-counter__btn custom-counter__btn_dir_more">+</span>
                        </div>
                    </div>
                    <div class="product-card__controls-elem">
                        <div class="product-card__side-panel-text">{$title2}</div>
                        <div class="custom-counter js-product__custom-counter custom-counter_type_fractional">
                            <input name="count" data-purpose="second" class="product-card__amount_style_bordered custom-counter__amount" value="{$itemInCart?:1}" data-koeff="{$variable}" data-min="0.01">
                        </div>
                    </div>
                    {if $_modx->resource['massa'][0] > 0}
                        <div class="product-card__controls-elem">
                            <div class="product-card__side-panel-text">Вес, кг</div>
                            <div class="product-card__controls-elem-input product-card__weight-val">{$_modx->resource['massa'][0]}</div>
                        </div>
                    {/if}
                </div>

                {include "file:chunks/card-info-relinking-btns-info.tpl"}

                {if $_modx->resource.context_key in ['penoplex', 'rockwool', 'tn', 'plitaosb']}
                    {"@FILE modules/restrictions/restrictions.php" | snippet}
                {/if}

                <div class="product-card__btns-block">
                    <span class="js-product__btn-in-cart js-product__to-cart">В корзину</span>
                    <button data-fancybox href="#cost-fanera" class="white-btn product-card__callback-btn">
                        <span class="product-card__callback-btn-main-text">Получить консультацию</span>
                        <span class="product-card__callback-btn-spec-text">Бесплатно</span>
                    </button>
                </div>

                {if $_modx->resource.context_key == 'pilomat'}
                  <div data-fancybox data-src="#watch-live" data-btn-key="discount" class="product-card__discount-block product-card__discount-block_icon_watch-live product-card__discount-block_type_full">
                    Посмотреть вживую
                  </div>
                {/if}
                
                {if !$_modx->getPlaceholder('utm_source')}
                    {if $_modx->context.key == 'onduline1'}
                        {include 'file:sections/product/advantages-mini.tpl'}
                    {else}
                    <div class="product-card__discount-block product-card__discount-block_icon_fire">
                        <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
                        <span class="product-card__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
                    </div>
                    {/if}
                {/if}
                
                {if $_modx->resource['freeShipping'] ?}
                  <div class="product-card__free-shipping">
                    Доставка товара бесплатно!
                  </div>
                {else}
                  <div class="product-card__delivtext">{'@FILE snippets/getDeliveryText.php' | snippet: ["modifyDate" => "0 day"]}</div>
                {/if}
              
            </div>

            <div class="js-product__controls js-product__controls_action_change">
                <div class="product-card__controls-block">
                    <div class="product-card__controls-elem">
                        <div class="product-card__side-panel-text">{$title1}</div>
                        <div class="custom-counter js-product__custom-counter{$extraClass}">
                            <span class="custom-counter__btn custom-counter__btn_dir_less">-</span>
                            <input name="count" data-purpose="first" class="custom-counter__amount product-card__amount_style_default" value="{$itemInCart?:1}">
                            <span class="custom-counter__btn custom-counter__btn_dir_more">+</span>
                        </div>
                    </div>
                    <div class="product-card__controls-elem">
                        <div class="product-card__side-panel-text">{$title2}</div>
                        <div class="custom-counter js-product__custom-counter custom-counter_type_fractional">
                            <input name="count" data-purpose="second" class="product-card__amount_style_bordered custom-counter__amount" value="{$itemInCart?:1}" data-koeff="{$variable}" data-min="0.01">
                        </div>
                    </div>
                    {if $_modx->resource['massa'][0] > 0}
                        <div class="product-card__controls-elem">
                            <div class="product-card__side-panel-text">Вес, кг</div>
                            <div class="product-card__controls-elem-input product-card__weight-val">{$_modx->resource['massa'][0]}</div>
                        </div>
                    {/if}
                </div>

                {include "file:chunks/card-info-relinking-btns-info.tpl"}

                <div class="product-card__btns-block">
                    <a href="/cart/" class="js-product__btn-in-cart"><span class="js-product__btn-in-cart-top-text">В корзине</span> Перейти</a>
                    <button data-fancybox href="#cost-fanera" class="white-btn product-card__callback-btn">
                        <span class="product-card__callback-btn-main-text">Получить консультацию</span>
                        <span class="product-card__callback-btn-spec-text">Бесплатно</span>
                    </button>
                </div>

                <div class="product-card__delivtext">
                  Доставим {'+1 days' | date : 'Y-m-d'} при заказе сегодня
                </div>
              
            </div>
        </div>
    </div>
</div>