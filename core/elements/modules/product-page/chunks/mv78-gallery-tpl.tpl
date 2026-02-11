{* Чанк для msGallery - форматирование данных галереи MV78 *}
{set $amountPhotos = $files | count}

{* Если есть файлы в галерее *}
{if $amountPhotos > 0}
    <div class="product-gallery-mv78 {if $amountPhotos == 1}product-gallery-mv78_single{/if}" style="display: flex  !important; flex-direction: row  !important; gap: 25px;">
        {* Превьюшки СЛЕВА - показываем только если больше 1 изображения *}
        {if $amountPhotos > 1}
        <div class="product-gallery-mv78__thumbs">
            <div class="swiper product-gallery-mv78__thumbs-slider">
                <div class="swiper-wrapper">
                    {foreach $files as $idx => $file}
                        {if $_modx->resource.imgWithWatermark && $idx == 0}
                            {set $fileSmall = '@FILE snippets/imgWithWatermark.php' | snippet : ['src' => $file['small']]}
                        {else}
                            {set $fileSmall = $file['small']}
                        {/if}
                        
                        <div class="swiper-slide product-gallery-mv78__thumb-slide{if $idx == 0} active{/if}">
                            <img class="product-gallery-mv78__thumb-img" 
                                 src="{$fileSmall | urlRepearer}" 
                                 alt="{$_modx->resource.pagetitle} - фото {$idx + 1}">
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
        {/if}
        
        {* Основной слайдер СПРАВА *}
        <div class="product-gallery-mv78__main">
            <div class="swiper product-gallery-mv78__main-slider">
                <div class="swiper-wrapper">
                    {foreach $files as $idx => $file}
                        {if $_modx->resource.imgWithWatermark && $idx == 0}
                            {set $fileUrl = '@FILE snippets/imgWithWatermark.php' | snippet : ['src' => $file['url']]}
                        {else}
                            {set $fileUrl = $file['url']}
                        {/if}
                        
                        <div class="swiper-slide product-gallery-mv78__slide">
                            <a href="{$fileUrl | urlRepearer}" class="product-gallery-mv78__link zoom-default">
                                <img class="product-gallery-mv78__img swiper-lazy" 
                                     src="{$fileUrl | urlRepearer}" 
                                     alt="{$_modx->resource.pagetitle} - фото {$idx + 1}"
                                     {if $idx == 0}itemprop="image"{/if}>
                            </a>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{/if}

