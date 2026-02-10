{set $is_article = $_modx->resource.template in list [34,35,41,42,43]}

<div class="header-sticky"></div>
<div class="mobile-sticky-header"></div>
<div class="mobile-header"></div>

{* Эта переменная используется не только тут, но и в chunks/mobileMenu.tpl. Так что повнимательнее, если захочешь
удалить ее *}
{set $menuIsSimple = true}

<header class="header">
    <div class="header__wrapper wrapper">

        <span class="header__burger burger js-catalog-burder">
            <span class="burger__stick"></span>
            <span class="burger__stick"></span>
            <span class="burger__stick"></span>
        </span>

        <div class="header__line header__line_type_about">
            <div class="header__about">
                <a class="header__about-phone" href="tel:{$_modx->getPlaceholder('localdata').offices.0.phone}">{$_modx->getPlaceholder('localdata').offices.0.phone}</a>

                <div class="header__about-blocks">
                    <div class="header__about-text">
                    Товары для строительства по скидке
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
                
                    <div class="header__contacts-city">{'address' | option}</div>
               
                <div class="header__contacts-time">Часы работы: ежедневно с 8:00 до 21:00</div>
            </div>
            {* <div class="header__callback-wrap">

                <a class="header__phone" href="tel:{'!get_virtual_phone' | snippet : ['type'=>'link']}">{'!get_virtual_phone' | snippet : ['type'=>'text']}</a>

                <span data-btn-key="header-link" class="header__callback" data-fancybox="" data-src="#header-callback">
                    <svg class="svg icon-phone" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 17 17" width="17"
                        height="17">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-phone"></use>
                    </svg>
                    Заказать звонок
                </span>
            </div> *}
        </div>
        <div class="header__line header__line_type_elems">
            <a href="/" class="header__logo-wrap">
                {if $_modx->resource.context_key in list ['plitaosb', 'web', 'rockwool', 'tn', 'paroc', 'penoplex',
                'ursa', 'isover', 'fasady-pro', 'pro-fanera', 'fasad', 'policarbonat', 'isorok', 'drova', 'ugol',
                'umatex', 'brikety', 'pellety','onduline1']}
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

                        {set $menu = '@FILE snippets/v2/createMenu-rasprodazha.php' | snippet}

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

                {'!msMiniCartCustom' | snippet : ['tpl' => '@FILE: chunks/msMiniCart-rasprodazha.tpl']}
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

            {set $about = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'o-kompanii']}
            {set $faq = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'faq']}
            {set $otzyvy = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'otzyvy']}

            {if $about['hidemenu'] == 0 && $about['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/o-kompanii/">О компании</a></span>
            {/if}

            {* {if !$is_article}
            <span class="header__nav-item"><a class="header__nav-link" href="/dostavka-i-oplata/">Доставка и оплата</a></span>
            {/if} *}

            {if $faq['hidemenu'] == 0 && $faq['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link" href="/faq/">Вопросы-ответы</a></span>
            {/if}
          
            {if $otzyvy['hidemenu'] == 0 && $otzyvy['published'] == 1}
            <span class="header__nav-item"><a class="header__nav-link icon-star" href="/otzyvy/">Отзывы</a></span>
            {/if}
            

            {* <a class="header__email" href="mailto:{'!get_virtual_email' | snippet}">
                {'!get_virtual_email' | snippet}
            </a> *}
        </div>


        {include 'file:chunks/v2/mobileMenu-rasprodazha.tpl'}

    </div>
</header>
