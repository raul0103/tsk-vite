<div class="product-cart-mv78__price-switcher product-card__units-wrap">
    <span class="product-cart-mv78__label product-card__unit-span">Цена за:</span>
    <div class="product-cart-mv78__price-options">
        <span class="product-cart-mv78__price-btn product-card__unit-link active" data-val="1">{$pricePer}</span>
        {foreach $itemUnits as $val}
        <span class="product-cart-mv78__price-btn product-card__unit-link"
            data-val="{$val['id']}">{$val['title']}</span>
        {/foreach}
    </div>
</div>