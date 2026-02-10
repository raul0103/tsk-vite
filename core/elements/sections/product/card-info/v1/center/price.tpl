{if $condition}
    <div class="product-card__units-wrap">
        <input type="hidden" name="unit" value="1">
        <span class="product-card__unit-span">Цена за</span>
        <span class="product-card__unit-link active" data-val="1">{$pricePer}</span>
        {foreach $itemUnits as $val}
            <span class="product-card__unit-link" data-val="{$val['id']}">{$val['title']}</span>
        {/foreach}
    </div>
{else}
    <input type="hidden" name="unit" value="1">
{/if}

{set $upakovka = 'getPackageNew' | snippet}
{if $upakovka | length > 0}
    <div class="product-card__package">В упаковке: {$upakovka}</div>
{/if}

{if $price}
    <div class="product-card__price-outer mb-14">
        <div class="product-card__price-wrap js-product__price-wrap">
            <span itemprop="price" class="js-product__price" data-default="{$defaultPrice}">{$outputPrice}</span>
            <meta itemprop="priceCurrency" content="RUB">
            руб

            {if !$condition}
                {set $unit = $_modx->resource.unit}
                {$unit[0] ? '/ ' ~ $unit[0] : ''}
            {/if}
        </div>

        {if $outputOldPrice?}
            <div class="product-card__new-price-wrap js-product__new-price-wrap">
                <div class="js-product__new-price-val">
                    <span class="js-product__new-price" data-default="{$defaultOldPrice}">
                        {$outputOldPrice}
                    </span>
                    руб
                </div>
            </div>
        {/if}
    </div>

    <div class="js-product__new-price-text mb-14">
        Цена действительна до {'!getTomorrowDate' | snippet}
    </div>
{/if}