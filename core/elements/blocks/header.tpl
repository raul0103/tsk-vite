{set $is_article = $_modx->resource.template in list [34,35,41,42,43]}

<div class="header-sticky"></div>
<div class="mobile-sticky-header"></div>
<div class="mobile-header"></div>

{* Эта переменная используется не только тут, но и в chunks/mobileMenu.tpl. Так что повнимательнее, если захочешь
удалить ее *}
{set $menuIsSimple = $_modx->resource.context_key not in list ['krovlya', 'armatura-178', 'plitaosb',
'fasad', 'ugol', 'pilomat', 'gazobeton']}

<header class="header">
    <div class="header__wrapper wrapper">
        {if $_modx->context.key == 'krovlya'}
        <span class="header__burger burger" data-hmm-menu-open>
            <span class="burger__stick"></span>
            <span class="burger__stick"></span>
            <span class="burger__stick"></span>
        </span>
        {else}
        <span class="header__burger burger js-catalog-burder">
            <span class="burger__stick"></span>
            <span class="burger__stick"></span>
            <span class="burger__stick"></span>
        </span>
        {/if}
        <div class="header__line header__line_type_about">
            <div class="header__about">
                <a class="header__about-phone" href="tel:{$_modx->getPlaceholder('localdata').offices.0.phone}">{$_modx->getPlaceholder('localdata').offices.0.phone}</a>

                <div class="header__about-blocks">
                    <div class="header__about-text">
                        {if $_modx->context.key == 'onduline1'}
                            Продажа продукции
                        {elseif $_modx->context.key in list ["sehndvich", "proflist"]}
                            Производство и продажа
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
                        {elseif $_modx->context.key == 'ceresit'}
                            строительных смесей Ceresit
                        {elseif $_modx->context.key == 'gazobeton'}
                            газобетона
                        {elseif $_modx->context.key in list ["proflist"]}
                            профнастила <br>в Санкт-Петербурге и Ленинградской области
                        {elseif $_modx->context.key in list ["sehndvich"]}
                            сэндвич панелей <br>в Санкт-Петербурге и Ленинградской области
                        {else}
                            утеплителя {$brand}
                        {/if}


                        {if $_modx->context.key not in list ["sehndvich", "proflist"]}

                        {if $_modx->context.key in list['rockwool', 'tn']}<br>{/if}
                        по Санкт-Петербургу и Ленинградской области

                        {/if}

                    </div>
                </div>

                {*<a href="#" class="header__about-city">Санкт-Петербург и Ленинградская область</a>*}
            </div>
            {if $_modx->resource.context_key in list ['pro-fanera']}
            <div class="header__yabadge">
                <iframe src="https://yandex.ru/sprav/widget/rating-badge/54568639872?type=rating" width="150" height="50" frameborder="0"></iframe>
            </div>
            {/if}
            <div class="header__contacts">
                {if $.session.city_change == 'msk'}
                    <div class="header__contacts-city">{'address' | option}</div>
                {elseif $.session['+source_utm'] is empty}
                    
                    {*
                    {set $main_adress = $_modx->getPlaceholder('localdata').omny_offices.0.address}
                    {set $data_addr = ''}
                    {set $count = 1}
                    {foreach $_modx->getPlaceholder('localdata').offices as $key => $office}
                        {set $count=$count+1}
                        {if $count < 2 }{set $count=2}{/if}
                        {set $data_addr = $data_addr~' data-address-'~$count~'="'~$office.address~'" '}
                    {/foreach}
                    {foreach $_modx->getPlaceholder('localdata').omny_offices as $key => $office}
                        {if $key>0}
                            {set $count=$count+1}
                            {set $data_addr = $data_addr~' data-address-'~$count~'="'~$office.address~'" '}
                        {/if}
                    {/foreach}
                    
                    {if $_modx->resource.context_key == 'pilomat'}
                        {set $count = $count+1}
                        {set $data_addr = $data_addr~'data-address-'~$count~'="Санкт-Петербург, территория Сергиево, Красная улица, 44Д (пилорама)" '}
                        {set $count = $count+1}
                        {set $data_addr = $data_addr~'data-address-'~$count~'="Парголово, Ленинградская улица, 93В (пилорама)" '}
                        {set $count = $count+1}
                        {set $data_addr = $data_addr~'data-address-'~$count~'="Заневское городское поселение (пилорама)" '}
                    {/if}
                    <div class="header__contacts-city" {$data_addr}> {$main_adress} </div>
                    *}
                    {'!get_address_select' | snippet : ['type' => 'header']}

                    
                    
                {else}
                
                    <div class="header__contacts-city-text">{'address' | option}</div>
                
                {/if}
                <div class="header__contacts-time">Часы работы: ежедневно с 8:00 до 21:00</div>
            </div>
            <div class="header__callback-wrap">

                <a class="header__phone" href="tel:{'!get_virtual_phone' | snippet : ['type'=>'link']}">{'!get_virtual_phone' | snippet : ['type'=>'text']}</a>

                <span data-btn-key="header-link" class="header__callback" data-fancybox="" data-src="#header-callback">
                    <svg class="svg icon-phone" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 17 17" width="17"
                        height="17">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-phone"></use>
                    </svg>
                    Заказать звонок
                </span>
            </div>
        </div>
        <div class="header__line header__line_type_elems">
            <a href="/" class="header__logo-wrap">
                {if $_modx->resource.context_key in list ['plitaosb', 'web', 'rockwool', 'tn', 'paroc', 'penoplex',
                'ursa', 'isover', 'fasady-pro', 'pro-fanera', 'fasad', 'policarbonat', 'isorok', 'drova', 'ugol',
                'umatex', 'brikety', 'pellety']}
                {*
                <picture>
                    <source srcset="/assets/template/img/logos/plitaosb-mobile.png" media="(max-width: 768px)">
                    <img class="header__logo" src="/assets/template/img/logos/plitaosb.png">
                </picture>
                *}
                <img class="header__logo" src="/assets/template/img/logos/{$site_context}.png">
                {else}
                <img class="header__logo" src="/assets/template/img/logos/{$site_context}.svg">
                {/if}
            </a>
            <div class="header__catalog">
                {*Для статей*}
                {if $is_article}
                <a class="header__catalog-btn" href="/catalog/">
                    <span class="header__catalog-text">Каталог</span>
                </a>
                {else}
                <div class="header__catalog-btn">
                    <div class="burger">
                        <span class="burger__stick"></span>
                        <span class="burger__stick"></span>
                        <span class="burger__stick"></span>
                    </div>
                    <span class="header__catalog-text">Каталог</span>
                </div>
                <div class="header__catalog-menu header__catalog-menu_width_full">
                    <div class="header__catalog-menu-inner-wrap">

                        {* Для кирпича и утеплителей используется меню 2й версии *}
                        {if $_modx->resource.context_key in list ['kirpich-m', 'web', 'rockwool','paroc', 'pilomat', 'pro-fanera', 'plitaosb', 'tn', 'ursa', 'penoplex', 'isover', 'isorok', 'umatex','onduline1', 'tizol', 'isotecti', 'izomin', 'baswool', 'xotpipe', 'izovol', 'beltep', 'ruspanel', 'ceresit' ]}
                        {set $menu = '@FILE snippets/v2/createMenu.php' | snippet}
                        <div class="header__catalog-menu-inner" data-menu-tabs>
                            <a href="/catalog/" class="header__catalog-menu-header">Перейти в каталог</a>
                            <div class="v2_header-menu__navigations" data-menu-tabs-navigations>
                                {foreach $menu['navigations'] as $index => $navigation}
                                <a {if $navigation['uri']}href="{$navigation['uri']}"{/if} class="v2_header-menu__navigations-item {$index == 0? 'active' : ''}" data-menu-tabs-id="{$navigation['id']}">
                                    
                                    {if $navigation['id-svg']}
                                    <svg class="v2_header-menu__svg" data-svg="{$navigation['id-svg']}">
                                        <use xlink:href="/assets/template/img/svg-sprite.svg?v={'file_version' | config}#{$navigation['id-svg']}"></use>
                                    </svg>
                                    {/if}
                                    {if $navigation['img']}
                                        <img src="{$navigation['img']}">
                                    {/if}
                                    {$navigation['title']}
                                </a>
                                {/foreach}
                            </div>
                            <div class="v2_header-menu__contents" data-menu-tabs-contents>
                                {foreach $menu['contents'] as $index => $content}
                                <div class="v2_header-menu__contents-wrapper {$index == 0? 'active' : ''}" data-menu-tabs-id="{$content['id']}">
                                    {foreach $content['items'] as $item}
                                    <div class="v2_header-menu__contents-item">
                                        {if $item['category']}
                                        <div class="v2_header-menu__contents-item-category">
                                           <a href="{$item['category']['uri']}">{$item['category']['title']}</a>
                                        </div>
                                        {/if}
                                        {foreach $item['products'] as $product}
                                            <div class="v2_header-menu__contents-product">
                                                <a class="v2_header-menu__contents-link" data-val="{$product['title']}" href="{$product['uri']}">{$product['title']}</a>
                                            </div>
                                        {/foreach}
                                    </div>
                                    {/foreach}
                                </div>
                                {/foreach}
                            </div>
                        </div>
                        {elseif $_modx->resource.context_key in list ['gazobeton']}
                            {set $menu = '@FILE snippets/v3/createMenu.php' | snippet}
                            <div class="h-menu__dropdown">
                                <a class="h-menu__link-to-catalog" href="/catalog/">Перейти в каталог</a>
                                <div class="h-catalog">

                                    <div class="h-catalog__column">
                                        <div class="h-catalog__column-header">{$menu['column1']['title']}</div>
                                        {foreach $menu['values'] as $catId => $catCols}
                                            <a href="{$catCols['column1']['uri']}" class="h-catalog-item h-catalog-item_main{$activeCatId ? '' : ' active'}" data-cat-id="{$catId}">
                                                {if $catCols['column1']['svg'] || $catCols['column1']['img'] || $catCols['column1']['img2']}
                                                    <div class="h-catalog-item__preview {if $_modx->resource.context_key in ['web']}h-catalog-item__preview-wide{/if}">
                                                        {if $catCols['column1']['img'] is not empty}
                                                            {if $catCols['column1']['img2'] is not empty}
                                                                <img class="h-catalog-item__image _norm" src="{$catCols['column1']['img']}">
                                                                <img class="h-catalog-item__image _hov" src="{$catCols['column1']['img2']}">
                                                            {else}
                                                                <img class="h-catalog-item__image" src="{$catCols['column1']['img']}">
                                                            {/if}
                                                        {elseif $catCols['column1']['svg'] is not empty}
                                                            <svg class="h-subinfo__svg" aria-hidden="true">
                                                                <use xlink:href="assets/template/pictures/icons.svg?v=22#{$catCols['column1']['svg']}"></use>
                                                            </svg>
                                                        {/if}
                                                    </div>
                                                {/if}
                                                <span class="h-catalog-item__name h-catalog-item__name_bold{if $catCols['column1']['label']} h-catalog-item__name_with_label{/if}">{$catCols['column1']['name']}</span>
                                            </a>
                                            {if $activeCatId is empty}
                                                {set $activeCatId = $catId}
                                            {/if}
                                        {/foreach}
                                    </div>

                                    {foreach $menu as $colKey => $colValues}
                                        {if $colKey in list ['values', 'column1']}
                                            {continue}
                                        {/if}

                                        <div class="h-catalog__column">
                                            <div class="h-catalog__column-header" data-{$colKey}-title="{$colValues['title']}">{$colValues['title']}</div>
                                            {foreach $menu['values'] as $catId => $catCols}
                                                {if $colValues['type'] == 'composite'}
                                                    <div class="h-catalog__parts-wrap">
                                                        {foreach $catCols[$colKey] as $parts}
                                                            <div class="h-catalog__part">
                                                                {foreach $parts as $val}
                                                                    <div class="h-catalog-item h-catalog-item_dependent{$activeCatId == $catId ? ' active' : ''}" data-cat-id="{$catId}">
                                                                        <a href="{$val['uri']}" class="h-catalog-item__name">{$val['name']}</a>
                                                                    </div>
                                                                {/foreach}
                                                            </div>
                                                        {/foreach}
                                                    </div>
                                                {else}
                                                    {foreach $catCols[$colKey] as $val}
                                                        <div class="h-catalog-item h-catalog-item_dependent{$activeCatId == $catId ? ' active' : ''}" data-cat-id="{$catId}">
                                                            <a href="{$val['uri']}" class="h-catalog-item__name">{$val['name']}</a>
                                                        </div>
                                                    {/foreach}
                                                {/if}
                                            {/foreach}
                                        </div>
                                    {/foreach}

                                </div>
                            </div>
                            {elseif $_modx->context.key in list ["proflist", "sehndvich"]}
                        <div class="header__catalog-menu-inner header__catalog-menu-inner--v4">
                                {'@FILE snippets/v4/createMenu.php' | snippet}
                        </div>
                        {else}
                        {set $menu = '@FILE snippets/v1/createMenu.php' | snippet}
                        {if $_modx->resource.context_key in list ['krovlya', "fasad"]}
                        <div class="header__catalog-menu-inner menu_new_v2">
                            {'@FILE snippets/assortItemsMenu.php' | snippet}
                        </div>
                        {else}
                        <div class="header__catalog-menu-inner">
                            <a href="/catalog/" class="header__catalog-menu-header">Перейти в каталог</a>

                            {if $menuIsSimple}
                            {foreach $menu as $key => $menuTypes}
                            <div class="header__catalog-menu-type" xxx="{$key}">
                                <p class="header__column-header">{$key}</p>
                                <div class="header__columns-wrap">
                                    {foreach $menuTypes as $items}
                                    <div class="header__column">
                                        <div class="header__column-items-wrap">
                                            {foreach $items as $item}
                                            <a class="header__menu-item" data-val="{$item.name}" href="{$item.uri}">
                                                {$item.name}
                                            </a>
                                            {/foreach}
                                        </div>
                                    </div>
                                    {/foreach}
                                </div>
                                {if $_modx->resource.context_key == 'knauf'}
                                    {if $key == 'Теплоизоляция'}
                                        <p class="header__column-header">Гипсокартон</p>
                                        <div class="header__columns-wrap">
                                            <div class="header__column">
                                                <div class="header__column-items-wrap">
                                                    <a class="header__menu-item" data-val="Гипсокартон Knauf" href="https://minvata-78.ru/gipsokarton/">
                                                        Гипсокартон Knauf
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}

                                    {if $key == 'Применение'}
                                        <p class="header__column-header">
                                            <a class="header__column-header" href="/suxie-smesi-knauf/">Сухие смеси Knauf</a>
                                        </p>
                                        <div class="header__columns-wrap">
                                            <div class="header__column">
                                                <div class="header__column-items-wrap">
                                                    <a class="header__menu-item" data-val="Гипсокартон Knauf" href="/shtukaturka/">
                                                        Штукатурка
                                                    </a>
                                                    <a class="header__menu-item" data-val="Гипсокартон Knauf" href="/gruntovka/">
                                                        Грунтовка
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    {/if}
                                {/if}
                            </div>
                            {/foreach}
                            {else}
                            {foreach $menu as $column}
                            <div class="header__catalog-menu-type">
                                {foreach $column as $items}
                                <div
                                    class="header__column{$items.children | count == 0 ? ' header__column_without-children' : ''}">
                                    <p class="header__column-header">
                                        {if $items.uri ?}
                                        <a class="header__column-header-link" data-val="{$items.name}"
                                            href="{$items.uri}">{$items.name}</a>
                                        {else}
                                        <span>{$items.name}</span>
                                        {/if}
                                    </p>

                                    <div class="header__columns-wrap">
                                        <div class="header__column-items-wrap">
                                            {foreach $items.children as $item}
                                            <a class="header__menu-item" data-val="{$item.name}" href="{$item.uri}">
                                                {$item.name}
                                            </a>
                                            {/foreach}
                                        </div>
                                    </div>
                                </div>
                                {/foreach}
                            </div>
                            {/foreach}
                            {/if}
                        </div>
                        {/if}
                        {/if}

                    </div>
                </div>
                {/if}
            </div>

            <form action="/search/" class="header__search-wrap" fast-search-form="desktop">
                <input class="header__search" placeholder="Поиск по сайту" name="query" fast-search-input="desktop">
                <button type="submit" class="header__search-btn"></button>
            </form>

            {if !$is_article}
            <div class="header__btns-wrap">

                {if $_modx->context.key == 'krovlya'}
                    <a class="header__cat" data-hmm-menu-open data-hmm-menu-open-tab="Каталог">
                {elseif $_modx->context.key == "plitaosb"}
                    <a class="header__cat js-catalog-burder">
                {else}
                    <a class="header__cat" href="/catalog/">
                {/if}
                    <span class="header__cat-icon">
                        <span class="header__cat-icon-stick"></span>
                        <span class="header__cat-icon-stick"></span>
                        <span class="header__cat-icon-stick"></span>
                    </span>
                    <span class="header__cat-text">Каталог</span>
                </a>

                <a class="header__favorites" href="/favorites/">
                    <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
                    </svg>
                    <span class="header__fav-value">{$_modx->getPlaceholder('checkItems')['fav'] | length}</span>
                    <span class="header__favorites-text">Избранное</span>
                </a>
                <a class="header__comparison" href="/comparison/">
                    <svg class="svg icon-compare" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"></use>
                    </svg>
                    <span class="header__comp-value">{$_modx->getPlaceholder('checkItems')['comp'] | length}</span>
                    <span class="header__comparison-text">Сравнение</span>
                </a>

                {'!msMiniCartCustom' | snippet : ['tpl' => '@FILE: chunks/msMiniCart.tpl']}
            </div>
            {else}
            <div class="header__btns-wrap">
                <a class="header__favorites" href="/article-favorites/">
                    <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"></use>
                    </svg>
                    <span class="header__fav-value" data-article-favorite-count>0</span>
                    <span class="header__favorites-text">Избранное</span>
                </a>
            </div>
            {/if}
        </div>

        <div class="header__nav-list">
            {set $is_article = $_modx->resource.template in list [34,35,41,42,43]}

            {set $advatages_onduline = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'preimushhestva']}
            {set $about = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'o-kompanii']}
            {set $garantii = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'garantii']}
            {set $certs = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'certs']}
            {set $faq = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'faq']}
            {set $akcii = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'akcii']}
            {set $rezka = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'rezka']}
            {set $otzyvy = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'otzyvy']}
            {set $raspil = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'raspil']}
            {set $primenenie = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'primenenie']}

            {if $advatages_onduline['hidemenu'] == 0 && $advatages_onduline['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/preimushhestva/">Преимущества</a></span>
            {/if}

            {if $about['hidemenu'] == 0 && $about['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/o-kompanii/">О компании</a></span>
            {/if}

            {if !$is_article}
            <span class="header__nav-item"><a class="header__nav-link" href="/dostavka-i-oplata/">Доставка и оплата</a></span>
            {/if}

            {if $_modx->resource.context_key in list ['pilomat', 'fasady-pro']}
            <span class="header__nav-item"><a class="header__nav-link" href="/pokraska/">Покраска</a></span>
            {/if}

            {if $_modx->resource.context_key == 'krovlya'}
            {set $calcservices = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' =>
            'calculation-services']}


            {if $calcservices['hidemenu'] == 0 && $calcservices['published'] == 1 && !$is_article}
            <span class="header__nav-item">
                {if $_modx->resource.context_key in list['krovlya']}
                    <a class="header__nav-link nav-link" href="/calculation-services/">Сервисы расчета</a>
                        <div class="nav-link__items">
                        [[pdoMenu?
                          &parents=`0`
                          &level=`2`
                          &resources=`102635,102634,102632,102633,102631,93173,93174,102634,93175`
                          &tplOuter=`@INLINE [[+wrapper]]`
                          &tplInner=`@INLINE [[+wrapper]]`
                          &tpl=`@INLINE <div [[+classes]]><a href="[[+link]]" [[+attributes]]>[[+menutitle]]</a></div>`
                        ]]
                        </div>
                    {else}
                      <a class="header__nav-link nav-link" href="/calculation-services/">Сервисы расчета</a>
                {/if}

            </span>
            {/if}
            {/if}


            {if $_modx->resource.context_key in list ['kirpich-m', 'krovlya', 'fasady-pro', 'fasad']}
            {set $showroom = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'show-room']}

            {if $showroom['hidemenu'] == 0 && $showroom['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/show-room/">Шоурум</a></span>
            {/if}
            {/if}

            {if $certs['hidemenu'] == 0 && $certs['published'] == 1}
                {if $_modx->resource.context_key in list['krovlya']}
                    <span class="header__nav-item"><a href="/dokumentyi/" class="header__nav-link nav-link">Документы</a>
                        <div class="nav-link__items">
                            <div><a href="/certs/">Сертификаты</a></div>
                             <div><a href="/dokumentyi/instrukczii/">Инструкции</a></div>
                            <div><a href="/dokumentyi/chertezhi/">Чертежи</a></div>
                        </div>
                    </span>
                    {else}
                    <span class="header__nav-item"><a class="header__nav-link" href="/certs/">Сертификаты</a></span>
                {/if}

            </span>
            {/if}
            {if $faq['hidemenu'] == 0 && $faq['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/faq/">Вопросы-ответы</a></span>
            {/if}
            {* if $garantii['hidemenu'] == 0 && $garantii['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/garantii/">Гарантии</a></span>
            {/if *}
            {if $_modx->context.key == 'policarbonat'}
            <span class="header__nav-item"><a class="header__nav-link" href="/pkt-calc/">Калькулятор</a></span>
            {/if}
            {if $akcii['hidemenu'] == 0 && $akcii['published'] == 1 && !$is_article}
            <span class="header__nav-item"><a class="header__nav-link" href="/akcii/">Акции</a></span>
            {/if}
            {if $rezka['hidemenu'] == 0 && $rezka['published'] == 1}
                <span class="header__nav-item"><a class="header__nav-link" href="/lazernaya-rezka/">Лазерная резка</a></span>
                <span class="header__nav-item"><a class="header__nav-link" href="/rezka/">Распил</a></span>
                <span class="header__nav-item"><a class="header__nav-link" href="/frezernaya-rezka/">Фрезеровка</a></span>
            {/if}
            {if $otzyvy['hidemenu'] == 0 && $otzyvy['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link icon-star" href="/otzyvy/">Отзывы</a></span>
            {/if}

            {if $_modx->context.key not in list ['fasad']}
                {* если есть склады, показываем *}
                {set $warehousesCategoryId = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'skladyi']}
            
                {if $warehousesCategoryId && $_modx->getPlaceholder('localdata').main_contacts.email_prefix != "krasnodar"}

                {if $_modx->resource.context_key in list['plitaosb']}                  
                    <span class="header__nav-item">
                        <a class="header__nav-link nav-link">Склады</a>
                        <div class="nav-link__items">
                            {'!pdoMenu' | snippet : [
                                'parents' => $warehousesCategoryId,
                                'level' => 2,
                                'where' => '{"id:IN":[132690,132688,132686,132698,132687]}',
                                'tplOuter' => '@INLINE {$wrapper}',
                                'tplInner' => '@INLINE {$wrapper}',
                                'tpl' => '@INLINE <div {$classes}><a href="{$link}" {$attributes}>{$menutitle}</a></div>'
                            ]}
                        </div>
                    </span>
            
                {else}
                    <span class="header__nav-item">
                        <a class="header__nav-link nav-link">Склады</a>
                        <div class="nav-link__items">
                            {'!pdoMenu' | snippet : [
                                'parents' => $warehousesCategoryId,
                                'level' => 2,
                                'tplOuter' => '@INLINE {$wrapper}',
                                'tplInner' => '@INLINE {$wrapper}',
                                'tpl' => '@INLINE <div {$classes}><a href="{$link}" {$attributes}>{$menutitle}</a></div>'
                            ]}
                        </div>
                    </span>
                {/if}
            
            {/if}
                {*  *}
            {/if}

            <span class="header__nav-item"><a class="header__nav-link" href="/contacts/">Контакты</a></span>

            {if $raspil['hidemenu'] == 0 && $raspil['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/raspil/">Распил</a></span>
            {/if}

            {if $primenenie['hidemenu'] == 0 && $primenenie['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/primenenie/">Применение</a></span>
            {/if}

            <a class="header__email" href="mailto:{'!get_virtual_email' | snippet}">
                {'!get_virtual_email' | snippet}
            </a>
        </div>

        {* Для кирпича используется меню 2й версии *}
        {if $_modx->resource.context_key in list ['kirpich-m', 'pilomat', 'rockwool', 'paroc', 'pro-fanera', 'plitaosb', 'tn', 'ursa', 'penoplex', 'isover', 'web', 'isorok', 'umatex', 'tizol', 'isotecti', 'izomin', 'baswool', 'xotpipe', 'izovol', 'beltep', 'ruspanel', 'onduline1' ]}
            {insert 'file:chunks/v2/mobileMenu.tpl'}
        {else}
            {if $_modx->context.key == 'krovlya'}
                {'@FILE modules/header-menu-mobile/snippets/index.php' | snippet}
            {else}
                {insert 'file:chunks/v1/mobileMenu.tpl'}
            {/if}
        {/if}
    </div>
</header>
