{* Блок информации о складах *}
<div class="product-warehouses-mv78">
    <div class="product-card__delivtext">{'@FILE snippets/getDeliveryText.php' | snippet}</div>
    {* Срок доставки *}
    {"@FILE modules/stocks/snippets/stocks.php" | snippet : ['parentStocks' => 'skladi_page_id' | config ]}
</div>






