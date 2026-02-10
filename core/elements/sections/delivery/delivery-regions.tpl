<section class="delivery-regions order_2"><h2 class="block-title">Регионы доставки</h2>
    <div class="delivery-regions__wrapper">
        <div class="delivery-regions__main">
            <div class="delivery-regions__search"><input type="text" class="user_search" id="search-region"
                                                         placeholder="Введите населенный пункт"></div>
            <!-- delivery-regions__search--> <p style="color:var(--black)">Или найдите его в списке ниже и перейдите на
                страницу с подробным описанием:</p>
            <div class="table">
                <div class="table__title">
                    <div class="table__title_item"><p>Населенный пункт</p></div>
                    <div class="table__title_item"><p>Стоимость доставки 1м<sup>3</sup></p> <span>*при единовременном заказе более 7м<sup>3</sup></span>
                    </div>
                    <div class="table__title_item"><p>Стоимость доставки</p>
                        <span>*при единовременном заказе до 7м<sup>3</sup>
                        </span>
                    </div>
                </div><!-- .table-adres__title -->
                <div class="table-body" id="search-menu">
                    {set $rows = json_decode($_modx->resource.delivery_regions, true)}
                    {foreach $rows as $row}

                        <div class="table-body__row"><a> <span
                                        class="table-cell">{$row.name}</span> <span class="table-cell">{$row.price} руб.</span>
                                <span class="table-cell">{$row.price_opt} руб.
                                </span>
                            </a>
                        </div>
                    {/foreach}

                </div>
            </div>
         </div>
    </div>
</section>


<style>


</style>