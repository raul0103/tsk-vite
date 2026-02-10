<div class="product-card product-card-mv78 js-product{if $itemInCart?} js-product-in-cart{/if}{if $outputOldPrice?} js-product_with-discount{/if}"
    {* Выводим data-атрибуты для расчета цены по единицам измерения *} {foreach $itemUnits as $key=> $val}
    data-{$key}="{$val['val']}"
    {/foreach}
    >

    <div class="product-card-mv78__header">
        <div class="product-card__reviews">
            <div class="product-card__reviews-stars five">
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

        <div class="mv78-header-actions">
            <button type="button" class="mv78-header-actions__btn mv78-header-actions__btn_compare js-product__btn js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}" aria-label="Сравнить товар">
                <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M16 26.6666V13.3333" stroke="#4F70AD" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M8 26.6666V5.33331" stroke="#4F70AD" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" />
                    <path d="M24 26.6666V21.3334" stroke="#4F70AD" stroke-width="4" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </button>
            <button type="button" class="mv78-header-actions__btn mv78-header-actions__btn_favorite js-product__btn js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}" aria-label="Добавить в избранное">
                <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_1164_1898)">
                        <path
                            d="M27.5992 5.96498C26.929 5.28163 26.1333 4.73957 25.2574 4.36972C24.3816 3.99988 23.4428 3.80952 22.4949 3.80952C21.5467 3.80952 20.6081 3.99988 19.7322 4.36972C18.8565 4.73957 18.0607 5.28163 17.3906 5.96498L15.9996 7.38249L14.6087 5.96498C13.2549 4.58533 11.4188 3.81024 9.50431 3.81024C7.5898 3.81024 5.7537 4.58533 4.39995 5.96498C3.04618 7.34464 2.28564 9.21585 2.28564 11.167C2.28564 13.1181 3.04618 14.9893 4.39995 16.369L5.79085 17.7865L15.9996 28.1905L26.2082 17.7865L27.5992 16.369C28.2698 15.686 28.8016 14.875 29.1646 13.9824C29.5274 13.0898 29.7142 12.1331 29.7142 11.167C29.7142 10.2008 29.5274 9.24412 29.1646 8.35154C28.8016 7.45896 28.2698 6.648 27.5992 5.96498Z"
                            stroke="#4F70AD" stroke-width="2.28571" stroke-linecap="round" stroke-linejoin="round" />
                    </g>
                    <defs>
                        <clipPath id="clip0_1164_1898">
                            <rect width="32" height="27.4286" fill="white" transform="translate(0 2.28572)" />
                        </clipPath>
                    </defs>
                </svg>
            </button>
            <div class="mv78-header-actions__share">
                <script src="https://yastatic.net/share2/share.js"></script>
                <div class="ya-share2" data-copy="last" data-curtain data-shape="round" data-limit="0" data-more-button-type="short" data-services="vkontakte,odnoklassniki,telegram,whatsapp"></div>
            </div>
        </div>

    </div>
    <div class="product-card-mv78__body">

        <div class="product-card-mv78__left">
            {* Галерея MV78 *}
            {include 'file:modules/product-page/chunks/mv78-product-gallery.tpl'}

        </div>
        <div class="product-card-mv78__right">
            {* Добавление товара в корзину MV78 *}
            {include 'file:modules/product-page/chunks/mv78-product-cart.tpl'}

            {* Информация о складах *}
            {include 'file:modules/product-page/chunks/mv78-warehouses.tpl'}

            {* Нашли дешевле? Снизим цену! MV78 *}
            {include 'file:modules/product-page/chunks/mv78-product-sale.tpl'}
        </div>
    </div>
</div>