
<div class="detail-info">
    <div class="detail-info__wrapper-price detail-info-price">
        <div class="detail-info-price__unit">

        <div class="product-card__units-wrap">
            <input type="hidden" name="unit" value="1">
            <span class="product-card__unit-span">Цена за</span>
            <span class="product-card__unit-link active" data-val="1">{$pricePer}</span>
            {foreach $itemUnits as $val}
                <span class="product-card__unit-link" data-val="{$val['id']}">{$val['title']}</span>
            {/foreach}
        </div>

        </div>
        <div class="detail-info-price__price">
            {if $price}
                <div class="product-card__price-outer">
                    <div class="product-card__price-wrap js-product__price-wrap">
                        <span itemprop="price" class="js-product__price" data-default="{$defaultPrice}">{$outputPrice}</span>
                        <meta itemprop="priceCurrency" content="RUB">
                        руб
                    </div>
                    {if $outputOldPrice?}
                        <div class="product-card__old-price">
                            <div class="js-product__old-price-val">
                                <span class="js-product__old-price">
                                {$outputOldPrice} руб
                                </span>
                                
                            </div>
                        </div>
                    {/if}
                   
                </div>
            {/if}
        </div>
    </div>

    <div class="detail-info__wrapper-cart detail-info-cart">

        <div class="product-card__cart-controls">
            <div class="js-product__controls js-product__controls_action_add">
                <div class="custom-counter js-product__custom-counter{$extraClass}">
                    <span href="#" class="custom-counter__btn custom-counter__btn_dir_less">-</span>
                    <input name="count" class="custom-counter__amount" value="1"
                            data-min="{$dataMin}">
                    <span href="#" class="custom-counter__btn custom-counter__btn_dir_more">+</span>
                </div>
                <span class="js-product__btn-in-cart js-product__to-cart">В корзину</span>
            </div>
            <div class="js-product__controls js-product__controls_action_change">
                <div class="custom-counter js-product__custom-counter{$extraClass}">
                    <span href="#" class="custom-counter__btn custom-counter__btn_dir_less">-</span>
                    <input name="count" class="custom-counter__amount" value="{$itemInCart?:0}">
                    <span href="#" class="custom-counter__btn custom-counter__btn_dir_more">+</span>
                </div>
                <a href="/cart/" class="js-product__btn-in-cart"><span class="js-product__btn-in-cart-top-text">В корзине</span>
                    Перейти</a>
            </div>
            <div class="js-product__ms2-elems">
                <form class="js-product__form-add ms2_form" method="post">
                    <input name="options" value="[]">
                    <input name="id" value="{$prodId}">
                    <input name="count" value="1">
                    <input name="ctx" value="{$_modx->resource.context_key}">
                    <button type="submit" name="ms2_action" value="cart/add">Добавить</button>
                </form>
                <form class="js-product__form-change ms2_form" method="post">
                    <input name="key" value="{$productKey}">
                    <input name="count" value="{$itemInCart?:1}">
                    <input name="ctx" value="{$_modx->resource.context_key}">
                    <button type="submit" name="ms2_action" value="cart/change">Изменить кол-во</button>
                </form>
            </div>
        </div>
    </div>

    <div class="detail-info__wrapper-delivery detail-info-delivery">
        <div class="product-card__delivtext">
            {'@FILE snippets/getDeliveryText.php' | snippet : [
                'modifyDate' => 'today'
            ]}
        </div>
    </div>

    <div class="detail-info__wrapper-showroom detail-info-showroom">
        <a data-fancybox="" href="#view-show-room-modal" class="detail-info-showroom__link">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.69222 8.90625L8.57111 3H4L2.09 8.0625C2.03074 8.2425 2.00074 8.43 2 8.625C2 9.867 3.27778 10.875 4.85667 10.875C6.31222 10.875 7.51556 10.0155 7.69222 8.90625ZM12 10.875C13.5778 10.875 14.8567 9.867 14.8567 8.625C14.8559 8.5785 14.8541 8.53313 14.8511 8.48888L14.2856 3H9.71444L9.14778 8.48438L9.14333 8.625C9.14333 9.867 10.4222 10.875 12 10.875ZM17.5556 12.0517V16.5H6.44444V12.0585C5.95778 12.2362 5.42222 12.3375 4.85667 12.3375C4.64 12.3375 4.43 12.3116 4.22222 12.2824V19.425C4.22222 20.2913 4.92111 21 5.77556 21H18.2222C19.0778 21 19.7778 20.2901 19.7778 19.425V12.2835C19.5679 12.3172 19.3558 12.3356 19.1433 12.3386C18.6016 12.337 18.0644 12.24 17.5556 12.0517ZM21.9111 8.0625L19.9989 3H15.4289L16.3067 8.89725C16.4778 10.011 17.6811 10.875 19.1433 10.875C20.7211 10.875 22 9.867 22 8.625C21.9993 8.43 21.9696 8.2425 21.9111 8.0625Z" fill="black"/>
            </svg>
            <span>Посмотреть образец в шоу-руме</span>
        </a>
    </div>

    <div class="product-card__select-color-mobile">
        {include "file:blocks/product/linking/linking-select-other-color-mobile.tpl"}
    </div>

    {* Блок с переключателями (только на мобильных) *}
    <div class="product-card__toggles-mobile">
        {include "file:sections/product/card-content/fasad/blocks/toggles.tpl"}
    </div>

</div>







