<div class="warehouse-table__item">
    <div class="warehouse-table__header">
        <h2>Наличие плит OSB на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])}</h2>
    </div>
    {$_modx->runSnippet("@FILE modules/warehoses/snippets/list.php", [
    "parents" => "66818,69961",
    "where" => $where,
    "unique" => md5($_modx->resource.pagetitle),
    ])}
</div>

<div class="warehouse-table__item">
    <div class="warehouse-table__header">
        <h2>Наличие Гипсокартона и ГВЛ на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])}</h2>
    </div>
    {$_modx->runSnippet("@FILE modules/warehoses/snippets/list.php", [
    "parents" => "70259,70019",
    "where" => $where,
    "unique" => md5($_modx->resource.pagetitle),
    ])}
</div>

<div class="warehouse-table__item">
    <div class="warehouse-table__header">
        <h2>Наличие плит ДСП на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])}</h2>
    </div>
    {$_modx->runSnippet("@FILE modules/warehoses/snippets/list.php", [
    "parents" => "69966",
    "where" => $where,
    "unique" => md5($_modx->resource.pagetitle),
    ])}
</div>

<div class="warehouse-table__item">
    <div class="warehouse-table__header">
        <h2>Наличие плит ЦСП на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])}</h2>
    </div>
    {$_modx->runSnippet("@FILE modules/warehoses/snippets/list.php", [
    "parents" => "70257",
    "where" => $where,
    "unique" => md5($_modx->resource.pagetitle),
    ])}
</div>

<div class="warehouse-table__item">
    <div class="warehouse-table__header">
        <h2>Наличие плит фибролитовых на {$_modx->runSnippet("@FILE snippets/getCurrentDate.php", ["modifyDate" => "0 day"])}</h2>
    </div>
    {$_modx->runSnippet("@FILE modules/warehoses/snippets/list.php", [
    "parents" => "70401",
    "where" => $where,
    "unique" => md5($_modx->resource.pagetitle),
    ])}
</div>
