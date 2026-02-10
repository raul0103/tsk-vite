<div class="product-card__specs-list">

    {* Установка дополнительных опций. Они берутся из основных и выводятся в самом начале - все вместе *}
    {set $extraOptions = []}
    {* Дополнительные опции для поликарбоната *}
    {if $_modx->resource.context_key == 'policarbonat'}
        {foreach ["razmer-mm", "item_length", "item_width", "item_thickness"] as $key}
            {set $extraOptions.$key = $options.$key}
            {unset $options.$key}
        {/foreach}
    {elseif $_modx->resource.parent in list [16788,11760,12069,12070,12071,12073,12074,16789,37621,44676,44677,44678,44679,44680,44681,76923]}
        {foreach ["item_thickness","proizvoditel","pokrytie","cvet","collection","vid-poverhnosti"] as $key}
            {set $extraOptions.$key = $options.$key}
            {unset $options.$key}
        {/foreach}
    {/if}

    {* Вывод опций *}
    {foreach [$extraOptions, $options] as $opts}
        {foreach $opts as $option}
            {* Иногда в базу попадают пустые опции (возможно, при импорте в значении пробельный символ). По-хорошему, их надо удалять из базы. Но дополнительная защита от них в коде не помешает. Также в коде выше могут быть добавлены пустые опции на policarbonat *}
            {if ($option.value is empty) || ($option.value == ' ') || ($option.caption is empty) || ($option.value == '')}

            {else}    
                {if ($option.key == 'razmer-mm') && ($_modx->resource.context_key == 'pro-fanera') && ($_modx->resource.template == 21)}
                    {set $option.caption = 'Формат'}
                {/if}

                <div class="product-card__specs-list-item" data-opt-key="{$option.key}">
                    <div class="product-card__specs-list-item-name">{$option.caption}:</div>
                    <div class="product-card__specs-list-item-value">
                        {if $_modx->resource.context_key == "krovlya"}

                            {$_modx->runSnippet("@FILE snippets/optionLink.php", [
                                "key" => $option.key,
                                "value" => $option.value
                            ])}

                        {else}
                            {if $option.value is array}
                                {$option.value | join : ', '}
                            {else}
                                {$option.value}
                            {/if}
                        {/if}
                    </div>
                </div>
            {/if}

            
        {/foreach}
    {/foreach}

    {* Страна - свойство Minishop2 *}
    {if $_modx->resource.made_in?}
        <div class="product-card__specs-list-item">
            <div class="product-card__specs-list-item-name">Страна:</div>
            <div class="product-card__specs-list-item-value">
                {$_modx->resource.made_in}
            </div>
        </div>
    {/if}

    {* Производитель - свойство Minishop2 *}
    {if $_modx->getPlaceholder('vendor.name')?}
        <div class="product-card__specs-list-item">
            <div class="product-card__specs-list-item-name">Производитель:</div>
            <div class="product-card__specs-list-item-value">
                {$_modx->getPlaceholder('vendor.name')}
            </div>
        </div>
    {/if}

</div>
