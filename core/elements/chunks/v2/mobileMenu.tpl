{* Вынес в отдельный чанк, чтобы удобнее было работать *}

<nav class="header__nav">
    <div class="header__nav-contents-wrap">

        {* Первая вкладка (Основная) *}
        <div class="header__nav-content header__nav-content_type_main active" data-key="home"
            id="city-changer__mobile-header-block">

            {* Заголовок *}
            <div class="header__nav-text">
                {if $_modx->context.key == 'onduline1'}
                    Продажа продукции
                {else}
                    Поставка
                {/if}
                {if $_modx->context.key == 'krovlya'}
                кровли
                {elseif $_modx->context.key == 'onduline1'}
                ондулина
                {elseif $_modx->context.key == 'pilomat'}
                пиломатериалов
                {elseif $_modx->context.key == 'kirpich-m'}
                кирпича
                {elseif $_modx->context.key == 'fasady-pro'}
                деревянных фасадов
                {elseif $_modx->context.key == 'fasad'}
                фасадов
                {elseif $_modx->context.key == 'armatura-178'}
                арматуры
                {elseif $_modx->context.key == 'asconcrete'}
                асфальтобетона
                {elseif $_modx->context.key == 'plitaosb'}
                плит ОСБ
                {elseif $_modx->context.key == 'pro-fanera'}
                фанеры
                {elseif $_modx->context.key == 'plity-mdvp'}
                плит МДВП
                {elseif $_modx->context.key == 'policarbonat'}
                поликарбоната
                {elseif $_modx->context.key == 'ugol'}
                угля
                {elseif $_modx->context.key == 'pellety'}
                пеллетов
                {elseif $_modx->context.key == 'drova'}
                дров
                {elseif $_modx->context.key == 'brikety'}
                брикетов
                {else}
                утеплителя {$brand}
                {/if}
                по Санкт-Петербургу и Ленинградской области
            </div>

            {* Кнопка Каталог *}
            <span
                class="header__nav-header header__mobile-menu-link header__mobile-menu-arrow header__mobile-menu-arrow_color_1"
                data-key="catalog">
                <span class="header__nav-header-burger burger">
                    <span class="burger__stick"></span>
                    <span class="burger__stick"></span>
                    <span class="burger__stick"></span>
                </span>
                Каталог
            </span>

            {set $is_article = $_modx->resource.template in list [34,35,41,42,43]}

            {if !$is_article}
            <span class="header__nav-item"><a class="header__nav-link" href="/dostavka-i-oplata/">Доставка и
                    оплата</a></span>
            {/if}

            {set $certs = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'certs']}
            {set $faq = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'faq']}
            {set $akcii = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'akcii']}
            {set $rezka = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'rezka']}
            {set $otzyvy = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'otzyvy']}

            {if $certs && $certs->hidemenu == 0}
            <span class="header__nav-item"><a class="header__nav-link" href="/certs/">Сертификаты</a></span>
            {/if}
            {if $faq && $faq->hidemenu == 0}
            <span class="header__nav-item"><a class="header__nav-link" href="/faq/">Вопросы-ответы</a></span>
            {/if}
            {if $akcii && $akcii->hidemenu == 0 && !$is_article}
            <span class="header__nav-item"><a class="header__nav-link" href="/akcii/">Акции</a></span>
            {/if}
            {if $rezka && $rezka->hidemenu == 0}
            <span class="header__nav-item"><a class="header__nav-link" href="/rezka/">Резка</a></span>
            {/if}
            {if $otzyvy['hidemenu'] == 0 && $otzyvy['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link icon-star" href="/otzyvy/">Отзывы</a></span>
            {/if}
            <span class="header__nav-item"><a class="header__nav-link" href="/contacts/">Контакты</a></span>
        </div>

        {* Вторая вкладка (Каталог) *}
        <div class="header__nav-content" data-key="catalog">
            {* Заголовок *}
            <div class="header__nav-text">Каталог</div>
            {* Кнопка назад *}
            <span class="header__nav-item"><span data-key="home"
                    class="header__nav-link header__mobile-menu-link header__mobile-menu-arrow header__mobile-menu-arrow_color_2 header__mobile-menu-arrow_reverse">Назад</span></span>

            {* Кнопка для перехода в Каталог *}
            <a href="/catalog/" class="header__nav-header">
                Перейти в каталог
            </a>

            {* Кнопки фильтров *}
            {foreach $menu['navigations'] as $navigation}
            <span class="header__nav-item header__mobile-menu-arrow header__mobile-menu-arrow_color_2">
                <span data-val="{$navigation['id']}" data-key="{$navigation['id']}"
                    class="header__mobile-menu-link header__nav-link">{$navigation['title']}</span>
            </span>
            {/foreach}
        </div>

        {* Остальные вкладки (Фильтры) *}
        {foreach $menu['contents'] as $content}
        {* Вкладки *}
        <div class="header__nav-content" data-key="{$content['id']}">
            {* Заголовок *}
            {* <div class="header__nav-text">{$items.title}</div> *}
            {* Кнопка назад *}
            <span class="header__nav-item">
                <span data-key="catalog"
                    class="header__nav-link header__mobile-menu-link header__mobile-menu-arrow header__mobile-menu-arrow_color_2 header__mobile-menu-arrow_reverse">Назад</span>
            </span>

            {* Пункты меню *}
            {foreach $content['items'] as $item}
            <div class="header__nav-items-wrap">
            {if $item['category']}
                <span class="header__nav-item">
                <a data-val="{$item['title']}" class="header__nav-link category-title"
                        href="{$item['category']['uri']}">{$item['category']['title']}</a>
                </span>
            {/if}
                {foreach $item['products'] as $product}
                <span class="header__nav-item"><a data-val="{$product['title']}" class="header__nav-link"
                        href="{$product['uri']}">{$product['title']}</a></span>
                {/foreach}
            </div>
            {/foreach}
        </div>
        {/foreach}

    </div>
    <div class="mobile-menu-touch"></div>
</nav>
