<div
  class="with-customer-photos"
>
  <div class="product-card__gallery">
    <div class="product-card__img-wrap">
      {if $itemVendor?}
      <div class="product-card__brand" data-val="{$itemVendor}"></div>
      {/if} {if $outputOldPrice?}
      <div class="js-product__discount product-card__discount">
        Скидка {'!calculateDiscount' | snippet}%
      </div>
      {/if}
      <a href="{$hrefval}" class="product-card__img-link zoom-default">
        <img
          class="product-card__img"
          src="{'@FILE snippets/fixImagePath.php' | snippet : ['input' => $fstImageSrc]}"
          alt="{$_modx->resource.pagetitle}"
          itemprop="image"
        />
      </a>
    </div>

    {$_modx->getPlaceholder('gallery')}
  </div>
</div>
