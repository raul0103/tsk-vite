<tr data-id="{$id}" data-length="{$item_length[0]}" data-width="{$item_width[0]}" data-thickness="{$item_thickness[0]}" data-vlazhnost="{$vlazhnost[0]}" class="pricetable-row">
  <td class="pricetable-col pricetable-col_razmer-mm">{$_pls['razmer-mm'][0]}</td>
  <td class="pricetable-col pricetable-col_sort">{$_pls['product-sort'][0]}</td>
  <td class="pricetable-col pricetable-col_price">{(($_pls['price'] | replace : ' ' : '') / $_pls['kol-vokub-sh'][0]) | ceil | beautifulNum} руб</td>
  <td class="pricetable-col pricetable-col_kol-vokub-sh">{$_pls['price']} руб</td>
</tr>
