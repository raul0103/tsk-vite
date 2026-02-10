{if $_modx->context.key == 'krovlya'}
    {set $title_no_border_class_name = 'no-border'}
    {set $isKrovlya = true}
    {set $class_name_product_controls = "listing-product-controls-desktop"}
{/if}

{if $_modx->context.key == 'plitaosb'}
    {set $title_no_border_class_name = 'no-border'}
    {set $isPlitaosb= true}
    {set $class_name_product_controls = "listing-product-controls-desktop"}
{/if}

{* Устанавливаем переменные для чанка *}
{set $src = $_pls}
{insert "file:blocks/set-values-for-prod.tpl"}

{set $srcval = 'assets/images/no_image.jpg'}
{if $thumb ?}
    {if $_pls['imgWithWatermark'] ?}
        {set $srcval = '@FILE snippets/imgWithWatermark.php' | snippet : ['src' => $thumb]}
    {else}
        {set $srcval = $thumb}
    {/if}
{/if}

<div class="not-init pop-slide swiper-slide js-product listing__products-item{if $itemInCart?} js-product-in-cart{/if}{if $outputOldPrice?} js-product_with-discount{/if}"
    {* Выводим data-атрибуты *}
    {foreach $itemUnits as $key => $val}
        data-{$key}="{$val['val']}"
    {/foreach}

    {insert "file:blocks/get-data-attrs.tpl"}
>
    <div class="listing__products-item-left">
        <a class="listing__products-item-photo" href="{$uri}">
            {if $outputOldPrice?}
                <div class="listing__discount js-product__discount">Скидка {'!calculateDiscount' | snippet : ['id' => $id]}%</div>
            {/if}

            {if $freeShipping ?}
              <div class="listing__discount js-product__discount">
                Доставим этот товар бесплатно
              </div>
            {/if}

            <img src="/assets/images/loader.svg" class="lazy" data-src="{$srcval}" alt="{$pagetitle}">
        </a>
        <div class="listing__products-item-title">
            <a href="{$uri}" class="{$title_no_border_class_name}">{$pagetitle}</a>
        </div>
        <div class="listing__products-item-avail">
          {if $productNotAvailable == 1}
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
        <div class="listing__products-item-rate five">
            <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 version="1.1">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
            </svg>
            <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 version="1.1">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
            </svg>
            <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 version="1.1">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
            </svg>
            <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 version="1.1">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
            </svg>
            <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                 version="1.1">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
            </svg>
        </div>
        <div class="listing__products-item-art">
            {if $_modx->context.key != 'gazobeton' and $_modx->context.key not in list ['rasprodazha']}
                Арт. {$article}
            {/if}
        </div>
        {include "file:sections/category/listing-product-controls.tpl" class_names=$class_name_product_controls}
    </div>

    <div class="listing__products-item-right">
        <div class="listing__products-item-price-and-logo">
            <div class="listing__products-item-price">
                <div class="listing__products-item-price-wrap js-product__price-wrap">
                    <span class="js-product__price" data-default="{$defaultPrice}">{$outputPrice}</span> руб
                </div>

                {if $outputOldPrice?}
                    <div class="listing__product-new-price-wrap js-product__new-price-wrap js-product__new-price-val">
                        <span class="listing__product-new-price js-product__new-price" data-default="{$defaultOldPrice}">{$outputOldPrice}</span>
                        руб
                    </div>
                {/if}

                {if !$condition}
                    {if $price and $unit[0]}
                        <div class="listing__products-item-measure">
                            Цена за
                            {$pricePer}
                        </div>
                    {/if}
                {/if}
            </div>

            {if $_modx->resource.context_key !== 'onduline1'}
                <div class="product-logo listing__product-logo" data-val="{$proizvoditel[0]}"></div>
            {/if}
            
            {if $outputOldPrice and $_modx->context.key not in list ['rasprodazha']}
                <div class="js-product__new-price-wrap listing__new-price-text js-product__new-price-text">
                    Цена действительна до {'!getTomorrowDate' | snippet}
                </div>
            {/if}
        </div>

        {include "file:chunks/productsItemUnits.tpl"}
        <div class="listing__product-elems-wrap">
            {include "file:chunks/productElems.tpl" prodId=$id}
        </div>
    </div>
</div>
