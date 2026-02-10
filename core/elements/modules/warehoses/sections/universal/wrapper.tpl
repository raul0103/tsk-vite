{set $idCat = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'catalog']}

{if $idCat}
    {foreach [
        ["search" => "теплоизоляц", "title" => "Наличие теплоизоляции"],
        ["search" => "утеплит", "title" => "Наличие утеплителя"],  
    ] as $group}
        {set $where = '{"class_key":"msCategory"}'}
        {* set $where = '{"class_key":"msCategory","pagetitle:LIKE":"%'~$group['search']~'%"}' *}

        {set $parents = 'pdoResources' | snippet : [
            'parents'=> $idCat
            'tpl' => '@INLINE {$id},'
            'depth' => 0
            'where' => $where
            'limit' => 0
        ]}

        <div class="warehouse-table__item">
            {foreach $parents | split as $parent}
                {set $products = 'msProducts' | snippet : [
                    'parents' => $parent
                    'tpl' => '@FILE modules/warehoses/sections/universal/item.tpl'
                    'where' => '{"class_key":"msProduct"}'
                    'limit' => 50
                ]}

                {if $products}
                <div class="warehouse-table__header">
                    <h2>{$parent | resource : 'pagetitle'} на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])}</h2>
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
    {/foreach}
{/if}