<div class="product-card-main js-product {if $_modx->resource.old_price?}js-product_with-discount{/if}" 
  {foreach $itemUnits as $key => $val}
      data-{$key}="{$val['val']}"
  {/foreach}
  
  itemprop="offers"
  itemscope
  itemtype="http://schema.org/Offer">

<div class="product-card-main__row">
  {insert "file:sections/product/card-info/v1/gallery.tpl"}
  {insert "file:sections/product/card-info/v1/center/wrapper.tpl"}
  {insert "file:modules/customer-photos/chunks/wrapper.tpl"}
</div>

{insert "file:sections/product/card-info/v1/right/wrapper.tpl"}

</div>