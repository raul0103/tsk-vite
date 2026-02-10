<div class="product-card-main__center">
    {insert "file:sections/product/card-info/v1/center/similar.tpl"}
    {insert "file:sections/product/card-info/v1/center/price.tpl"}
    
    {include "file:chunks/productElems.tpl"}
                    
    <button data-fancybox="" href="#callback" class="product-card__buy white-btn mb-14">
        КУПИТЬ В 1 КЛИК
    </button>

    {if !$_modx->getPlaceholder('utm_source')}
        <div class="product-card__discount-block product-card__discount-block_icon_fire">
            <span class="product-card__discount-block-proposal">Нашли дешевле? Снизим цену!</span>
            <span class="product-card__discount-block-link" data-fancybox data-src="#discount" data-btn-key="discount">Подробнее</span>
        </div>
    {/if}
</div>