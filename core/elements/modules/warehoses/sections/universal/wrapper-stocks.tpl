{set $idCat = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'catalog', 'contextKey' => $_modx->resource.context_key]}

{if $idCat}
    {set $where = '{"class_key":"msCategory"}'}

    {set $parents = 'pdoResources' | snippet : [
        'parents'=> $idCat
        'tpl' => '@INLINE {$id},'
        'depth' => 0
        'where' => $where
        'limit' => 0
        'context' => $_modx->resource.context_key
    ]}

    <div class="warehouse-table__item 1">
        {foreach $parents | split as $parent}
            {set $products = '@FILE modules/stocks/snippets/listProductsStocksSorted.php' | snippet : [
                'parent' => $parent
                'tpl' => '@FILE modules/warehoses/sections/universal/item-with-stock-status.tpl'
                'limit' => 50
                'stockName' => $_modx->resource.pagetitle
                'context' => $_modx->resource.context_key
            ]}

            {if $products}
            <div class="warehouse-table__header">
                <h2>{$parent | resource : 'pagetitle'} на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])} </h2>
            </div>

            <div class="block-delivery">
                <table class="block-delivery__table">
                <tbody>
                    <tr>
                    <th class="pricetable-col">Товар</th>
                    <th class="pricetable-col">Количество в наличии</th>
                    </tr>
                </tbody>
                <tbody>
                    {$products}
                </tbody>
                </table>
            </div>
            {/if}
        {/foreach}
    </div>
{/if}
