{set $items = '@FILE snippets/v2/assortItems.php' | snippet}
{set $navigations = $items['tab-navigations']}
{set $contents = $items['tab-contents']}

<section class="v2-assort">
    <div class="wrapper">
        <h2 class="title-2">Наш ассортимент</h2>
        <div class="v2-assort__tabs" data-tab-parent>
            <div class="v2-assort__navigations" data-tab-navigations>
                {foreach $navigations as $navigation}
                <div data-tab-id="{$navigation['id']}" class="v2-assort__navigations-item {$navigation['classes']}">
                    <div class="v2-assort__navigations-item-main">
                        <svg class="v2-assort__svg">
                            <use xlink:href="/assets/template/img/svg-sprite.svg#{$navigation['id-svg']}"></use>
                        </svg>
                        {$navigation['title']}
                    </div>
                    <span class="v2-assort__close">&#x2716;</span>
                </div>
                {/foreach}
            </div>
            <div class="v2-assort__contents" data-tab-contents>
                {foreach $contents as $content}
                <div data-tab-id="{$content['id']}" class="v2-assort__content">
                    <h2 class="v2-assort__content-title">{$content['title']}</h2>
                    <div class="v2-assort__content-wrap">
                        {foreach $content['items'] as $item}
                        <a class="v2-assort__content-item {$item['class_names']}" href="{$item['uri']}">
                            <div class="v2-assort__content-item-title">
                                {$item['title']}
                            </div>
                            <div class="v2-assort__content-item-image">
                                <img src="{$item['img']['src']}" style="{$item['img']['style']}">
                            </div>
                        </a>
                        {/foreach}
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</section>