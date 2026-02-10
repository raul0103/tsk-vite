{set $banner_data = "@FILE snippets/apiGetBanner.php" | snippet : [
'id' => $_modx->resource.id,
'parent' => $_modx->resource.parent,
'position' => 'listing',
]}

{set $desktop_image = ""}
{set $mobile_image = ""}

{set $banner_groups = $banner_data['data']}

{if $banner_data['status'] && !empty($banner_groups)}
    <div class="listing__catalog-promo _promo_1 banner-rotator promo-fasad-sajding">
        {foreach $banner_groups as $banner_group}

            {set $banners = $banner_group['banners_by_type']}
            {set $button_settings = $banner_group['button']}
            {set $button_classname = $banner_group['data']['button-classname']}

            {if isset($banners['desktop']['image_url'])}
                {set $desktop_image = $banners['desktop']['image_url']}
            {/if}

            {if isset($banners['tablet']['image_url'])}
                {set $tablet_image = $banners['tablet']['image_url']}
            {/if}

            {if isset($banners['mobile']['image_url'])}
                {set $mobile_image = $banners['mobile']['image_url']}
            {/if}

            <div class="banner-rotator__slide active">
                <picture>
                    <source media="(max-width: 725px)" srcset="{$tablet_image}">
                    <source media="(max-width: 320px)" srcset="{$mobile_image}">
                    <img data-fancybox="" data-src="#callback" src="{$desktop_image}" class="listing__catalog-promo-img">
                </picture>
                <span data-fancybox="" data-src="#callback" class="listing__catalog-promo-btn-more desktop-only" data-btn-key="catalog">
                    Заказать
                </span>
            </div>
        {/foreach}
    </div>
{/if}



