{set $reviews = '@FILE snippets/getReviews.php' | snippet | fromJSON}

{set $hrefval = 'assets/images/no_image.jpg'}
{set $srcval = 'assets/images/no_image.jpg'}
{if $image ?}
    {if $_modx->resource.imgWithWatermark ?}
        {set $hrefval = '@FILE snippets/imgWithWatermark.php' | snippet : ['src' => $image]}
    {else}
        {set $hrefval = $image}
    {/if}
{/if}
{if $_modx->resource['thumb'] ?}
    {if $_modx->resource.imgWithWatermark ?}
        {set $srcval = '@FILE snippets/imgWithWatermark.php' | snippet : ['src' => $_modx->resource['thumb']]}
    {else}
        {set $srcval = $_modx->resource['thumb']}
    {/if}
{/if}

<div class="product-card__content">
    {* Основные переменные для чанка *}
    {set $src = $_modx->resource}
    {insert "file:blocks/set-values-for-prod.tpl"}

    {* Бренд / Производитель *}
    {if $_modx->resource.context_key != 'isorok'}
        {set $itemVendor = $_modx->resource['proizvoditel'][0]}
    {/if}

    {* Данные для добавления / изменения товара в корзине *}
    {set $prodId = $_modx->resource['id']}
    {if $_pls['isFractional'] == 1 OR $_modx->resource.isFractional == 1}
        {set $extraClass = ' custom-counter_type_fractional'}
        {set $dataMin = '0.01'}
    {else}
        {set $extraClass = ''}
        {set $dataMin = '1'}
    {/if}

    {* Галерея *}
    {'!msGallery' | snippet : [
        'tpl' => '@FILE chunks/gallery.tpl',
        'product' => $id,
        'toPlaceholder' => 'gallery'
    ]}

    {set $gallery = $_modx->getPlaceholder('gallery')}
    {set $fstImageSrc = 'site_url' | option ~ ($srcval | ereplace : '/\/{2,}/' : '/' | ereplace : '/^\//' : '')}

    {if $_modx->resource.parent in list  $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => "16788,86214"])}
        {include "file:sections/product/card-krovlya.tpl"}
    {elseif $_modx->resource.template in list [17, 20, 22]}
        {* Кровля *}
        {include "file:sections/product/card-info-relinking-selects.tpl"}
    {elseif $_modx->resource.template == 21}
        {* Фанера *}
        {include "file:sections/product/card-info-relinking-btns.tpl"}
    {elseif $_modx->resource.template == 51}
        {include "file:sections/product/card-info-relinking-petrovich.tpl"}
    {elseif $_modx->resource.template in list [53, 54]}
        {* Фасад с изображениями *}
        {include "file:sections/product/card-content/fasad/fasad-card-standart.tpl"}
    {elseif $_modx->resource.template == 58}
        {* Фасад с изображениями *}
        {include "file:sections/product/card-content/fasad/fasad-card-images.tpl"}
    {elseif $_modx->resource.template == 59}
        {include "file:modules/product-page/templates/minvata78.tpl"}
    {else}
        
        {if $_modx->resource.context_key in list ['rockwool', 'tn', 'penoplex', 'isover', 'paroc', 'ursa', 'umatex']}
            {* Необычная карточка (с фотками покупателей) *}
            {insert "file:sections/product/card-info/v1/wrapper.tpl"}
        {else}
            {* Обычная карточка *}
            {insert "file:sections/product/card-info.tpl"}
        {/if}
        
    {/if}
    

    {if $_modx->resource.introtext && $_modx->resource.context_key != 'policarbonat'}
        <div class="product-card__about">
            {$_modx->resource.introtext}
        </div>
    {/if}

    {include "file:sections/product/card-tabs.tpl"}

    {if $_modx->resource.context_key == 'pilomat' && $_modx->resource.template == 21}
        {include 'file:sections/product/card-content-tab.tpl' showOnMobile=true}
    {/if}
</div>
