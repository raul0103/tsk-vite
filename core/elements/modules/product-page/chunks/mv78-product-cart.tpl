<div class="product-cart-mv78">
    {* Блок прайса и характеристик *}
    <div class="product-cart-mv78__price-block">
        
        {* Толщина и артикул *}
        <div class="product-cart-mv78__thickness-art">
            {* Перелинковка по толщине *}
            {include 'file:modules/product-page/chunks/mv78-relinking-thickness.tpl'}
            <div class="product-cart-mv78__article">Арт. {$_modx->resource.article | default: 'Shi-92923'}</div>
        </div>

        {* Переключатель цены *}
        {if $condition}
            {include 'file:modules/product-page/chunks/mv78-selected-price.tpl'}
        {/if}

        {* Цена *}
        {if $price}
            {include 'file:modules/product-page/chunks/mv78-product-price.tpl'}
        {/if}

        {* Hidden input для единицы измерения - должен быть на уровне с формами *}
        <input type="hidden" name="unit" value="1">
        
        {* Количество и кнопка в корзину *}
        <div class="product-cart-mv78__cart-controls">
            {include 'file:modules/product-page/chunks/mv78-button-cart.tpl'}
        </div>

        {* Кнопка купить в 1 клик *}
        <button type="button" data-fancybox="" data-src="#callback" class="product-cart-mv78__one-click-btn product-card__buy white-btn">
            Купить в один клик
        </button>
    </div>
</div>
