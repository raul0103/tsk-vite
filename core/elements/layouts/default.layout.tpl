{extends "file:layouts/base.layout.tpl"}
{block 'head'}

    {set $virtual_seo_yandexID = "!virtual_seo_yandexID" | snippet}
    {parent}
    {block 'title'}
        {include "file:elements/meta-title.tpl"}
    {/block}
    {block 'description'}
        {include "file:elements/meta-description.tpl"}
    {/block}

    {include "file:vite/production/css.tpl"}

    {if $_modx->context.key == 'web'}
        {set $site_context = 'knauf'}
    {else}
        {set $site_context = $_modx->context.key}
    {/if}
    {set $site_class = $site_context}

    {if $_modx->context.key == 'krovlya'}
        {set $site_class = 'rockwool krovlya'}
    {elseif $_modx->context.key == 'onduline1'}
        {set $site_class = 'rockwool krovlya onduline1'}
    {elseif $_modx->context.key == 'pilomat'}
        {set $site_class = 'knauf pilomat'}
    {elseif $_modx->context.key == 'kirpich-m'}
        {set $site_class = 'rockwool kirpich-m'}
    {elseif $_modx->context.key == 'fasady-pro'}
        {set $site_class = 'fasady-pro'}
    {elseif $_modx->context.key == 'fasad'}
        {set $site_class = 'fasad'}
    {elseif $_modx->resource.context_key == 'armatura-178'}
        {set $site_class = 'rockwool armatura-178'}
    {elseif $_modx->resource.context_key == 'asconcrete'}
        {set $site_class = 'rockwool asconcrete'}
    {elseif $_modx->resource.context_key == 'plitaosb'}
        {set $site_class = 'rockwool plitaosb'}
    {elseif $_modx->resource.context_key == 'pro-fanera'}
        {set $site_class = 'knauf pro-fanera'}
    {elseif $_modx->resource.context_key == 'plity-mdvp'}
        {set $site_class = 'fasady-pro plity-mdvp'}
    {elseif $_modx->resource.context_key == 'isorok'}
        {set $site_class = 'rockwool isorok'}
    {elseif $_modx->resource.context_key == 'ugol'}
        {set $site_class = 'fasady-pro ugol'}
    {elseif $_modx->resource.context_key == 'pellety'}
        {set $site_class = 'fasady-pro pellety'}
    {elseif $_modx->resource.context_key == 'drova'}
        {set $site_class = 'fasady-pro drova'}
    {elseif $_modx->resource.context_key == 'brikety'}
        {set $site_class = 'fasady-pro brikety'}
    {elseif $_modx->resource.context_key == 'umatex'}
        {set $site_class = 'knauf umatex'}
    {/if}

    {* >>> favicon *}
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/template/img/favicons/{$site_context}/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/template/img/favicons/{$site_context}/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/template/img/favicons/{$site_context}/favicon-16x16.png">
    <link rel="manifest" href="/assets/template/img/favicons/{$site_context}/site.webmanifest">
    <link rel="mask-icon" href="/assets/template/img/favicons/{$site_context}/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">
    <link rel="icon" href="/assets/template/img/favicons/{$site_context}/favicon.ico" type="image/x-icon">
    {* <<< favicon *}

    {* >>> Open Graph и Twitter Card  *}
    {set $micro_img = 'assets/template/img/logos/' ~ $site_context ~ '.svg'}
    {if $site_context == 'onduline1'}
        {set $micro_title = 'Продажа продукции '}
    {else}
        {set $micro_title = 'Поставка '}
    {/if}

    {if $site_context == 'krovlya'}
        {set $micro_title = $micro_title ~ 'кровли'}
    {elseif $site_context == 'onduline1'}
        {set $micro_title = $micro_title ~ 'ондулина'}
    {elseif $site_context == 'kirpich-m'}
        {set $micro_title = $micro_title ~ 'кирпича'}
    {elseif $site_context == 'fasady-pro'}
        {set $micro_title = $micro_title ~ 'деревянных фасадов'}
    {elseif $site_context == 'fasad'}
        {set $micro_title = $micro_title ~ 'фасадов'}
    {elseif $site_context == 'armatura-178'}
        {set $micro_title = $micro_title ~ 'арматуры'}
    {elseif $site_context == 'asconcrete'}
        {set $micro_title = $micro_title ~ 'асфальтобетона'}
    {elseif $site_context == 'plitaosb'}
        {set $micro_title = $micro_title ~ 'плит ОСБ'}
    {elseif $site_context == 'pro-fanera'}
        {set $micro_title = $micro_title ~ 'фанеры'}
    {elseif $site_context == 'plity-mdvp'}
        {set $micro_title = $micro_title ~ 'плит МДВП'}
    {elseif $site_context == 'policarbonat'}
        {set $micro_title = $micro_title ~ 'поликарбоната'}
    {elseif $_modx->context.key == 'ugol'}
        {set $micro_title = $micro_title ~ 'угля'}
    {elseif $_modx->context.key == 'pellety'}
        {set $micro_title = $micro_title ~ 'пеллетов'}
    {elseif $_modx->context.key == 'drova'}
        {set $micro_title = $micro_title ~ 'дров'}
    {elseif $_modx->context.key == 'brikety'}
        {set $micro_title = $micro_title ~ 'брикетов'}
    {else}
        {set $micro_title = $micro_title ~ 'утеплителя ' ~ $brand}
    {/if}

    {if $site_context !== 'onduline1'}
        {set $micro_title = $micro_title ~ ' по Санкт-Петербургу и Ленинградской области от официального дилера'}
    {else}
        {set $micro_title = $micro_title ~ ' по Санкт-Петербургу и Ленинградской области'}
    {/if}
    <meta property="og:locale" content="ru_RU" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{$_modx->resource.longtitle}" />
    <meta property="og:description" content="{$_modx->resource.description}" />
    <meta property="og:url" content="{$_modx->makeUrl($_modx->resource.id, '', '', 'full')}" />
    <meta property="og:image" content="{'site_url' | option}{$micro_img}" />
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:description" content="{$_modx->resource.description}" />
    <meta name="twitter:title" content="{$micro_title}" />
    <meta name="twitter:image" content="{'site_url' | option}{$micro_img}" />
    {* <<< Open Graph и Twitter Card  *}

    {if $_modx->getPlaceholder('checkHost') == 'prod'}
        {if $_modx->resource.context_key == 'rockwool'}
          <script type="text/javascript">!function() { var t=document.createElement("script");t.type="text/javascript",t.async=!0,t.src='https://vk.com/js/api/openapi.js?169',t.onload=function() { VK.Retargeting.Init("VK-RTRG-1600323-9yJ6a"),VK.Retargeting.Hit() } ,document.head.appendChild(t) } ();</script><noscript><img src="https://vk.com/rtrg?p=VK-RTRG-1600323-9yJ6a" style="position:fixed; left:-999px;" alt=""/></noscript>
        {/if}
        {if $_modx->resource.context_key not in list ['rasprodazha']}
        <script src="//code.jivo.ru/widget/9J1gSPDmWh" async></script>
        {/if}
        <script>
            // Перменные метрик
            {"!virtual_seo" | snippet}
        </script>

        {if $_modx->context.key !== 'fasad'}
            {include "file:chunks/metrika/yandex.tpl"}
        {/if}

        {* Данный код нужен, чтобы загрузку скриптов не ждал preloader
        <noscript><div><img src="https://mc.yandex.ru/watch/{$virtual_seo_yandexID}" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
        <script>
            (function () {
                var parent = document.getElementsByTagName("script")[0].parentNode;

                // ym
                script = document.createElement("script");
                script.setAttribute('ym_id', {$virtual_seo_yandexID});
                script.src = "/assets/template/js/ext-yandex-metrika.js";
                parent.appendChild(script);
            })();
        </script>
        *}
    {/if}

    {block 'schema'}{/block}
{/block}

{block 'body'}
    {if $_modx->context.key == 'fasad'}
        {include "file:chunks/metrika/yandex.tpl"}
    {/if}

    {if $_modx->resource.context_key in list ['kirpich-m', 'krovlya']}
        <div id="preloader">
          <div id="preloader-status">&nbsp;</div>
        </div>
    {/if}

    {block "header-mobile"}
    {/block}

    <div class="wrap">
        {block "header"}
            {if $_modx->context.key in list ['rasprodazha']}
                {include "file:blocks/header-rasprodazha.tpl"}
            {else}
                {include "file:blocks/header.tpl"}
            {/if}
        {/block}
        <div class="current-page">
            {block "page"}{/block}
        </div>
        {block "footer"}
            {include "file:blocks/footer.tpl"}
        {/block}
    </div>
    {block "modals"}
        {include 'file:elements/modals/callback/wrapper.tpl'}
    {/block}
{/block}
{block "end-body"}
    <div class="scroll-top">
        <img src="{$_modx->config['template_path']}img/scroll-top.png">
    </div>
    {if $_modx->context.key not in list ['rasprodazha']}
        {if '@FILE modules/mltreviews/snippets/reviewAmount.php' | snippet > 0}
            {*insert 'file:modules/reviews-popup/reviews-popup.tpl'*} {* Сокрытие всплывашки, чтобы потом вернуть *}
        {/if}
    {/if}  
    {if $_modx->getPlaceholder('localdata').fortwheel }
        {if $_modx->resource.template in list [34,35,41,42,43]}
            <script>window.SHOW_FORTWHEEL = false</script>
        {else}
            <script>window.SHOW_FORTWHEEL = true</script>
        {/if}
    {else}
        <script>window.SHOW_FORTWHEEL = false</script>
    {/if}
    <script src="{$_modx->config['template_path']}js/jquery-3.7.1.min.js"></script>

    {if 'APP_ENV' | config === 'development'}
        {include "file:vite/development/js.tpl"}
    {else}
        {include "file:vite/production/js.tpl"}
    {/if}

    {if $_modx->context.key in list ['rasprodazha']}
    <script defer src="{$_modx->config['template_path']}js/createPdf.js?v={'file_version' | config}"></script>
    {/if}

    <script data-map-id="districts_map" data-src="https://api-maps.yandex.ru/2.1/?apikey=99aa267b-edef-422a-b3d8-12bfaa6253a1&lang=ru_RU&coordorder=latlong&onload=initDistrictsMap" type="text/javascript" async defer></script>

<!--
Источник: [^s^]
БД, сек: [^qt^];
БД запросов: [^q^];
PHP, сек: - [^p^];
Всего времени: [^t^];
Память: [^m^];
-->

{/block}
