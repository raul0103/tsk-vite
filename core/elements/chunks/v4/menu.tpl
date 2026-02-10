<div class="menu menu-v4">
    <div class="menu__header">
        <a href="/catalog/">Смотреть все товары</a>
    </div>
    <div class="menu__body">
        <div class="menu__body-left menu-catalog">
            {foreach $menu.catalog as $item index=$idx}
            <div class="menu-catalog__item {if $idx == 0}active{/if}" data-catalog-item="{$idx}">
                <img src="{$item.icon}" alt="">
                <span>{$item.name}</span>
            </div>
            {/foreach}
        </div>
        <div class="menu__body-right">
            {foreach $menu.catalog as $item index=$idx}
            <div class="menu-content {if $idx == 0}active{/if}" data-catalog-item="{$idx}">
                {foreach $item.options as $option}
                <div class="menu-content__group menu-group">
                    <div class="menu-group__header">
                        <span>{$option.name}</span>
                    </div>

                    <div class="menu-group__list {$option.class}">
                        {foreach $option.items as $item}
                        <div class="menu-group__item {if $item.name == "Все категории"} menu-group__all-link{/if}">
                            <a href="{$item.url}">{$item.name}{if $item.name == "Все категории"} → {/if}</a>
                        </div>
                        {/foreach}
                    </div>

                </div>
                {/foreach}
            </div>
            {/foreach}
        </div>
    </div>
</div>