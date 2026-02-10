

<div class="euv-custom-select__type-colums {$key}-options product-card__select-wrap product-card__select-wrap_type_full mt" data-tip-category="{$tip_category}">
    <div class="product-card__select-span">{$keyName}:</div>
    <div class="custom-select-wrap">
        <div class="euv-custom-select euv-custom-select_type_wide custom-select_scrollable">
            <div class="euv-custom-select__input">
                <span class="euv-custom-select__input-value">{$_modx->resource[$key][0]}<span class="euv-custom-select__small-text"></span></span>
            </div>
            <span class="euv-custom-select__btn"></span>
            <div class="euv-custom-select__options-wrap">
                <div class="euv-custom-select__options-wrap-scroll">
                    {foreach $linksData[$key] as $id => $val}
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