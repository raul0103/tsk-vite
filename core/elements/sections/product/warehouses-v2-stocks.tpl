<div class="warehouse">

{set $parentId = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'skladyi']}


{set $sklads = 'pdoResources' | snippet : [
    'parents' => $parentId,
    'limit' => 0,
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'select' => 'id,pagetitle',
    'return' => 'json'
] | json_decode}

{if $_modx->resource.context_key == "fasad" and $_modx->resource.template == 58}
    {set $sklads = 'pdoResources' | snippet : [
        'resources' => "132996,132994,133005",
        'parents' => $parentId,
        'limit' => 0,
        'sortby' => 'menuindex',
        'sortdir' => 'ASC',
        'select' => 'id,pagetitle',
        'return' => 'json'
] | json_decode}

{/if}


<div class="warehouse__content">
    <div class="warehouse__content-block">
        <div class="list">
            <div class="option">
                {set $sum = 0}
                {* parent 72811 *}
                {foreach $sklads as $sklad}
                    {set $result = $_modx->runSnippet("@FILE modules/warehoses/snippets/searchDataSetWarehouse.php", [
                    "parent" => $_modx->resource.parent,
                    "warehouse" => $sklad['pagetitle']
                    ])}

                    {if !empty($result)}
                        {set $sum += $_modx->runSnippet("@FILE snippets/random.php", [
                        "id" => $_modx->resource.id,
                        "start" => $result['start'],
                        "end" => $result['end'],
                        "unique" => md5($sklad['pagetitle'])
                        ])}
                    {else}
                        {set $sum += $_modx->runSnippet("@FILE snippets/random.php", [
                        "id" => $_modx->resource.id,
                        "start" => 300,
                        "end" => 1600,
                        "unique" => md5($sklad['pagetitle'])
                        ])}
                    {/if}


                {/foreach}
                <span class="availability">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zM227.3 387.3l184-184c6.2-6.2 6.2-16.4 0-22.6l-22.6-22.6c-6.2-6.2-16.4-6.2-22.6 0L216 308.1l-70.1-70.1c-6.2-6.2-16.4-6.2-22.6 0l-22.6 22.6c-6.2 6.2-6.2 16.4 0 22.6l104 104c6.2 6.2 16.4 6.2 22.6 0z"/></svg></i>
                    В наличии
                </span>
                <span class="value">
                    {$sum} шт.
                    <svg class="check-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
                </span>
            </div>
        </div>
    </div>


    <div class="content-block">
        <div class="header-small">Доступно на {count($sklads)} складах</div>

        {if $_modx->getPlaceholder('localdata').main_contacts.email_prefix != "krasnodar"}
        <div class="list">
            {foreach $sklads as $sklad}
                <div class="option">
                    <span class="name">
                        <a href="{$sklad['id'] | url}">{$sklad['pagetitle']}</a>
                    </span>
                    <span class="value">
                        {* Подробная разбивка по складам остаётся как в оригинале (случайные диапазоны),
                           при необходимости поменяем на реальную после доработки источника *}
                        {set $result = $_modx->runSnippet("@FILE modules/warehoses/snippets/searchDataSetWarehouse.php", [
                            "parent" => $_modx->resource.parent,
                            "warehouse" => $sklad['pagetitle']
                         ])}
                        {if !empty($result)}
                            {set $inStock = $_modx->runSnippet("@FILE snippets/random.php", [
                                "id" => $_modx->resource.id,
                                "start" => $result['start'],
                                "end" => $result['end'],
                                "unique" => md5($sklad['pagetitle'])
                            ])}
                        {else}
                            {set $inStock = $_modx->runSnippet("@FILE snippets/random.php", [
                                "id" => $_modx->resource.id,
                                "start" => 300,
                                "end" => 1600,
                                "unique" => md5($sklad['pagetitle'])
                            ])}
                        {/if}
                        {if $inStock != 0}
                            {$inStock} шт.
                        {else}
                            <span class="notAvailable">нет в наличии</span>
                        {/if}
                        <svg class="check-icon {if $inStock === 0}out-of-stock{/if}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
                    </span>
                </div>
            {/foreach}
        </div>
            {if $_modx->context.key not in list ['fasad']}
            <span class="show-more-warehouse">Все склады</span>
            {/if}
        {/if}
    </div>
</div>
</div>


