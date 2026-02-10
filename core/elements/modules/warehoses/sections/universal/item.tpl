<tr> 
    <td>
        <a href="{$uri}">{$pagetitle}</a>
    </td> 
    <td>
        {set $unit = $_pls['unit'][0]}
        {set $unique_id=$id~'-'~$_modx->resource.id}
        {include "file:modules/warehoses/chunks/value.tpl" unit=$unit unique_id=$unique_id}
    </td>
</tr>