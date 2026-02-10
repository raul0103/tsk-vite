<tr class="stock-status_{$status}">
    <td class="pricetable-col">
        <a href="{$id | url}">{$pagetitle}</a>
    </td>
    <td class="pricetable-col">
        {if $status == 'request'}
            <button class="" data-fancybox data-src="#callback">Под заказ</button>
        {else}
            {$count}
        {/if}
    </td>
</tr>


