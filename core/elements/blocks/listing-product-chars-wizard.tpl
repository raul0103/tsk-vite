{* Вынес в отдельный чанк, чтобы удобнее было работать, т.к. тут много кода *}

<div class="listing__products-item-chars-wrap">
    <span class="listing__products-item-chars-btn">
        <svg class="svg icon-info" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
             version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-info"></use>
        </svg>
        {if $_modx->context.key in list ['krovlya', 'plitaosb']}
            Характеристики
        {else}
            Показать информацию
        {/if}
    </span>
    <div class="listing__products-item-chars">
    {$output}
    </div>
</div>
