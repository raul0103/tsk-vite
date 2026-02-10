{* Получаем файлы галереи через msGallery с кастомным чанком *}
{'!msGallery' | snippet : [
    'product' => $_modx->resource.id,
    'filetype' => 'image',
    'limit' => 0,
    'tpl' => '@FILE modules/product-page/chunks/mv78-gallery-tpl.tpl',
    'toPlaceholder' => 'mv78Gallery'
]}

{* Выводим галерею или fallback на основное изображение *}
{if $_modx->getPlaceholder('mv78Gallery')}
    {$_modx->getPlaceholder('mv78Gallery')}
{else}
    {* Если нет файлов в галерее miniShop2, показываем основное изображение товара *}
    <div class="product-gallery-mv78 product-gallery-mv78_single">
        <div class="product-gallery-mv78__main">
            <div class="swiper product-gallery-mv78__main-slider">
                <div class="swiper-wrapper">
                    <div class="swiper-slide product-gallery-mv78__slide">
                        <a href="{$hrefval}" class="product-gallery-mv78__link zoom-default">
                            <img class="product-gallery-mv78__img swiper-lazy" 
                                 src="{$fstImageSrc | urlRepearer}" 
                                 alt="{$_modx->resource.pagetitle}"
                                 itemprop="image">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}
