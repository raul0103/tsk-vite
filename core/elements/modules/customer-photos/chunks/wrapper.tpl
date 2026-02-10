{set $images = "@FILE modules/customer-photos/snippets/getCustomerPhotos.php" | snippet}

{if $images}
<div class="customer-photos">
    <div class="fw-600 mb-16">Фото наших покупателей</div>
    <div class="swiper" data-swiper="customer-photos">
        <div class="swiper-wrapper">
            {foreach $images as $image}
                {set $thumb = 'phpthumbon' | snippet : [
                    'input' => "{$image}",
                    'options' => '&w=150&h=100&zc=1'
                ]}
                <a class="swiper-slide" data-fancybox="customer-photos" href="{$image}">
                    <img src="{$thumb}" />
                </a>
            {/foreach}
        </div>

        <div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>
</div>
{/if}