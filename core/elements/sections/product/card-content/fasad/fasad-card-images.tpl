{* Данные для перелинковки *}

{set $linksData = 'getRelinkingData_ColorSurfaceThickness' | snippet}
{set $cvet = $_modx->resource.cvet[0]}

{if $_modx->resource.context_key == "fasad" && in_array(36783,$_modx->getParentIds($_modx->resource.id, 10, ['context' => $_modx->resource.context_key])) || in_array(34819,$_modx->getParentIds($_modx->resource.id, 10, ['context' => $_modx->resource.context_key])) }
    {*
    {set $linksData = 'getRelinkingData_CollectionOttenokTip' | snippet}
    {set $cvet = $_modx->resource.ottenok[0]}
    {if $linksData.ottenok?}
        {set $colorsSorted = $linksData.ottenok}
        {set $linksData.cvet = $_modx->runSnippet("@FILE snippets/linking/getSplitedColors.php", ["colorsArray" => $linksData.ottenok])}
    {/if}
    *}

  {set $similar_products = "@FILE modules/similar-products/snippets/getSimilarProducts.php" | snippet : [
    'selection_option' => 'ottenok',
    'main_options' => ['tip'],
  ]}
    {*Для фасадной плитки www-fasad.ru*}
    {if !$similar_products}
        {set $similar_products = "@FILE modules/similar-products/snippets/getSimilarProducts.php" | snippet : [
        'selection_option' => 'kollekciya-cvet',
        'main_options' => ['tip'],
        ]}
    {/if}
{/if}



<div class="product-card--fasad-images js-product{if $itemInCart?} js-product-in-cart{/if}{if $gallery?} product-card_with-gallery{/if}{if $outputOldPrice?} js-product_with-discount{/if}"
    {* Выводим data-атрибуты *}
    {foreach $itemUnits as $key => $val}
        data-{$key}="{$val['val']}"
    {/foreach}
    {insert "file:blocks/get-data-attrs.tpl"}
>
    <meta itemprop="brand" content="{$_modx->getPlaceholder('brand')}">
    
    <div class="hidden" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
        <meta itemprop="bestRating" content="5">
        <meta itemprop="ratingValue" content="5">
        <meta itemprop="ratingCount" content="82">
    </div>

    {* Верхние действия - сравнение, избранное, поделиться *}
    <div class="product-card__action product-card-action">
        <span class="js-product__btn product-card__btn-compare js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}" href="#">
            <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16" height="16">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
            </svg>
        </span>
        <span class="js-product__btn product-card__btn-fav js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}" href="#">
            <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 21 18" width="21" height="18">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
            </svg>
        </span>
        <script src="https://yastatic.net/share2/share.js"></script>
        <div class="ya-share2" data-copy="last" data-curtain data-shape="round" data-limit="0" data-more-button-type="short" data-services="vkontakte,odnoklassniki,telegram,whatsapp"></div>
    </div>

    {* Обертка для двух колонок *}
    <div class="product-card__layout-wrapper">
        {* Основной контейнер с белым фоном и тенью (720px) *}
        <div class="product-card__main-container">
            {* Левая часть - блок с изображениями *}
            <div class="product-card__images-section">
                {* Основное изображение *}
                <div class="product-card__main-image">
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

                {* Миниатюры галереи *}
                {if $gallery?}
                    <div class="product-card__gallery-thumbnails">
                        {$_modx->getPlaceholder('gallery')}
                    </div>
                {/if}
            </div>

            {* Правая часть - выбор цвета и опции *}
            <div class="product-card__options-section" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <link itemprop="availability" href="http://schema.org/InStock">
                

                {if $similar_products}
                    <div class="product-card__color-selection">
                        <div class="product-card__color-label">Цвет:</div>
                        <div class="product-card__color-grid">
                            <div class="product-card__color-row" data-opened-element="similar-colored">
                                {foreach $similar_products as $index => $item}

                                <a  
                                    href="{$item['uri']}"
                                    class="{if $index > 12}hidden{/if} product-card__color-item"
                                    data-product="{$item['id']}"
                                    data-color="{$item['value']}"
                                    title="{$item['value']}"
                                >
                                    <img
                                    src="{$item['thumb']}"
                                    alt="{$item['value']}"
                                    />
                                </a>
                                {/foreach}

                                {if $similar_products|count > 13}
                                    <span class="show-more-btn" data-opened-btn="similar-colored" data-active-text="Скрыть">Показать все</span>
                                {/if}
                            </div>
                        </div>
                    </div>
                {else}
                    {* Блок выбора цвета *}
                    {if isset($linksData) && $linksData.cvet?}
                        <div class="product-card__color-selection">
                            <div class="product-card__color-label">Цвет:</div>
                            <div class="product-card__color-grid">
                                {set $colorGroups = $linksData.cvet}
                                {set $countCvet = 0}
                                <div class="product-card__color-row" data-opened-element="similar-colored">
                                    {foreach $colorGroups as $group}
                                            {foreach $group as $id => $val}
                                                {set $countCvet = $countCvet + 1}
                                                <a href="{$_modx->makeUrl($id)}"
                                                class="{if $countCvet > 12}hidden{/if} product-card__color-item {if $id == $_modx->resource.id} active{/if}"
                                                data-product="{$id}"
                                                data-color="{$val}"
                                                title="{$val}">
                                                    {* Здесь можно добавить превью цвета или изображение *}
                                                    <img src="{$id | resource: 'thumb'}" alt="{$val}">
                                                </a>
                                            {/foreach}
                                    {/foreach}
                                    {if $countCvet > 13}
                                        <span class="show-more-btn" data-opened-btn="similar-colored" data-active-text="Скрыть">Показать все</span>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    {else}
                        {* Если нет цветов, показываем склады здесь (только на десктопе) *}
                        <div class="product-card__warehouses-in-options product-card__warehouses-desktop-only">
                            {include 'file:sections/product/warehouses-v2-stocks.tpl'}
                        </div>
                    {/if}
                {/if}


                {* Блок с переключателями опций (только на десктопе) *}
                <div class="product-card__toggles-desktop">
                    {include "file:sections/product/card-content/fasad/blocks/toggles.tpl"}
                </div>
            </div>
        </div>

        {* Блоки с ценой и складами (315px) *}
        <div class="product-card__additional-info">
            <div class="product-card__price-section">
                {include "file:sections/product/card-content/fasad/blocks/price-block-content-images.tpl"}
            </div>
            
            <div class="product-card__discount-block product-card__discount-block_icon_fire">
                <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
                <span class="product-csard__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
            </div>

            {* Показываем склады внизу: на мобильных всегда, на десктопе только если есть цвета *}



            <div class="product-card__warehouses-section{if isset($linksData.cvet) || !empty($similar_products) }{else} product-card__warehouses-mobile-visible{/if}">
                {"@FILE modules/stocks/snippets/stocks.php" | snippet : ['parentStocks' => 'skladi_page_id' | config ]}

            </div>
        </div>
    </div>
</div>
