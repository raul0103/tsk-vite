{if $_modx->context.key in list ['krovlya']}
    {set $title_no_border_class_name = 'no-border'}
    {set $isKrovlya = true}
    {set $class_name_product_controls = "listing-product-controls-desktop"}
    {set $class_name_product_avail = "listing-product-avail-desktop"}
    {set $class_name_hide_article = "display-view-desktop"}
{/if}

{if $_modx->resource.context_key in list['penoplex', 'tn', 'rockwool']}
    {set $isUteplitel = true}
{/if}



{if $_modx->context.key == 'plitaosb'}
    {set $title_no_border_class_name = 'no-border'}
    {set $isPlitaosb = true}
    {set $class_name_product_controls = "listing-product-controls-desktop"}
    {set $class_name_product_avail = "listing-product-avail-desktop"}
    {set $class_name_hide_article = "display-view-desktop"}
{/if}

{* Данный код нужен, т.к. при подгрузке товаров через AJAX (mFilter2) плейсхолдер checkItems будет пустым, он ведь устанавливается при загрузке страницы *}
{if $_modx->getPlaceholder('checkItems') is null}
    {'!checkItems' | snippet}
{/if}

{set $srcval = 'assets/images/no_image.jpg'}
{if $thumb ?}
    {if $_pls['imgWithWatermark'] ?}
        {set $srcval = '@FILE snippets/imgWithWatermark.php' | snippet : ['src' => $thumb]}
    {else}
        {set $srcval = $thumb}
    {/if}
{/if}

{set $template = $id | resource:'template'}

{* Устанавливаем переменные для чанка *}
{set $src = $_pls}
{insert "file:blocks/set-values-for-prod.tpl"}

<div class="not-init {if $isKrovlya && $_modx->resource.class_key == 'msProduct'}pop-slide swiper-slide{/if} js-product listing__products-item{if $itemInCart?} js-product-in-cart{/if}{if $outputOldPrice?} js-product_with-discount{/if}"
    {* Выводим data-атрибуты *}
    {foreach $itemUnits as $key => $val}
        data-{$key}="{$val['val']}"
    {/foreach}

    {insert "file:blocks/get-data-attrs.tpl"}

     {* data-priority1 и data-priority2 можно убрать, я их вывел чисто для того, чтобы понять, работает ли сортировка по популярности *}
     data-priority1="{$src['priority1']}"
     data-priority2="{$src['HitsPage']}"
>
    <div class="listing__products-item-left">
        {if $_modx->resource.context_key in list ['pro-fanera', 'fasady-pro', 'fasad', 'pilomat', 'armatura-178', 'asconcrete']}
            <div class="listing__products-item-title">
              <a href="{$uri}" class="{$title_no_border_class_name}">{$pagetitle}</a>
            </div>
        {/if}

        {* Микроразметка только для первого товара *}
        <a class="listing__products-item-photo" href="{$uri}" {if $idx == 1}itemscope itemtype="http://schema.org/ImageObject"{/if}>
            {if $outputOldPrice?}
                {set $dst_title = "Скидка"}
                {if $isKrovlya}
                    {set $dst_title = "-"}
                {/if}
                <div class="listing__discount js-product__discount">{$dst_title} {'!calculateDiscount' | snippet : ['id' => $id]}%</div>
            {/if}

            {if $freeShipping?}
              <div class="listing__discount js-product__discount">
                Доставим этот товар бесплатно
              </div>
            {/if}

            {* Если это первый ресурс тогда только ему присвоить картинку с микроразметкой и отключить лоадер *}
            {if $isKrovlya || $isPlitaosb || $isUteplitel}
                {'@FILE modules/listing-gallery/chunks/product-gallery.tpl'|chunk:['product_id' => $id]}
                {if $proizvoditel[0]}
                    <div class="product-logo absolute listing__product-logo" data-val="{$proizvoditel[0]}"></div>
                {/if}
            {else}
                {if $idx == 1}
                    {if $_modx->resource.context_key in list ['knauf']}
                        <img src="{$srcval}" alt="{$pagetitle}" itemprop="contentUrl">
                    {else}
                        <img src="{'site_url' | option}{$srcval}" alt="{$pagetitle}" itemprop="contentUrl">
                    {/if}
                    
                {else}
                    <img src="/assets/images/loader.svg" class="lazy" data-src="{$srcval}" alt="{$pagetitle}">
                {/if}
            {/if}
        </a>

        {if $_modx->resource.context_key not in list ['pro-fanera', 'fasady-pro', 'fasad', 'pilomat', 'armatura-178', 'asconcrete']}
          <div class="listing__products-item-title">
            <a href="{$uri}" class="{$title_no_border_class_name}">{$pagetitle}</a>
          </div>
        {/if}


        <div class="header-content">
       
{*        {if $template == 51}*}
{*            <div class="icon-container">*}
{*                <div class="icon icon-cut">*}
{*                    <img src="/assets/template/img/icons/electric-saw.png" />*}
{*                    <div class="text-help">*}
{*                        для данного товара возможна дополнительная услуга по распилу*}
{*                    </div>*}
{*                </div>*}
{*                <div class="icon icon-certificate">*}
{*                    <img src="/assets/template/img/icons/certificate.png" />*}
{*                    <div class="text-help">*}
{*                        доставка {'!getTomorrowDate' | snippet} при заказе сегодня*}
{*                    </div>*}
{*                </div>*}
{*            </div>*}
{*            {/if}*}

            <div class="availability-and-rating">
                {include "file:sections/category/listing-product-avail.tpl" class_names=$class_name_product_avail}
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
            </div>
            {if $template == 50}
            <div class="listing__products-item-avail-today">
                <img src="/assets/template/img/icons/24-hour.png" />
                Доступно сегодня
            </div>
            {/if}
        </div>



        <div class="listing__products-item-art {$class_name_hide_article}">
        {if $_modx->context.key != 'gazobeton' and $_modx->context.key not in list ['rasprodazha']}
            Арт. {$article}
        {/if}
        </div>

        {include "file:sections/category/listing-product-controls.tpl" class_names=$class_name_product_controls}
    </div>
    <div class="listing__products-item-right">

        {if $template == 50}
            {$_modx->runSnippet("getCharacterCardProduct", [
                "context" => $_modx->resource.context_key,
                "category" => $_modx->resource.id,
                "product" => $id,
                "tplWrapper" => "@FILE blocks//listing-product-chars-wizard.tpl",
                "tpl" => "@FILE blocks/listing-product-chars-item-wizard.tpl",
            ])}
        {else}
            {include "file:blocks/listing-product-chars.tpl"}
        {/if}


        <div class="listing__products-item-price-and-logo">
            <div class="listing__products-item-price">
                <div {if $isKrovlya? || $isPlitaosb?}class="listing__products-item-flex"{/if}>
                    <div class="listing__products-item-price-wrap js-product__price-wrap">
                        <span class="js-product__price" data-default="{$defaultPrice}">{$outputPrice}</span> руб
                    </div>

                    {if $outputOldPrice?}
                        <div class="listing__product-new-price-wrap js-product__new-price-wrap js-product__new-price-val">
                            <span class="listing__product-new-price js-product__new-price" data-default="{$defaultOldPrice}">{$outputOldPrice}</span>
                            руб
                        </div>
                    {/if}

                    {*if $outputOldPrice? and $isKrovlya == true}
                        <div class="listing__discount-small">-{'!calculateDiscount' | snippet : ['id' => $id]}%</div>
                    {/if*}
                </div>

                {if !$condition}
                    {if $price and $unit[0]}
                        <div class="listing__products-item-measure">
                            Цена за
                            {$pricePer}
                        </div>
                    {/if}
                {/if}
            </div>

            {if $_modx->resource.context_key not in list ['krovlya', 'plitaosb', 'onduline1']}
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

{* Выводим блок "Нашли дешевле?" *}
{*
{if !$_modx->getPlaceholder('utm_source')}
*}

{set $total = $_modx->getPlaceholder('total')}
{set $ctx = $_modx->resource.context_key}

{if $ctx in list ['knauf', 'kirpich-m', 'krovlya', 'fasad','plitaosb','rockwool', 'penoplex', 'tn']}
    {if ($_modx->resource.template in list [4, 19, 5]) && (($idx == 1 && $total == 1) || ($idx == 2 && $total >= 2))}
        {if $ctx == 'tn'}
            {include 'file:chunks/listing-promo/tn.tpl'}
        {/if}
        {if $ctx == 'plitaosb'}
            {include 'file:chunks/listing-promo/plitaosb.tpl'}
        {/if}
        {if $ctx == 'knauf'}
            {include 'file:chunks/listing-promo/knauf.tpl'}
        {/if}
        {if $ctx == 'rockwool'}
            {include 'file:chunks/listing-promo/rockwool.tpl'}
        {/if}
        {if $ctx == 'kirpich-m'}
            {include 'file:chunks/listing-promo/kirpich-m.tpl'}
        {/if}
        {if $ctx == 'penoplex'}
            {include 'file:chunks/listing-promo/penoplex.tpl'}
        {/if}
        {if $ctx == 'fasad'}
            {include 'file:chunks/listing-promo/fasad-sajding.tpl'}
            {* {if $_modx->resource.id == 36782} 
                {include 'file:chunks/listing-promo/fasad-sajding.tpl'}
            {else}
                {include 'file:chunks/listing-promo/fasad.tpl'} <!-- блок Не можете выбрать -->
            {/if} *}
        {/if}
        {if $ctx == 'krovlya'}
            {include 'file:modules/catalog-side-banner/blocks/banner.tpl'}
        {/if}

    {/if}
    {set $idsin86214 = $_modx->resource.id in list $_modx->runSnippet('@FILE snippets/getCategoriesListIds.php', [
    'parent' => '86214'
    ])}
    {if ($_modx->resource.template in list [28]) && (($idx == 1 && $total == 1) || ($idx == 2 && $total >= 2))&& ($idsin86214)}
        {insert 'file:modules/catalog-side-banner/blocks/banner.tpl'}
    {/if}
{/if}

{include 'file:modules/catalog-horizontal-banner/blocks/catalog-horizontal-banner.tpl'}
