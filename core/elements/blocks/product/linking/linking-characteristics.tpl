
{if isset($linksData)}
    {if $linksData.pokrytie?}
        {* Для разных родителей, разные подсказки *}
        {if $_modx->resource.parent in list [12069,11760,37621,12070,12071,12073,12074,76923]}
            {set $tip_category = 1}
        {/if}
        {if $_modx->resource.parent in list [16789,44681,44676,44677,44680,44678,44679]}
            {set $tip_category = 2}
        {/if}

        <div class="euv-custom-select__type-colums pokrytie-options product-card__select-wrap product-card__select-wrap_type_full mt" data-tip-category="{$tip_category}">
            <div class="product-card__select-span">Покрытие:</div>
            <div class="custom-select-wrap">
                <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                    <div class="euv-custom-select__input">
                        <span class="euv-custom-select__input-value">{$_modx->resource.pokrytie[0]}<span class="euv-custom-select__small-text">{$_modx->resource['vid-poverhnosti'][0]}</span></span>
                    </div>
                    <span class="euv-custom-select__btn"></span>
                    <div class="euv-custom-select__options-wrap">
                        <div class="euv-custom-select__options-wrap-scroll">
                            {foreach $linksData.pokrytie as $id => $val}
                                <a href="{$_modx->makeUrl($id)}" class="euv-custom-select__option" data-value="{$val}">
                                    <div class="euv-custom-select__title">{$val}</div>
                                    <span class="euv-custom-select__small-text">{$linksData['vid-poverhnosti'][$id]}</span>
                                </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="custom-select-mobile-link"></div>
                <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
            </div>
        </div>
    {/if}

    {if $linksData.cvet?}
        {include "file:blocks/product/linking/linking-cvet-select.tpl" links_data=$linksData.cvet cvet=$cvet}
    {/if}

    {if $linksData.collection?}
        <div class="product-card__select-wrap product-card__select-wrap_type_half">
            <div class="product-card__select-span">Коллекция:</div>
            <div class="custom-select-wrap">
                <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                    <div class="euv-custom-select__input">
                                            <span class="euv-custom-select__input-value">
                                                {$_modx->resource.collection[0]}
                                            </span>
                    </div>
                    <span class="euv-custom-select__btn"></span>
                    <div class="euv-custom-select__options-wrap">
                        <div class="euv-custom-select__options-wrap-scroll">
                            {foreach $linksData.collection as $id => $val}
                                <a href="{$_modx->makeUrl($id)}" class="euv-custom-select__option">
                                    {$val}
                                </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="custom-select-mobile-link"></div>
                <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
            </div>
        </div>
    {/if}

    {if $linksData.item_thickness?}
        <div class="product-card__select-wrap product-card__select-wrap_type_half{if $linksData.cvet?} product-card__select-wrap_align_right{/if} item-thickness-options">
            <div class="product-card__select-span">Толщина, мм:</div>
            <div class="custom-select-wrap">
                <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                    <div class="euv-custom-select__input">
                        <span class="euv-custom-select__input-value">{$_modx->resource.item_thickness[0]}</span>
                    </div>
                    <span class="euv-custom-select__btn"></span>
                    <div class="euv-custom-select__options-wrap">
                        <div class="euv-custom-select__options-wrap-scroll">
                            {foreach $linksData.item_thickness as $id => $val}
                                <a href="{$_modx->makeUrl($id)}" class="euv-custom-select__option">
                                    {$val}
                                </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="custom-select-mobile-link"></div>
                <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
            </div>
        </div>
    {/if}

    {if $linksData.tip?}
        <div class="product-card__select-wrap product-card__select-wrap_type_half{if $linksData.tip?} product-card__select-wrap_align_right{/if}">
            <div class="product-card__select-span">Тип:</div>
            <div class="custom-select-wrap">
                <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
                    <div class="euv-custom-select__input">
                        <span class="euv-custom-select__input-value">{$_modx->resource.tip[0]}</span>
                    </div>
                    <span class="euv-custom-select__btn"></span>
                    <div class="euv-custom-select__options-wrap">
                        <div class="euv-custom-select__options-wrap-scroll">
                            {foreach $linksData.tip as $id => $val}
                                <a href="{$_modx->makeUrl($id)}" class="euv-custom-select__option">
                                    {$val}
                                </a>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="custom-select-mobile-link"></div>
                <div href="#select" data-fancybox="" class="custom-select-mobile-link"></div>
            </div>
        </div>
    {/if}
{/if}