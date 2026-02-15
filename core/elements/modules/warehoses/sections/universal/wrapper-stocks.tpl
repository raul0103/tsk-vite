{set $idCat = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'catalog', 'contextKey' => $_modx->resource.context_key]}

{if $idCat}
    {set $where = '{"class_key":"msCategory"}'}
    {set $allParents = 'pdoResources' | snippet : [
        'parents'=> $idCat
        'tpl' => '@INLINE {$id},'
        'depth' => 0
        'where' => $where
        'limit' => 0
        'context' => $_modx->resource.context_key
    ]}

    {set $parents = '@FILE modules/stocks/snippets/getWarehouseCategoryIdsSorted.php' | snippet : [
        'catalogAlias' => 'catalog'
        'catalogId' => $idCat
        'context' => $_modx->resource.context_key
        'stockName' => $_modx->resource.pagetitle
        'productsLimit' => 50
    ]}

    {if !$parents}
        {set $parents = $allParents}
    {/if}

    <div class="warehouse-table__item 1">
        {foreach $parents | split : ',' as $parent}
            {set $products = '@FILE modules/stocks/snippets/listProductsStocksSorted.php' | snippet : [
                'parent' => $parent
                'tpl' => '@FILE modules/warehoses/sections/universal/item-with-stock-status.tpl'
                'limit' => 50
                'stockName' => $_modx->resource.pagetitle
                'context' => $_modx->resource.context_key
            ]}

            {if $products}
            <div class="warehouse-table__header">
                <h2>{$parent | resource : 'pagetitle'} &#1085;&#1072; {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])} </h2>
            </div>

            <div class="block-delivery">
                <table class="block-delivery__table">
                <tbody>
                    <tr>
                    <th class="pricetable-col">&#1058;&#1086;&#1074;&#1072;&#1088;</th>
                    <th class="pricetable-col">&#1050;&#1086;&#1083;&#1080;&#1095;&#1077;&#1089;&#1090;&#1074;&#1086; &#1074; &#1085;&#1072;&#1083;&#1080;&#1095;&#1080;&#1080;</th>
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
