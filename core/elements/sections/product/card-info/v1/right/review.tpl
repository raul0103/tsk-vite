<div class="product-card__reviews">
    <div class="product-card__reviews-stars five">
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-star"></use>
        </svg>
    </div>
    {set $countReviews = 11}
    <span class="product-card__reviews-quantity">
        {$countReviews}
        {'@FILE snippets/formOfWord.php' | snippet : [
        'n' => $countReviews,
        'f1' => 'отзыв',
        'f2' => 'отзыва',
        'f5' => 'отзывов'
        ]}
    </span>
</div>