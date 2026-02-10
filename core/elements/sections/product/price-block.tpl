{if $_modx->context.key in list['fasad']}
    {include 'file:sections/product/price-advantures-fasad.tpl'}
{else}
    <div class="product-card__left-info">
        {include "file:sections/product/price-block-content.tpl"}
    </div>
{/if}