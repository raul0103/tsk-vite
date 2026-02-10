{if !$linksData['item_thickness']?}
    {set $similar_products = "@FILE modules/similar-products/snippets/getSimilarProducts.php" | snippet : [
        'selection_option' => 'item_thickness',
        'show_current' => true
    ]}
    {set $linksData['item_thickness'] = "@FILE snippets/linking/similarProducts2linksData.php" | snippet : ['input' => $similar_products]}
{/if}
{if $linksData['item_thickness']?}
    <div class="product-cart-mv78__thickness">
        <span class="product-cart-mv78__label">Толщина:</span>
        <div class="product-cart-mv78__thickness-options">
            {foreach $linksData['item_thickness'] as $id => $val}
                {if $_modx->resource['item_thickness'][0] == $val}
                    <span class="product-cart-mv78__thickness-btn active">
                        {$val} мм
                    </span>
                {else}
                    <a href="{$_modx->makeUrl($id, '', '', 'full')}" class="product-cart-mv78__thickness-btn">
                        {$val} мм
                    </a>
                {/if}
            {/foreach}
        </div>
    </div>
{elseif $_modx->resource['item_thickness'][0]}
    {* Если нет перелинковки, но есть толщина - показываем просто значение *}
    <div class="product-cart-mv78__thickness">
        <span class="product-cart-mv78__label">Толщина:</span>
        <div class="product-cart-mv78__thickness-options">
            <span class="product-cart-mv78__thickness-btn active">
                {$_modx->resource['item_thickness'][0]} мм
            </span>
        </div>
    </div>
{/if}
