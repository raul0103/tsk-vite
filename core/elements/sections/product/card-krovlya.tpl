{* Данные для перелинковки *}
{if $_modx->resource.template == 17}
    {set $linksData = 'getRelinkingData_ColorSurfaceThickness' | snippet}
    {set $cvet = $_modx->resource.cvet[0]}
    {if $linksData.cvet?}
        {set $colorsSorted = $_modx->runSnippet("@FILE snippets/linking/getSortedByPopColors.php", ["colorsArrays" => $linksData.cvet])}
        {if $colorsSorted?}
            {set $linksData.cvet = $_modx->runSnippet("@FILE snippets/linking/getSplitedColors.php", ["colorsArray" => $colorsSorted])}
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


{*Настройка карточки кровли, центральное место *}
{set $settingCardKrovlya = [
    'width' => 0,
    'optionWidth' => '',
    'maxLength' => 12000,
    'stepLength' => 500,
    'minLength' => 500
]}

{if $_modx->resource.parent in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => "16788"])}
    {*  настройки карточки кровля для металлочерепицы  *}
    {set $settingCardKrovlya['optionWidth'] = 'poleznaya-shirina'}
    {set $settingCardKrovlya['maxLength'] = 12000}
{elseif $_modx->resource.parent in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => "86214"])}
    {*  настройки карточки кровля для профнастила  *}
    {set $settingCardKrovlya['optionWidth'] = 'obshaya-shirina'}
    {set $settingCardKrovlya['maxLength'] = 13000}
{/if}

{if $settingCardKrovlya['optionWidth']}
    {set $settingCardKrovlya['width'] = $_modx->runSnippet("@FILE snippets/getOptionProduct.php", ['key' => $settingCardKrovlya['optionWidth']])}
{/if}


<div class="js-product{if $itemInCart?} js-product-in-cart{/if}{if $gallery?} product-card_with-gallery{/if}{if $outputOldPrice?} js-product_with-discount{/if} card-krovlya"
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

        <div class="product-card__gallery-wrap">
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

            <div class="product-card__select-other-color">
                {include "file:blocks/product/linking/linking-select-other-color.tpl"}
            </div>
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
                {set $priceBlock = '@FILE sections/product/price-block-content.tpl' | chunk : [
                'condition' => $condition,
                'itemUnits' => $itemUnits,
                'pricePer' => $pricePer,
                'price' => $price,
                'outputPrice' => $outputPrice,
                'outputOldPrice' => $outputOldPrice,
                'defaultPrice' => $defaultPrice,
                'defaultOldPrice' => $defaultOldPrice
                ]}

                {if $_modx->context.key != 'krovlya'}
                    {$priceBlock}
                {elseif $_modx->context.key == 'krovlya' and $_modx->resource.segment_key in list ["proflisty-zabory","proflisty-krovly,proflisty-zabory","proflisty-krovly","cherepica-iz-metalla","proflisty-zabory,proflisty-krovly"]}
                    <div class="product-card__info-inner basic-info">
                        <ul class="list-additions">
                            <li class="list-additions__value">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_2420_7199)">
                                        <path d="M8.47615 16.8033L3.62471 11.9518L1.97266 13.5922L8.47615 20.0957L22.4371 6.13474L20.7967 4.49432L8.47615 16.8033Z" fill="#52BC6A"/>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_2420_7199">
                                            <rect width="24" height="24" fill="white"/>
                                        </clipPath>
                                    </defs>
                                </svg>

                                <div class="list-additions__value-title">Металл в наличии</div>
                                <div class="list-additions__value-value">3 000 м2</div>
                            </li>
                            <li class="list-additions__value">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_2420_7206)">
                                        <path d="M12 2C6.5 2 2 6.5 2 12C2 17.5 6.5 22 12 22C17.5 22 22 17.5 22 12C22 6.5 17.5 2 12 2ZM12 20C7.59 20 4 16.41 4 12C4 7.59 7.59 4 12 4C16.41 4 20 7.59 20 12C20 16.41 16.41 20 12 20ZM12.5 7H11V13L16.2 16.2L17 14.9L12.5 12.2V7Z" fill="black"/>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_2420_7206">
                                            <rect width="24" height="24" fill="white"/>
                                        </clipPath>
                                    </defs>
                                </svg>
                                <div class="list-additions__value-title">Срок производства</div>
                                <div class="list-additions__value-value">3-4 дня</div>

                            </li>
                            {if $settingCardKrovlya['width'] > 0}
                                <li class="list-additions__value">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_2420_7216)">
                                            <rect x="2" y="2" width="2" height="20" fill="black"/>
                                            <rect x="2" y="2" width="2" height="20" fill="black"/>
                                            <rect x="20" y="2" width="2" height="20" fill="black"/>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M9 14.8868L4 12L9 9.11328V11.2841H15V9.11328L20 12L15 14.8868V12.7098H9V14.8868Z" fill="black"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_2420_7216">
                                                <rect width="24" height="24" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                    <div class="list-additions__value-title">Ширина листа</div>
                                    <div class="list-additions__value-value">
                                        {$settingCardKrovlya['width']} мм
                                    </div>
                                </li>
                            {/if}
                        </ul>
                        <div class="price-block">
{if $_modx->resource.template == 17}
                            {$priceBlock}
                            {if $itemVendor? && $_modx->resource.context_key !== 'onduline1'}
                                <div class="product-card__brand display-view-mobile" data-val="{$itemVendor}"></div>
                            {/if}
{else}
                            {if $itemVendor? && $_modx->resource.context_key !== 'onduline1'}
                                <div class="product-card__brand display-view-mobile" data-val="{$itemVendor}"></div>
                            {/if}
                            {$priceBlock}
{/if}

                        </div>
                    </div>
                {/if}

                <div class="product-card__info-inner">
                    {include "file:blocks/product/linking/linking-characteristics.tpl"}
                </div>
                <div class="product-card__info-simple unity">
                    <input type="hidden" name="width" value="{$settingCardKrovlya['width']}">
                    <div class="counter">
                        <div class="counter-title">Длина листа, мм</div>
                        <div class="counter-controls">
                            <span class="decrease">-</span>
                            <input name="long" class="counter-input" value="{$settingCardKrovlya['minLength']}"
                                                                     data-min="{$settingCardKrovlya['minLength']}"
                                                                     data-max="{$settingCardKrovlya['maxLength']}"
                                                                     data-step="{$settingCardKrovlya['stepLength']}">
                            <span class="increase">+</span>
                        </div>
                    </div>

                    <div class="counter">
                        <div class="counter-title">Количество листов, шт.</div>
                        <div class="counter-controls">
                            <span class="decrease">-</span>
                            <input name="count" class="counter-input" value="1" data-min="1" data-step="1">
                            <span class="increase">+</span>
                        </div>
                    </div>

                    <div class="resultSum">
                        <div class="resultSum-m2"><span class="title">ИТОГО: </span><span class="value"> </span><span class="prefix">м2</span></div>
                        <div class="resultSum-rub"><span class="value"> </span><span class="prefix"> руб</span></div>
                    </div>
                    <span class="js-product__price" data-default="{$defaultPrice}" style="display:none !important"></span>
                </div>

                <div class="product-card__info-simple action">
                    <div class="js-product__controls js-product__controls_action_add">
                        <span class="js-product__btn-in-cart js-product__to-cart">В корзину</span>
                    </div>
                    <div class="js-product__controls js-product__controls_action_change">
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
                        <button data-fancybox="" href="#callback" class="display-view-desktop product-card__buy white-btn">КУПИТЬ В 1 КЛИК</button>
                </div>

            </div>

            <div class="product-card__mobile product-card-controls">
                <button data-fancybox="" href="#callback"
                        class="product-card__buy white-btn product-card__buy_type_mobile">КУПИТЬ В 1 КЛИК
                </button>
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
            </div>

            {if !$_modx->getPlaceholder('utm_source')}
                <div class="product-card__discount-block product-card__discount-block_screen_pc product-card__discount-block_icon_fire">
                    <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
                    <span class="product-card__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
                </div>

                {if $_modx->resource['freeShipping'] ?}
                    <div class="product-card__free-shipping product-card__free-shipping_screen_pc">
                        Доставка товара бесплатно!
                    </div>
                {/if}

                {if $_modx->resource.context_key == 'krovlya' && $_modx->resource.parent in list [16805, 36871]}
                    <div class="product-card__return">Возможность возврата товара</div>
                {/if}

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
                {'@FILE snippets/getDeliveryText.php' | snippet: [
                    'modifyDate' => '+3 days',
                ]}
            </div>

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

    <div class="product-card__discount-block product-card__discount-block_screen_mobile product-card__discount-block_icon_fire">
        <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
        <span class="product-card__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
    </div>

    {*include "file:sections/product/mobile-btn.tpl"*}

</div>
