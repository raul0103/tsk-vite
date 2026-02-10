
{if $condition}
    <div class="product-card__units-wrap">
        <input type="hidden" name="unit" value="1">
        <span class="product-card__unit-span">Цена за</span>
        <span class="product-card__unit-link active" data-val="1">{$pricePer}</span>
        {foreach $itemUnits as $val}
            <span class="product-card__unit-link" data-val="{$val['id']}">{$val['title']}</span>
        {/foreach}
    </div>
    {elseif $_modx->context.key == 'fasad'}
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
{if $price}
    <div class="product-card__price-outer">
    {if $_modx->context.key == 'krovlya' and $_modx->resource.segment_key in list ["proflisty-zabory","proflisty-krovly,proflisty-zabory","proflisty-krovly","cherepica-iz-metalla","proflisty-zabory,proflisty-krovly"]}
    <div class="product-card__price-header">
        <div class="product-card__price-title">Цена:</div>
        {if $_modx->context.key == 'krovlya' && $outputOldPrice}
        <div class="js-product__new-price-val display-view-mobile">
            <span class="js-product__new-price" data-default="{$defaultOldPrice}">
                {$outputOldPrice}
            </span>
            руб
        </div>
        {/if}
    </div>
    {/if}
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
                <div class="js-product__new-price-val {if $_modx->context.key == 'krovlya'}display-view-desktop{/if}">
                            <span class="js-product__new-price" data-default="{$defaultOldPrice}">
                                {$outputOldPrice}
                            </span>
                    руб
                </div>
                <div class="js-product__new-price-text">
                    Цена действительна <br>до {'!getTomorrowDate' | snippet}
                </div>
            </div>
        {/if}
    </div>
{/if}
{* Помимо некоторых контекстов, данный блок не надо выводить для Ондулина и Металлочерепицы *}
{if ($_modx->resource.context_key not in list ['kirpich-m', 'fasady-pro', 'fasad', 'armatura-178', 'asconcrete']) && ($_modx->resource.parent not in list [16783,18186,18189,18193,18181,16805,36871,16784,16786,11760,12069,12070,12071,12073,12074,16789,37621,44676,44677,44678,44679,44680,44681,76923,16788])}
    {set $upakovka = 'getPackageNew' | snippet}
    {if $upakovka | length > 0}
        <div class="product-card__package">В упаковке: {$upakovka}</div>
    {/if}
{/if}
