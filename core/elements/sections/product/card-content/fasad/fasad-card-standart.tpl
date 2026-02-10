{* Данные для перелинковки *}
{if $_modx->resource.template in list [17, 53]}
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

<div class="js-product{if $itemInCart?} js-product-in-cart{/if}{if $gallery?} product-card_with-gallery{/if}{if $outputOldPrice?} js-product_with-discount{/if}"
    {* Выводим data-атрибуты *}
    {foreach $itemUnits as $key => $val}
        data-{$key}="{$val['val']}"
    {/foreach}

    {insert "file:blocks/get-data-attrs.tpl"}
>

    <div class="product-card__action product-card-action">
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

    <div class="product-card__top">
        <meta itemprop="brand" content="{$_modx->getPlaceholder('brand')}">

        <div class="product-card__left-info-wrap">
            <div class="product-card__gallery product-card-gallery">

                <div class="product-card-gallery__wrapper">
                    <div class="product-card__img-wrap">
                        {if $outputOldPrice?}
                            <div class="js-product__discount product-card__discount">Скидка {'!calculateDiscount' | snippet}%</div>
                        {/if}
                        <a href="{$hrefval}" class="product-card__img-link zoom-here" itemscope itemtype="http://schema.org/ImageObject">
                            {if $itemVendor?}
                                <div class="product-card__brand" data-val="{$itemVendor}"></div>
                            {/if}
                            <img class="product-card__img" src="{$fstImageSrc}" alt="{$_modx->resource.pagetitle}" itemprop="contentUrl">
                        </a>
                    </div>

                    {$_modx->getPlaceholder('gallery')}
                </div>
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

                <div class="display-view-desktop">
                    <div class="">
                        <div class="">
                            {include "file:sections/product/card-content/fasad/blocks/price-block-content-standart.tpl"}
                        </div>
                        <div class="product-card__discount-block product-card__discount-block_icon_fire">
                             <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
                             <span class="product-csard__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
                         </div>
                        <div class="">
                            {include 'file:sections/product/warehouses-v2-stocks.tpl'}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
