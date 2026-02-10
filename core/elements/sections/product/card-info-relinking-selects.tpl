{* Данные для перелинковки *}
{if $_modx->resource.template == 17}
    {set $linksData = 'getRelinkingData_ColorSurfaceThickness' | snippet}
    {set $cvet = $_modx->resource.cvet[0]}

    {if $_modx->resource.context_key == "fasad" && in_array(36783,$_modx->getParentIds($_modx->resource.id, 10, ['context' => $_modx->resource.context_key])) || in_array(34819,$_modx->getParentIds($_modx->resource.id, 10, ['context' => $_modx->resource.context_key])) }
        {set $linksData = 'getRelinkingData_CollectionOttenokTip' | snippet}
        {set $cvet = $_modx->resource.ottenok[0]}
        {if $linksData.ottenok?}
            {set $colorsSorted = $linksData.ottenok}
            {set $linksData.cvet = $_modx->runSnippet("@FILE snippets/linking/getSplitedColors.php", ["colorsArray" => $linksData.ottenok])}
        {/if}
    {/if}

{/if}
{if $_modx->resource.template == 20}
    {set $linksData = 'getRelinkingData_OttenokSurfaceThickness' | snippet}
    {set $cvet = $_modx->resource.ottenok[0]}
{/if}
{if $_modx->resource.template == 22}
    {set $linksData = 'getRelinkingData_CollectionOttenokTip' | snippet}
    {set $cvet = $_modx->resource.ottenok[0]}
{/if}
{if $_modx->context.key =='krovlya'}
    {set $isCardKrovlya = "krovlya-product-card-mobile-style"}
{/if}


<div class="{$isCardKrovlya} js-product{if $itemInCart?} js-product-in-cart{/if}{if $gallery?} product-card_with-gallery{/if}{if $outputOldPrice?} js-product_with-discount{/if}"
    {* Выводим data-атрибуты *}
    {foreach $itemUnits as $key => $val}
        data-{$key}="{$val['val']}"
    {/foreach}

    {insert "file:blocks/get-data-attrs.tpl"}
>

    <div class="product-card__top-line">
        <span class="product-card__article product-card__article_pc">Арт. {$_modx->resource['article']}</span>
        <div class="product-card__availability">
            {if $_modx->resource.productNotAvailable == 1}
              <span class="product-card__availability-cross"></span>
              Нет в наличии
            {else}
              <svg class="svg icon-available" xmlns="http://www.w3.org/2000/svg"
                   xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-available"></use>
              </svg>
              В наличии
            {/if}
        </div>

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

        <div class="product-card__top-smallinfo">
            <span class="product-card__article product-card__article_mobile">Арт. {$_modx->resource['article']}</span>
            {if $_modx->context.key == 'krovlya'}
            <div class="product-card__availability header-availability">
                <svg class="svg icon-available" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use xlink:href="/assets/template/img/svg-sprite.svg#icon-available"></use>
                </svg>
                В наличии
            </div>
            {/if}
        </div>

        <div class="product-card__gallery">
            <div class="product-card__img-wrap">
                {if $itemVendor? && $_modx->resource.context_key !== 'onduline1'}
                    {if $_modx->context.key == 'krovlya'}
                        <div class="product-card__brand display-view-desktop" data-val="{$itemVendor}"></div>
                    {else}
                        <div class="product-card__brand" data-val="{$itemVendor}"></div>
                    {/if}
                {/if}
                {if $outputOldPrice?}
                    <div class="js-product__discount product-card__discount">Скидка {'!calculateDiscount' | snippet}%</div>
                {/if}
                <a href="{$hrefval}" class="product-card__img-link zoom-here" itemscope itemtype="http://schema.org/ImageObject">
                    <img class="product-card__img" src="{$fstImageSrc}" alt="{$_modx->resource.pagetitle}" itemprop="contentUrl">
                </a>
            </div>

            {$_modx->getPlaceholder('gallery')}
        </div>

        <div class="hidden" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
            <meta itemprop="bestRating" content="5">
            <meta itemprop="ratingValue" content="5">
            <meta itemprop="ratingCount" content="82">
        </div>

        <div class="product-card__info-wrap">
            <div class="product-card__info" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <link itemprop="availability" href="http://schema.org/InStock">

                {* Передаем блок в переменную, так как для разных контекстов разное положение *}
                {set $priceBlock = '@FILE sections/product/price-block.tpl' | chunk : [
                    'condition' => $condition,
                    'itemUnits' => $itemUnits,
                    'pricePer' => $pricePer,
                    'price' => $price,
                    'outputPrice' => $outputPrice,
                    'outputOldPrice' => $outputOldPrice,
                    'defaultPrice' => $defaultPrice,
                    'defaultOldPrice' => $defaultOldPrice
                ]}

                {set $cvet_select = '@FILE blocks/product/linking/linking-cvet-select.tpl' | chunk : [
                    'links_data'=>$linksData.cvet,
                    'cvet'=>$cvet
                ]}

                {if $_modx->context.key not in list['krovlya', 'fasad']}
                    <div class="product-card__info-inner double-row">
                        {$priceBlock}
                        
                        {if $linksData.cvet && $_modx->context.key == 'onduline1'}
                            {$cvet_select} 
                        {/if}
                    </div>
                {elseif $_modx->context.key == 'krovlya' and $_modx->resource.segment_key in list ["proflisty-zabory","proflisty-krovly,proflisty-zabory","proflisty-krovly","cherepica-iz-metalla","proflisty-zabory,proflisty-krovly","shtaket-metall"]}
                    <div class="product-card__info-inner">
                        <ul class="list-additions">
                            <li class="list-additions__value">
                                <svg class="list-additions__value-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                                    <use xlink:href="/assets/template/img/svg-sprite.svg#icon-available"></use>
                                </svg>
                                <div class="list-additions__value-title"><b>Металл в наличии</b>: 3 000 м2</div>
                            </li>
                            <li class="list-additions__value">
                                <svg class="list-additions__value-icon">
                                    <use xlink:href="/assets/template/img/svg-sprite.svg#assort-proflist"></use>
                                </svg>
                                <div class="list-additions__value-title"><b>Срок производства</b>: 3-4 дня</div>
                            </li>
                        </ul>
                    </div>
                {/if}

                {* Все проверки в переменные для того что-бы не выводить пустой .product-card__info-inner, который если пуст, из-за отступов занимает много места  *}
                {set $if_cvet = $linksData.cvet? && $_modx->context.key !== 'onduline1'}
                {set $if_collection = $linksData.collection?}
                {set $if_thickness = $linksData.item_thickness?}
                {set $if_pokrytie = $linksData.pokrytie?}
                {set $if_tip = $linksData.tip?}
                {set $if_linking = $_modx->context.key == 'fasad' && $_modx->resource.parent not in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => '36784' ])}
                
                {if $if_cvet || $if_collection || $if_thickness || $if_pokrytie || $if_tip || $if_linking}
                    <div class="product-card__info-inner">
                        {if $if_cvet}
                            {$cvet_select} 
                        {/if}

                        {if $if_collection}
                            <div class="product-card__select-wrap product-card__select-wrap_type_half">
                                <div class="product-card__select-span">Коллекция:</div>
                                <div class="custom-select-wrap">
                                    <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                                        <div class="euv-custom-select__input">
                                            <span class="euv-custom-select__input-value">
                                                {$_modx->resource.collection[0]}
                                            </span>
                                        </div>
                                        <span class="euv-custom-select__btn"></span>
                                        <div class="euv-custom-select__options-wrap">
                                            <div class="euv-custom-select__options-wrap-scroll">
                                                {foreach $linksData.collection as $id => $val}
                                                    <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="euv-custom-select__option">
                                                        {$val}
                                                    </a>
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-select-mobile-link"></div>
                                    <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
                                </div>
                            </div>
                        {/if}

                        {if $if_thickness}
                            <div class="product-card__select-wrap product-card__select-wrap_type_half{if $linksData.cvet?} product-card__select-wrap_align_right{/if}">
                                <div class="product-card__select-span">Толщина, мм:</div>
                                <div class="custom-select-wrap">
                                    <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                                        <div class="euv-custom-select__input">
                                            <span class="euv-custom-select__input-value">{$_modx->resource.item_thickness[0]}</span>
                                        </div>
                                        <span class="euv-custom-select__btn"></span>
                                        <div class="euv-custom-select__options-wrap">
                                            <div class="euv-custom-select__options-wrap-scroll">
                                                {foreach $linksData.item_thickness as $id => $val}
                                                    <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="euv-custom-select__option">
                                                        {$val}
                                                    </a>
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-select-mobile-link"></div>
                                    <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
                                </div>
                            </div>
                        {/if}

                        {if $if_pokrytie}
                            {* Для разных родителей, разные подсказки *}
                            {if $_modx->resource.parent in list [12069,11760,37621,12070,12071,12073,12074,76923]}
                                {set $tip_category = 1}
                            {/if}
                            {if $_modx->resource.parent in list [16789,44681,44676,44677,44680,44678,44679]}
                                {set $tip_category = 2}
                            {/if}

                        <div class="euv-custom-select__type-colums pokrytie-options product-card__select-wrap product-card__select-wrap_type_full mt" data-tip-category="{$tip_category}">
                            <div class="product-card__select-span">Покрытие:</div>
                            <div class="custom-select-wrap">
                            <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                                <div class="euv-custom-select__input">
                                <span class="euv-custom-select__input-value">{$_modx->resource.pokrytie[0]}<span class="euv-custom-select__small-text">{$_modx->resource['vid-poverhnosti'][0]}</span></span>
                                </div>
                                <span class="euv-custom-select__btn"></span>
                                <div class="euv-custom-select__options-wrap">
                                <div class="euv-custom-select__options-wrap-scroll">
                                    {foreach $linksData.pokrytie as $id => $val}
                                        <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="euv-custom-select__option" data-value="{$val}">
                                            <div class="euv-custom-select__title">{$val}</div>
                                            <span class="euv-custom-select__small-text">{$linksData['vid-poverhnosti'][$id]}</span>
                                        </a>
                                    {/foreach}
                                </div>
                                </div>
                            </div>
                            <div class="custom-select-mobile-link"></div>
                            <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
                            </div>
                        </div>
                        {/if}

                        {if $if_tip}
                            <div class="product-card__select-wrap product-card__select-wrap_type_half{if $linksData.tip?} product-card__select-wrap_align_right{/if}">
                                <div class="product-card__select-span">Тип:</div>
                                <div class="custom-select-wrap">
                                    <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                                        <div class="euv-custom-select__input">
                                            <span class="euv-custom-select__input-value">{$_modx->resource.tip[0]}</span>
                                        </div>
                                        <span class="euv-custom-select__btn"></span>
                                        <div class="euv-custom-select__options-wrap">
                                            <div class="euv-custom-select__options-wrap-scroll">
                                                {foreach $linksData.tip as $id => $val}
                                                    <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="euv-custom-select__option">
                                                        {$val}
                                                    </a>
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="custom-select-mobile-link"></div>
                                    <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
                                </div>
                            </div>
                        {/if}

                        {if $if_linking}
                            {$_modx->runSnippet("@FILE snippets/linking/linking-select.php", [
                            'dependence' => ['ottenok'],
                            'coincide' => ['proizvoditel', 'collection', 'tip', 'razmer-mm']
                            ])}
                        {/if}
                    </div>
                {/if}

                {if $_modx->context.key in list['krovlya'] }
                    <div class="price-block">
                        <div class="product-card__info-inner">
                            {$priceBlock}
                        </div>
                        {if $itemVendor?}
                            <div class="product-card__brand display-view-mobile" data-val="{$itemVendor}"></div>
                        {/if}
                    </div>
                {/if}
                {if $_modx->context.key == 'fasad'}
                    <div class="display-view-desktop">
                        <div class="product-card__info-inner">
                            {$priceBlock}
                        </div>
                    </div>
                {/if}

                <div class="product-card__info-simple {if $_modx->context.key == 'krovlya'}display-view-desktop{/if}">
                    <div class="js-product__controls js-product__controls_action_add">
                        <div class="custom-counter js-product__custom-counter{$extraClass}">
                            <span href="#" class="custom-counter__btn custom-counter__btn_dir_less">-</span>
                            <input name="count" class="custom-counter__amount" value="1"
                                   data-min="{$dataMin}">
                            <span href="#" class="custom-counter__btn custom-counter__btn_dir_more">+</span>
                        </div>
                        <span class="js-product__btn-in-cart js-product__to-cart">В корзину</span>
                    </div>
                    <div class="js-product__controls js-product__controls_action_change">
                        <div class="custom-counter js-product__custom-counter{$extraClass}">
                            <span href="#" class="custom-counter__btn custom-counter__btn_dir_less">-</span>
                            <input name="count" class="custom-counter__amount" value="{$itemInCart?:0}">
                            <span href="#" class="custom-counter__btn custom-counter__btn_dir_more">+</span>
                        </div>
                        <a href="/cart/" class="js-product__btn-in-cart"><span class="js-product__btn-in-cart-top-text">В корзине</span>
                            Перейти</a>
                    </div>
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
                    <button data-fancybox="" href="#callback" class="product-card__buy white-btn">КУПИТЬ В 1 КЛИК</button>
                </div>
                {if $_modx->context.key == 'krovlya'}
                    {include "file:sections/product/mobile-btn.tpl"}
                {/if}
            </div>

            <div class="product-card__mobile product-card-controls">
                {if $_modx->context.key != 'krovlya'}
                <div class="product-card__fav-n-comp">
                    <span class="js-product__btn product-card__btn-compare js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}"
                          href="#">
                        <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16"
                             height="16">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
                        </svg>
                    </span>
                    <span class="js-product__btn product-card__btn-fav js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}"
                          href="#">
                        <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 21 18" width="21"
                             height="18">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
                        </svg>
                    </span>
                    <script src="https://yastatic.net/share2/share.js"></script>
                    <div class="ya-share2" data-copy="last" data-curtain data-shape="round" data-limit="0" data-more-button-type="short" data-services="vkontakte,odnoklassniki,telegram,whatsapp"></div>
                </div>
                {/if}
                <button data-fancybox="" href="#callback"
                        class="product-card__buy white-btn product-card__buy_type_mobile">КУПИТЬ В 1 КЛИК
                </button>
                {if $_modx->context.key == 'krovlya'}
                <div class="product-card__fav-n-comp">
                    <span class="js-product__btn product-card__btn-compare js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}"
                          href="#">
                        <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16"
                             height="16">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
                        </svg>
                    </span>
                    <span class="js-product__btn product-card__btn-fav js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}"
                          href="#">
                        <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 21 18" width="21"
                             height="18">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
                        </svg>
                    </span>
                    <script src="https://yastatic.net/share2/share.js"></script>
                    <div class="ya-share2" data-copy="last" data-curtain data-shape="round" data-limit="0" data-more-button-type="short" data-services="vkontakte,odnoklassniki,telegram,whatsapp"></div>
                </div>
                {/if}
            </div>

            {if !$_modx->getPlaceholder('utm_source')}
                {if $_modx->context.key == 'onduline1'}
                    {include 'file:sections/product/advantages-mini.tpl'}
                {else}
                <div class="product-card__discount-block product-card__discount-block_screen_pc product-card__discount-block_icon_fire">
                    <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
                    <span class="product-card__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
                </div>
                {/if}

                {if $_modx->resource['freeShipping'] ?}
                  <div class="product-card__free-shipping product-card__free-shipping_screen_pc">
                    Доставка товара бесплатно!
                  </div>
                {/if}

                {if $_modx->resource.context_key == 'krovlya' && $_modx->resource.parent in list [16805, 36871]}
                  <div class="product-card__return">Возможность возврата товара</div>
                {/if}

            {/if}
            {if $_modx->context.key == 'fasad'}
                <div class="display-view-mobile">
                    {$priceBlock}
                </div>
                {include "file:sections/product/mobile-btn.tpl"}
                <div class="product-card__left-info advantages-list-price__price display-view-mobile">
                    {include 'file:sections/product/advantures-fasad.tpl'}
                </div>
            {/if}

            <div class="product-card__delivery">
                <span class="product-card__delivery-title">Доставка</span>
                <div class="product-card__delivery-content">
                    <span class="product-card__delivery-text">
                        в Санкт-Петербург и Лен. область
                    </span>
                    <span class="product-card__delivery-link" data-fancybox data-src="#cost-delivery">
                        Узнать стоимость с доставкой
                    </span>
                </div>
            </div>

            <div class="product-card__delivtext">
              {'@FILE snippets/getDeliveryText.php' | snippet}
            </div>

            {if $_modx->resource.context_key in list ['fasad']}
                <div class="product-card__select-other-color">
                    {include "file:blocks/product/linking/linking-select-other-color.tpl"}
                </div>
            {/if}

            <div class="product-card__aux-info">
                <span class="product-card__article product-card__article_pc">Арт. {$_modx->resource['article']}</span>

                {if $_modx->resource.productNotAvailable == 1}
                  <div class="product-card__availability negative">
                    <span class="product-card__availability-cross"></span>
                    Нет в наличии
                  </div>
                {else}
                  <div class="product-card__availability">
                    <svg class="svg icon-available" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                      <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-available"></use>
                    </svg>
                    В наличии
                  </div>
                {/if}

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
            </div>
        </div>
    </div>

    {if $_modx->context.key == 'onduline1'}
    {else}
        <div class="product-card__discount-block product-card__discount-block_screen_mobile product-card__discount-block_icon_fire">
            <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
            <span class="product-card__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
        </div>
    {/if}

    {if $_modx->context.key not in list ['fasad','krovlya']}
        {include "file:sections/product/mobile-btn.tpl"}
    {/if}


</div>
