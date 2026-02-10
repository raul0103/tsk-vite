
    {if !empty($value)}
        <div class="listing__products-item-chars-line">
                    <span class="listing__products-item-chars-span">
                        {$name}
                    </span>
            <span class="listing__products-item-chars-val">
                {if is_array($value)}
                    {$value | join : ', ' | truncate:14}
                <div class="listing__products-item-chars-val-info-wrap">
                    <span class="listing__products-item-chars-val-info-btn">
                        <svg class="svg icon-info" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink"
                             version="1.1">
                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-info"></use>
                        </svg>
                    </span>
                    <div class="listing__products-item-chars-val-info">
                      {$value | join : ', '}
                    </div>
                </div>
                    {else}
                    {$value | join : ', '}
                {/if}
            </span>
        </div>
    {/if}
