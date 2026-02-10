<div class="listing__products-item-btns-wrap js-open-controls-modal {$class_names}">
    <span class="listing__products-item-btn listing__products-item-btn-more">
        <svg class="svg icon-dots" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16"
             height="16">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-dots"></use>
        </svg>
    </span>
    <div class="listing__products-item-btns-wrap-inner">
        <span title="Сравнить" class="js-product__action-btn listing__products-item-btn listing__products-item-btn-compare{if $checkItems['comp'][$id]?} active{/if}" href="#">
            <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16"
                 height="16">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
            </svg>
        </span>
        <span title="Избранное" class="js-product__action-btn listing__products-item-btn listing__products-item-btn-fav{if $checkItems['fav'][$id]?} active{/if}" href="#">
            <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 21 18" width="21"
                 height="18">
                <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
            </svg>
        </span>
    </div>
</div>