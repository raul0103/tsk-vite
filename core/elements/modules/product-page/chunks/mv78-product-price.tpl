<div class="product-cart-mv78__price-info">
<div class="product-cart-mv78__price-wrap product-card__price-outer">
    <div class="product-card__price-wrap js-product__price-wrap">
        <span itemprop="price" class="product-cart-mv78__price js-product__price" data-default="{$defaultPrice}">{$outputPrice}</span>
        <meta itemprop="priceCurrency" content="RUB">
        руб
    </div>
</div>

{set $upakovka = 'getPackageNew' | snippet}
{if $upakovka | length > 0}
{set $packageText = 'В упаковке:'}
<div class="product-cart-mv78__package product-card__package">{$packageText} {$upakovka}</div>
{/if}
</div>