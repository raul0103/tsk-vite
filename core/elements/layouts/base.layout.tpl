{'@FILE snippets/redirectToCanonical.php' | snippet}
{'@FILE modules/city-changer/snippets/ajax.php' | snippet}
{'@FILE snippets/ajax.php' | snippet}
{'@FILE snippets/fast-search/MLTSearch.php' | snippet : [
  'tplCategory' => '@FILE sections/fast-search/category-item.tpl',
  'tplProduct' => '@FILE sections/fast-search/product-item.tpl',
  'tplWrapper' => '@FILE sections/fast-search/wrapper.tpl',
  'isInit' => 1
]}
{$_modx->runSnippet('@FILE snippets/pushViewedProduct.php')}
{$_modx->runSnippet('@FILE snippets/weekdaycall/Weekdaycall.php' | snippet)}

{switch $_modx->context.key}
    {* Утеплители *}
    {case 'web'}
        {set $brand = 'Кнауф'}
        {set $footer_nav_ids = '8845,13088,14380,8845,13105,14193,8841'}
    {case 'rockwool'}
        {set $brand = 'Роквул'}
    {case 'tn'}
        {set $brand = 'Технониколь'}
    {case 'penoplex'}
        {set $brand = 'Пеноплэкс'}
        {set $footer_nav_ids = '8817,8818,8803,8819,8820,9052,8811,9054,9048,8813,8814,9125'}
    {case 'isover'}
        {set $brand = 'Изовер'}
    {case 'paroc'}
        {set $brand = 'Парок'}
    {case 'ursa'}
        {set $brand = 'Урса'}
        {set $footer_nav_ids = '12884,12886,14266,12885,8837'}
    {case 'isorok'}
        {set $brand = 'Юматекс'}
    {* Остальное *}
    {case 'krovlya'}
        {set $brand = 'Кровельная компания №1'}
        {set $footer_nav_ids = '16783,16788,22594,15428,22596,22599,26261,26581,81059,18853,15436,56941'}
    {case 'kirpich-m'}
        {set $brand = 'КирпичПро'}
        {set $footer_nav_ids = '37608,37478,64545,37618,68059'}
    {case 'fasady-pro'}
        {set $brand = 'ЛЕССНАБСТРОЙ'}
        {set $footer_nav_ids = '27774,27789,28191,27912,27856,27845,27898,27911'}
    {case 'fasad'}
        {set $brand = 'Мир Фасада'}
        {set $footer_nav_ids = '36783,36784,34819,36793,36807,36806,36804'}
    {case 'armatura-178'}
        {set $brand = 'АрматураПРО'}
        {set $footer_nav_ids = '33057,34523,71768,71769,71766,71772,71774,49018'}
    {case 'asconcrete'}
        {set $brand = 'АсфальтПРО'}
        {set $footer_nav_ids = '48699,48700,48701,48702'}
    {case 'pilomat'}
        {set $brand = 'ЛЕССНАБСТРОЙ'}
        {set $footer_nav_ids = '80986,48826,48823,48827,56923,48828,48824,80318,48825'}
    {case 'plitaosb'}
        {set $brand = 'OSB здесь!'}
        {set $footer_nav_ids = '66818,70019,70259,69966,70257'}
    {case 'pro-fanera'}
        {set $brand = 'Фанера ПРО'}
        {set $footer_nav_ids = '67217,67235,67203,67209,67192,67199'}
    {case 'plity-mdvp'}
        {set $brand = 'Плиты МДВП'}
    {case 'isorok'}
        {set $brand = 'Изорок'}
    {case 'umatex'}
        {set $brand = 'Юматекс'}
    {case 'brikety'}
        {set $brand = 'Брикетс'}
        {* , 'tizol', 'isotecti', 'izomin', 'baswool', 'xotpipe', 'izovol', 'beltep', 'ruspanel' *}
    {case 'tizol'}
        {set $brand = 'Tizol'}
    {case 'isotecti'}
        {set $brand = 'Isotec'}
    {case 'izomin'}
        {set $brand = 'Изомин'}
    {case 'baswool'}
        {set $brand = 'Baswool'}
    {case 'xotpipe'}
        {set $brand = 'Xotpipe'}
    {case 'izovol'}
        {set $brand = 'Izovol'}
    {case 'beltep'}
        {set $brand = 'Beltep'}
    {case 'ruspanel'}
        {set $brand = 'Ruspanel'}
    {case 'gazobeton'}
        {set $footer_nav_ids = '133218,133219,133220,133221,133222,133223,133224,133671,133672,133673,133674,133676'}
{/switch}

{$_modx->setPlaceholder('catalog_id', 'getCatalogId' | snippet : [
    'context' => $_modx->context.key
])}
{* debud mode placeholder for local *}
{$_modx->setPlaceholder('isDev', $_modx->config.debug1)}

{$_modx->setPlaceholder('footer_nav_ids', $footer_nav_ids)}

{$_modx->setPlaceholder('brand', $brand)}

{set $pagination_value = '@FILE snippets/getURI.php' | snippet}

{'!checkHost' | snippet}
{'!checkItems' | snippet}
{'!checkFloatTrouble' | snippet}

{$_modx->setPlaceholder('utm_source', '!utm' | snippet : ['val' => 'source'])}

<!doctype html>
<html lang="ru">
<head>
 {$_modx->getPlaceholder('isDev') == 1 ? '<!-- devmode ON -->' :''} 
    {block 'head'}
        <base href="/">
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        {$_modx->getPlaceholder('localdata').robots}
        <link rel="canonical" href="{$_modx->makeUrl($_modx->resource.id, '', '', 'full')}">

        {* Прелоадер *}
        {if $_modx->resource.context_key in list ['kirpich-m', 'krovlya']}
          <script src="{$_modx->config['template_path']}js/preloader.js"></script>
          <link rel="stylesheet" href="{$_modx->config['template_path']}css/preloader.css">
        {/if}
    {/block}
</head>
<body id="body" class="{if $_modx->resource.template in list [34,35,41,42,43]}article-page {/if} {$site_class} {if $_modx->getPlaceholder('weekdaycall') == '1'} have-weekdaycall{/if}{if $_modx->resource.context_key in list ['kirpich-m', 'krovlya']} have-preloader{/if}" data-ctx="{$_modx->resource.context_key}" data-resource-id="{$_modx->resource.id}">
    {block 'body'}{/block}

    {if $_modx->getPlaceholder('localdata')['subdomain_key'] == 'msk'}
        {set $USER_CITY = 'Москва'}
    {elseif $_modx->getPlaceholder('localdata')['subdomain_key'] == 'krasnodar'}
        {set $USER_CITY = 'Краснодар'}
    {/if}
    <script>
        window.USER_CITY = "{$USER_CITY}"
    </script>

    {block "end-body"}{/block}
    
</body>
</html>
