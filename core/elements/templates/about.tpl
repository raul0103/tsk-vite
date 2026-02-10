{extends "file:layouts/default.layout.tpl"}

{block 'title'}
    {include "file:elements/product/meta-title.tpl"}
{/block}
{block 'description'}
    {include "file:elements/product/meta-description.tpl"}
{/block}

{block "page"}
    {set $content = ''}
    {if $_modx->resource.content | length > 0}
        {set $content = '<article class="sect-inner__content content-block">'~$_modx->resource.content~'</article>'}
    {/if}
    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>
    {if $_modx->resource.context_key in list ['rockwool', 'tn', 'penoplex', 'paroc', 'isover', 'knauf']}
        <div class="wrapper sect-inner about-uteplitel">

            <div class="about-uteplitel__text">
                <h1 class="title-1 title-1_align_left about-uteplitel__text-title">{$_modx->resource.pagetitle}</h1>
                {$content}
            </div>
            <div class="about-uteplitel__image">

                {set $image = $_modx->runSnippet("@FILE snippets/imageExist.php", [
                "path" => "/assets/template/img/about/" ~ $_modx->resource.context_key ~ "/",
                "image" => "tc",
                ])}

                <img src="{$image}">
            </div>
        </div>
    {else}
        <div class="wrapper sect-inner about">
            <h1 class="title-1 title-1_align_left">{$_modx->resource.pagetitle}</h1>

            {if $_modx->resource.context_key != 'pilomat'}
                {$content}
            {/if}
        </div>
    {/if}

    {if $_modx->resource.context_key == 'pilomat'}
        {include "file:sections/sect-pilorama.tpl"}
    {/if}
    {if $_modx->resource.context_key == 'plitaosb'}
        {include "file:sections/sect-plitaosb-sklad.tpl"}
    {/if}
    {if $_modx->resource.context_key == 'ugol'}
        {include "file:sections/sect-ugol.tpl"}
    {/if}

    {include "file:chunks/svg-gradient.tpl" w=48 h=48}
    <section class="wrapper sect-segment">
        <h2 class="title-2 title-2_align_left">Основной сегмент наших клиентов</h2>
        <ul class="sect-segment__items-wrap">
            <li class="sect-segment__item">
                <div class="sect-segment__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-segment__item-svg" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="32" height="32">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#fizlic"></use>
                    </svg>
                </div>
                Физические лица
            </li>
            <li class="sect-segment__item">
                <div class="sect-segment__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-segment__item-svg" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="38" height="37">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#snab"></use>
                    </svg>
                </div>
                Снабженцы и прорабы
            </li>
            <li class="sect-segment__item">
                <div class="sect-segment__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-segment__item-svg" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="36" height="38">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#zastroy"></use>
                    </svg>
                </div>
                Крупные застройщики
            </li>
        </ul>
    </section>
    {* >>> Значения для пунктов *}
    {if $_modx->resource.context_key in list ['web', 'rockwool', 'tn', 'penoplex', 'isover', 'paroc', 'ursa']}
        {set $textBestPrice = 'Владеем собственным автопарком, поэтому можем гарантировать максимально низкую цену на утеплитель данного бренда.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить утеплитель уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени. Гарантия от производителя.'}
    {elseif $_modx->resource.context_key == 'krovlya'}
        {set $textBestPrice = 'Владеем собственным автопарком, поэтому можем гарантировать максимально низкую цену на кровлю.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить стройматериал уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'pro-fanera'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на фанеру.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить фанеру уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'fasady-pro'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на фасадные материалы.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить фасадные материалы уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'fasad'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на фасадные материалы.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить фасадные материалы уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'pilomat'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на пиломат.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить пиломатериал уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'plitaosb'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на плитные материалы.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить плитный материал уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'plity-mdvp'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на МДВП плиты.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить плиту МДВП уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'kirpich-m'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на кирпич.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить кирпич уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'armatura-178'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на арматуру и металлопрокат.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить арматуру уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {elseif $_modx->resource.context_key == 'asconcrete'}
        {set $textBestPrice = 'Мы являемся официальным дистрибьютором, поэтому можем гарантировать максимально низкую цену на асфальтобетон.'}
        {set $textDelivery = 'После уточнения наличия Вы можете получить асфальт уже через 2 часа у Вас на объекте! Или в любой удобный для Вас интервал времени.'}
    {/if}
    {* <<< Значения для пунктов *}

    {if $_modx->resource.context_key in list ['penoplex', 'tn', 'rockwool', 'paroc', 'isover', 'knauf']}
        <section class="wrapper sect-warehouse">
            <div class="sect-warehouse__info">
                <div class="sect-warehouse__text">
                    <span class="sect-warehouse__header">Наши склады</span>
                    {switch $_modx->resource.context_key}
                    {case "rockwool"}
                        <p>Мы понимаем, насколько важна скорость и надежность поставок.</p>
                        <p>Именно поэтому у компании «ТермоДом» есть пять собственных складов в Санкт-Петербурге и Ленинградской области.</p>
                        <ul>
                            <li>Большинство популярных позиций всегда в наличии</li>
                            <li>Если нужного объема нет на складе, мы обеспечим поставку в течение 2–3 дней</li>
                            <li>Благодаря собственному автопарку доставка возможна в день заказа или в удобное для клиента время.</li>
                        </ul>
                    {case "tn"}
                        <p>Мы знаем, как важны быстрая и надежная доставка.</p>
                        <p>Для этого у нас функционируют пять собственных складов в Санкт-Петербурге и Ленинградской области.</p>
                        <ul>
                            <li>Большинство востребованных товаров всегда есть в наличии.</li>
                            <li>Если нужного объема нет на складе, мы организуем поставку в течение 2–3 дней.</li>
                            <li>Собственный автопарк позволяет доставить заказ в день обращения или в любое удобное для клиента время.</li>
                        </ul>
                    {case "penoplex"}
                        <p>Мы ценим скорость и надежность поставок.</p>
                        <p>Для этого у нас действует пять собственных складов в Санкт-Петербурге и Ленинградской области.</p>
                        <ul>
                            <li>Большинство востребованных товаров всегда в наличии.
                            </li>
                            <li>Если нужного объема нет на складе, мы организуем поставку в течение 2–3 дней.</li>
                            <li>Собственный автопарк позволяет доставить заказ в день оформления или в любое удобное для клиента время.</li>
                        </ul>
                    {case "knauf"}
                        <p>Для нас важны оперативность и надежность поставок.
                            «ТехРесурс» располагает пятью собственными складами в Санкт-Петербурге и Ленинградской области, что позволяет быстро комплектовать заказы.</p>
                        <p>Чаще всего нужные позиции есть в наличии, а если необходимый объем отсутствует, мы организуем поставку в течение 2–3 дней.</p>
                        <p>
                            Собственный автопарк обеспечивает доставку в день заказа или в удобное для клиента время.</p>
                    {case "isover"}
                        <p>Мы ценим скорость и надежность поставок.</p>
                        <p>Компания «ТемПлет» имеет пять собственных складов в Санкт-Петербурге и Ленинградской области, что позволяет оперативно комплектовать заказы.</p>
                        <p>Большинство популярных товаров всегда в наличии, а при отсутствии нужного объема мы гарантируем доставку в течение 2–3 дней.</p>
                        <p>
                            Благодаря собственному автопарку доставка возможна в день заказа или в удобное для вас время.</p>
                    {case "paroc"}
                        <p>Мы уделяем особое внимание оперативности и надежности поставок.</p>
                        <p>Компания «Максимум Теплоизоляции» располагает пятью собственными складами в Санкт-Петербурге и Ленинградской области, что позволяет быстро формировать заказы.</p>
                        <p>Чаще всего востребованные товары есть в наличии, а при необходимости поставка отсутствующего объема осуществляется в течение 2–3 дней.</p>
                        <p>Собственный автопарк обеспечивает доставку в день заказа или в удобное для клиента время.</p>
                    {/switch}
                </div>
                <div class="sect-warehouse__image">
                    {set $image = $_modx->runSnippet("@FILE snippets/imageExist.php", [
                    "path" => "/assets/template/img/about/" ~ $_modx->resource.context_key ~ "/",
                    "image" => "warehouse",
                    ])}
                    <img src="{$image}">
                </div>
            </div>

            {set $warehousesCategoryId = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'skladyi']}
            <div class="sect-warehouse__items">
                {'pdoResources' | snippet : [
                'parents' => $warehousesCategoryId,
                'includeTVs' => "warehouse_photo",
                "tvPrefix" => "",

                'tpl' => '@INLINE  <div class="sect-warehouse__item warehouse-item">
                    <div class="warehouse-item__image">
                        <img src="{$warehouse_photo}">
                    </div>
                    <div class="warehouse-item__title">
                        <span><svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M6.4655 5.1229C6.92843 4.65646 7.47906 4.28618 8.08567 4.0334C8.69228 3.78061 9.34291 3.65031 10.0001 3.64998C11.3251 3.64998 12.5967 4.17915 13.5347 5.1229C14.4738 6.06932 15.0006 7.34874 15.0001 8.68207C15.0001 10.9846 13.7234 13.0687 12.3934 14.6075C11.833 15.2528 11.2253 15.8556 10.5755 16.4108C10.3876 16.5719 10.1957 16.7284 10.0001 16.88C9.80454 16.7282 9.61268 16.5718 9.42466 16.4108C8.77485 15.8556 8.16721 15.2528 7.60675 14.6075C6.27675 13.0687 5.00008 10.9846 5.00008 8.68207C5.00008 7.34665 5.52758 6.06665 6.4655 5.1229ZM9.76008 17.7404L10.0001 17.4L10.2401 17.7404C10.1698 17.7899 10.086 17.8165 10.0001 17.8165C9.91415 17.8165 9.83032 17.7899 9.76008 17.7404ZM9.76008 17.7404L10.0001 17.4L10.2401 17.7404L10.2417 17.7396L10.2459 17.7366L10.2584 17.7271L10.3076 17.6917C10.3498 17.6608 10.4095 17.6158 10.4867 17.5567C10.6401 17.4391 10.8576 17.2662 11.1172 17.0442C11.7986 16.4617 12.4358 15.8294 13.0234 15.1525C14.4017 13.5583 15.8334 11.2833 15.8334 8.68165C15.8334 7.12748 15.2192 5.63582 14.1259 4.53582C13.5855 3.99136 12.9428 3.55917 12.2347 3.26412C11.5266 2.96907 10.7672 2.817 10.0001 2.81665C9.23301 2.81694 8.47358 2.96895 7.76549 3.26393C7.05741 3.5589 6.41466 3.99102 5.87425 4.5354C4.77996 5.63799 4.16615 7.12862 4.16675 8.68207C4.16675 11.2833 5.59841 13.5583 6.97675 15.1525C7.5644 15.8294 8.20157 16.4617 8.883 17.0442C9.143 17.2662 9.36008 17.4391 9.51342 17.5567C9.58864 17.6146 9.66461 17.6715 9.74133 17.7275L9.75466 17.7366L9.75842 17.7396L9.76008 17.7404ZM8.33342 8.64998C8.33342 8.20796 8.50901 7.78403 8.82157 7.47147C9.13413 7.15891 9.55805 6.98332 10.0001 6.98332C10.4421 6.98332 10.866 7.15891 11.1786 7.47147C11.4912 7.78403 11.6667 8.20796 11.6667 8.64998C11.6667 9.09201 11.4912 9.51593 11.1786 9.82849C10.866 10.1411 10.4421 10.3167 10.0001 10.3167C9.55805 10.3167 9.13413 10.1411 8.82157 9.82849C8.50901 9.51593 8.33342 9.09201 8.33342 8.64998ZM10.0001 6.14998C9.33704 6.14998 8.70116 6.41338 8.23231 6.88222C7.76347 7.35106 7.50008 7.98694 7.50008 8.64998C7.50008 9.31302 7.76347 9.94891 8.23231 10.4178C8.70116 10.8866 9.33704 11.15 10.0001 11.15C10.6631 11.15 11.299 10.8866 11.7678 10.4178C12.2367 9.94891 12.5001 9.31302 12.5001 8.64998C12.5001 7.98694 12.2367 7.35106 11.7678 6.88222C11.299 6.41338 10.6631 6.14998 10.0001 6.14998Z" fill="black"/>
</svg>
 {$pagetitle}</span>
                    </div>

                    <div class="warehouse-item__link">
                        Перейти
                    </div>
                    <a href="{$id | url}" class="warehouse-item__link-container">

                    </a>
                </div>',
                ]}


            </div>

        </section>
    {/if}
    <section class="wrapper sect-benefits {if $_modx->resource.context_key in list ['penoplex', 'tn', 'rockwool', 'paroc', 'isover', 'knauf']}sect-benefits__uteplitel{/if}">
        <h2 class="title-2 title-2_align_left">Какие выгоды вы получите, обратившись к нам</h2>
        <ul class="sect-benefits__items-wrap">
            <li class="sect-benefits__item">
                <div class="sect-benefits__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-benefits__item-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="28" height="36">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#rouble"></use>
                    </svg>
                </div>
                <div class="sect-benefits__item-content">
                    <p class="sect-benefits__item-title">Лучшая цена</p>
                    <p class="sect-benefits__item-text">
                        {$textBestPrice}
                    </p>
                </div>
            </li>
            <li class="sect-benefits__item">
                <div class="sect-benefits__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-benefits__item-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="44" height="32">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#truck"></use>
                    </svg>
                </div>
                <div class="sect-benefits__item-content">
                    <p class="sect-benefits__item-title">Доставка по звонку</p>
                    <p class="sect-benefits__item-text">
                        {$textDelivery}
                    </p>
                </div>
            </li>
            <li class="sect-benefits__item">
                <div class="sect-benefits__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-benefits__item-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="40" height="40">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#smile"></use>
                    </svg>
                </div>
                <div class="sect-benefits__item-content">
                    <p class="sect-benefits__item-title">Экономия бюджета до 40% !</p>
                    <p class="sect-benefits__item-text">
                        Позвоните нам и наш менеджер подберет наиболее оптимальный вариант под Ваши нужды.
                    </p>
                </div>
            </li>
            <li class="sect-benefits__item">
                <div class="sect-benefits__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-benefits__item-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="36" height="38">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#warranty"></use>
                    </svg>
                </div>
                <div class="sect-benefits__item-content">
                    <p class="sect-benefits__item-title">Гарантия от производителя</p>
                </div>
            </li>
            <li class="sect-benefits__item">
                <div class="sect-benefits__item-svg-wrap">
                    <svg fill="url(#svg-gradient)" class="svg sect-benefits__item-svg"
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="36" height="38">
                        <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#complex-supply"></use>
                    </svg>
                </div>
                <div class="sect-benefits__item-content">
                    <p class="sect-benefits__item-title">Комплексные поставки стройматериалов</p>
                    <p class="sect-benefits__item-text">
                        Обратившись к нам Вы убережете себя от проблем с поиском строительных материалов начиная с нулевого цикла и заканчивая внутренней отделой помещений.
                    </p>
                </div>
            </li>
        </ul>
    </section>
    {if $_modx->resource.context_key in list ['penoplex', 'tn', 'rockwool', 'paroc', 'isover', 'knauf']}
        {include "file:sections/sect-mission.tpl"}
    {/if}

    {include "file:sections/appeal.tpl"}
{/block}
