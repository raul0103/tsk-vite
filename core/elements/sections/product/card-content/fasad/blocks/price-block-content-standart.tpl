
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

    <div class="detail-info__wrapper-callback detail-info-callback">
        <div class="product-card__callback-button">
            <button data-fancybox="" href="#callback" class="product-card__buy white-btn">ПОЛУЧИТЬ РАСЧЁТ ФАСАДОВ БЕСПЛАТНО</button>
        </div>
    </div>

    <div class="detail-info__wrapper-delivery detail-info-delivery">
        <div class="product-card__delivtext">
            {'@FILE snippets/getDeliveryText.php' | snippet : [
                'modifyDate' => 'today'
            ]}
        </div>
    </div>

    <div class="detail-info__wrapper-showroom detail-info-show-room">
        <div class="detail-info-show-room__item">
            <a data-fancybox="" href="#view-show-room-modal" title="Запишитесь на посещение нашего шоурума и мы заранее подготовим для вас необходимые образцы"><span><span>Посмотреть образец</span> <br><span class="bold">в шоу-руме</span></span> </a>
        </div>
        <div class="detail-info-show-room__item">
            <a data-fancybox="" href="#callback"  title="Мы предоставляем услугу бесплатного замера и расчета для наших покупателей!">Бесплатный замер</a>
        </div>
        <div class="product-card__select-color-mobile">
            {include "file:blocks/product/linking/linking-select-other-color-mobile.tpl"}
        </div>
    </div>

</div>







