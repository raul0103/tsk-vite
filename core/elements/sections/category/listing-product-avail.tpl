<div class="listing__products-item-avail {$class_names}">
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