
{set $params = [
    'selection_option' => 'item_thickness',
    'show_current' => true
]}

{if $_modx->resource.parent in list [10086,10548,10200]}
    {set $params['main_options'] = ['seria']}
{/if}

{set $similar_products = "@FILE modules/similar-products/snippets/getSimilarProducts.php" | snippet : $params}
{if $similar_products}
    <div class="similar-products--v1 d-flex flex-wrap gap-8 mb-16">
        <span class="fw-600">Толщина</span>

        {foreach $similar_products as $similar_product}
            {if $similar_product['id'] == $_modx->resource.id}
                <span class="button button-bordered button-bordered--small active">{$similar_product['value']} мм</span>   
            {else}
                <a class="button button-bordered button-bordered--small" href="{$similar_product['uri']}">{$similar_product['value']} мм</a>
            {/if}
        {/foreach}
    </div>
{/if}