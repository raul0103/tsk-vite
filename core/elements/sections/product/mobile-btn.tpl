<div class="product-card__mobile-btns">
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
</div>