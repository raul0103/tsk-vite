{if isset($linksData) && $linksData.cvet?}
    {set $colorGroups = $linksData.cvet}
        {* {set $colorsSorted = $_modx->runSnippet("@FILE snippets/linking/getMergedArrayColors.php", ["colorsArrays" => $linksData.cvet])} *}
        <div class="product-card__select-wrap">
            <div class="product-card__select-other-color-span">
                Палитра цветов:
            </div>
            <div class="custom-select-other-color-wrap">
                <div class="colors-options custom-select_scrollable">
                   {foreach $colorGroups as $group}
                        {foreach $group as $id => $val}
                            <a href="{$_modx->makeUrl($id)}" data-product="{$id}" class="colors-select__option euv-custom-select__option" data-val="{$val}" data-value="{$val}">
                                {$val}
                            </a>
                        {/foreach}
                    {/foreach}
                </div>
            </div>
        </div>
{/if}