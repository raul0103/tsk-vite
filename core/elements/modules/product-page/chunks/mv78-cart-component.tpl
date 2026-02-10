{if $prodId is empty}
    {set $prodId = $_modx->resource['id']}
{/if}

{* Дробное добавление товара в корзину *}
{if $_pls['isFractional'] == 1 OR $_modx->resource.isFractional == 1}
    {set $extraClass = ' mv78-cart-counter_type_fractional'}
    {set $dataMin = '0.01'}
{else}
    {set $extraClass = ''}
    {set $dataMin = '1'}
{/if}

<div class="mv78-cart js-mv78-cart{if $itemInCart && $itemInCart > 0} js-mv78-cart-in-cart{/if}">
    {* Блок для добавления товара в корзину *}
    <div class="mv78-cart__controls mv78-cart__controls_action_add js-mv78-cart__controls js-mv78-cart__controls_action_add">
        <div class="mv78-cart-counter js-mv78-cart__custom-counter{$extraClass}">
            <span class="mv78-cart-counter__btn mv78-cart-counter__btn_dir_less">-</span>
            <input name="count" class="mv78-cart-counter__amount" value="1" data-min="{$dataMin}">
            <span class="mv78-cart-counter__btn mv78-cart-counter__btn_dir_more">+</span>
        </div>
        <span class="mv78-cart__btn-in-cart mv78-cart__to-cart js-mv78-cart__btn-in-cart js-mv78-cart__to-cart">В корзину</span>
    </div>

    {* Блок для изменения товара в корзине *}
    <div class="mv78-cart__controls mv78-cart__controls_action_change js-mv78-cart__controls js-mv78-cart__controls_action_change">
        <div class="mv78-cart-counter js-mv78-cart__custom-counter{$extraClass}">
            <span class="mv78-cart-counter__btn mv78-cart-counter__btn_dir_less">-</span>
            <input name="count" class="mv78-cart-counter__amount" value="{$itemInCart?:0}">
            <span class="mv78-cart-counter__btn mv78-cart-counter__btn_dir_more">+</span>
        </div>
        <a href="/cart/" class="mv78-cart__btn-in-cart js-mv78-cart__btn-in-cart">
            <span class="mv78-cart__btn-in-cart-top-text">В корзине</span> Перейти
        </a>
    </div>

    {* Скрытые формы для работы с miniShop2 *}
    <div class="mv78-cart__ms2-elems js-mv78-cart__ms2-elems">
        <form class="mv78-cart__form-add js-mv78-cart__form-add ms2_form" method="post">
            <input name="options" value="[]">
            <input name="id" value="{$prodId}">
            <input name="count" value="1">
            <input name="ctx" value="{$_modx->resource.context_key}">
            <button type="submit" name="ms2_action" value="cart/add">Добавить</button>
        </form>
        <form class="mv78-cart__form-change js-mv78-cart__form-change ms2_form" method="post">
            <input name="key" value="{$productKey}">
            <input name="count" value="{$itemInCart?:1}">
            <input name="ctx" value="{$_modx->resource.context_key}">
            <button type="submit" name="ms2_action" value="cart/change"></button>
        </form>
    </div>
</div>

