{if $output? }
<article class="block-delivery">
  <table class="block-delivery__table">
    <thead>
    <tr>
      <th class="pricetable-col">Размер</th>
      <th class="pricetable-col">Сорт</th>
      <th class="pricetable-col">Цена за штуку</th>
      <th class="pricetable-col">Цена за куб</th>
    </tr>
    </thead>
    <tbody>
    {$output}
    </tbody>
  </table>
  
  <span data-src="#header-callback" data-fancybox class="block-delivery__btn custom-btn pricetable__btn">Заказать пиломатериалы</span>
</article>
{/if}