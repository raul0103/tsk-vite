<div class="product-card__select-wrap{if $_modx->resource.template == 22} product-card__select-wrap_type_full{else} product-card__select-wrap_type_half{/if} cvet-options">
    <div class="product-card__select-span">
        {if $_modx->resource.template == 17}
            Цвет:
        {/if}
        {if $_modx->resource.template in list [20, 22]}
            Оттенок:
        {/if}
    </div>
    <div class="custom-select-wrap">
        <div class="colors-options euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
            <div class="euv-custom-select__input">
                <span data-val="{$cvet}" class="euv-custom-select__input-value">{$cvet}</span>
            </div>
            <span class="euv-custom-select__btn"></span>
            <div class="euv-custom-select__options-wrap">
                <div class="euv-custom-select__options-wrap-scroll">
                    <div class="euv-custom-select__options-wrap-scroll-inner">
                        {foreach $links_data as $data}
                            <div class="euv-custom-select__options-col">
                                {foreach $data as $id => $val}
                                    {set $v = $val}
                                    <a href="{$_modx->makeUrl($id)}" data-product="{$id}" class="euv-custom-select__option" data-val="{$v}" data-value="{$val}">
                                        {$val}
                                    </a>
                                {/foreach}
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
        <div class="custom-select-mobile-link"></div>
        <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
    </div>
</div>