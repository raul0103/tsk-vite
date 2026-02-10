{set $data = '@FILE modules/listing-gallery/snippets/getProductGallery.php' | snippet:['product_id' => $product_id]}


{if $data['images'] | count > 0}
    <div class="listing-gallery swiper-container">
        <div class="swiper-wrapper">
            {foreach $data['images'] as $image}
                <div class="listing-gallery__image-wrapper swiper-slide">
                    <img data-src="{$image['thumb']}" src="/assets/images/loader.svg" class="swiper-lazy">
                </div>
            {/foreach}
        </div>
        <div class="hover-zones"></div>
        <div class="swiper-pagination"></div>
    </div>
{/if}