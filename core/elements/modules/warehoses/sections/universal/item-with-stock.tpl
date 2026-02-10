<tr>
    <td class="pricetable-col">
        <a href="{$id | url}">{$pagetitle}</a>
    </td>
    <td class="pricetable-col">
        {$_modx->runSnippet("@FILE modules/stocks/snippets/getProductStockTotal.php", [
            "productId" => $id,
            "context" => $_modx->context.key,
            "useCache" => 1
        ])}
    </td>
 </tr>


