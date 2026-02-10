<footer class="footer">
    <div class="wrapper footer__wrapper">
      <div class="footer__inner">
        <div class="footer__left">
            <a class="footer__logo" href="/">
                {if $_modx->resource.context_key in list ['plitaosb', 'web', 'rockwool', 'tn', 'paroc', 'penoplex', 'ursa', 'isover', 'fasady-pro', 'pro-fanera', 'fasad', 'policarbonat', 'isorok', 'drova', 'ugol', 'umatex', 'brikety', 'pellety']}
                    {*
                    <picture>
                        <source srcset="/assets/template/img/logos/plitaosb-mobile.png" media="(max-width: 768px)">
                        <img class="header__logo-img adaptive-img" src="/assets/template/img/logos/plitaosb.png">
                    </picture>
                    *}
                    <img class="footer__logo-img adaptive-img" src="/assets/template/img/logos/{$site_context}.png">
                {else}
                    <img class="footer__logo-img adaptive-img" src="/assets/template/img/logos/{$site_context}.svg">
                {/if}
            </a>
            <div class="footer__about">© 2010-{'' | date : "Y"}</div>
            <div class="footer__payment"><span>Принимаем к оплате:</span>
                <div class="footer__payment-list">
                    <img src="{$_modx->config['template_path']}img/payment/payment1.png" alt="Платежная система МИР">
                    <img src="{$_modx->config['template_path']}img/payment/payment2.png" alt="Платежная система Виза">
                    <img src="{$_modx->config['template_path']}img/payment/payment3.png" alt="Платежная система Виза Электрон">
                    <img src="{$_modx->config['template_path']}img/payment/payment4.png" alt="Платёжная система Маэстро">
                    <img src="{$_modx->config['template_path']}img/payment/payment5.png" alt="Платежная система Мастер Кард">
                </div>
            </div>
            <ul class="footer__nav-list">
                <li class="footer__nav-item"><span class="footer__link" data-fancybox data-type="ajax" data-src="/confidential/">Политика конфиденциальности</span></li>
                {if $_modx->resource.template === 1}
                <li class="footer__nav-item"><a href="/sitemap/">Карта сайта</a></li>
                {/if}
            </ul>

            {switch $_modx->resource.context_key}
                {case 'kirpich-m'}
                    {set $bangeId = '87565500476'}
                {case 'pro-fanera'}
                    {set $bangeId = '54568639872'}
                {case 'fasad'}
                    {set $bangeId = '198187341990'}
                {case 'fasady-pro'}
                    {set $bangeId = '238477607568'}
                {case 'pilomat'}
                    {set $bangeId = '175010721251'}
                {case 'rockwool'}
                    {set $bangeId = '224264785290'}
                {case 'paroc'}
                    {set $bangeId = '1055099724'}
                {case 'tn'}
                    {set $bangeId = '1013634831'}
                {case 'isover'}
                    {set $bangeId = '186816765148'}
                {case 'krovlya'}
                    {set $bangeId = '55933391293'}
            {/switch}

            {if $bangeId && $_modx->context.key == 'kirpich-m'}
                <div id="clickinformer" class="footer__rating-badge">
                    <iframe src="https://yandex.ru/sprav/widget/rating-badge/{$bangeId}?type=rating" width="150" height="50" frameborder="0"></iframe>
                </div>
            {/if}
        </div>
        {if $_modx->getPlaceholder('footer_nav_ids') | length > 1}
        <div class="footer__nav-block">
            {if $_modx->context.key == 'gazobeton'}
                <div class="footer__nav-block-title">Популярные категории</div>
            {else}
                <div class="footer__nav-block-title">Категории</div>
            {/if}
            <ul class="footer__nav-list">
                {set $params = [
                'parents' => $_modx->getPlaceholder('catalog_id'),
                'resources'=> $_modx->getPlaceholder('footer_nav_ids'),
                'tpl' => '@INLINE <li class="footer__nav-item"><a href="{$uri}">{$menutitle}</a></li>',
                'limit' => '0',
                'select' => 'uri,menutitle',
                ]}

                {if $_modx->context.key != 'gazobeton'}
                    {set $params['where'] = '{"template":5}'}
                {/if}
                
                {if $_modx->context.key == 'gazobeton'}
                    {set $params['sortby'] = ''}
                {/if}

                {'pdoResources' | snippet : $params}
            </ul>
        </div>
        {/if}
        <div class="footer__nav-block">
            <div class="footer__nav-block-title">Покупателям</div>
            <ul class="footer__nav-list">
                <li class="footer__nav-item"><a href="/o-kompanii/">О компании</a></li>
                <li class="footer__nav-item"><a href="/contacts/">Контакты</a></li>
                <li class="footer__nav-item"><a href="/dostavka-i-oplata/">Доставка и оплата</a></li>

                {if $_modx->resource.context_key == 'krovlya'}
                    {set $calcservices = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'calculation-services']}

                    {if $calcservices['hidemenu'] == 0 && $calcservices['published'] == 1}
                      <li class="footer__nav-item"><a href="/calculation-services/">Сервисы расчета</a></li>
                    {/if}
                {/if}

                {if $_modx->resource.context_key in list ['kirpich-m', 'krovlya', 'fasady-pro', 'fasad']}
                    {set $showroom = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'show-room']}

                    {if $showroom['hidemenu'] == 0 && $showroom['published'] == 1}
                      <li class="footer__nav-item"><a href="/show-room/">Шоурум</a></li>
                    {/if}
                {/if}

                <li class="footer__nav-item"><a href="/faq/">Вопросы-ответы</a></li>
                <li class="footer__nav-item"><a href="/akcii/">Акции</a></li>

                {set $raspil = '@FILE snippets/getResourceByAlias.php' | snippet : ['alias' => 'raspil']}
                {if $raspil['hidemenu'] == 0 && $raspil['published'] == 1}
                  <li class="footer__nav-item"><a href="/raspil/">Распил</a></li>
                {/if}

                {if $_modx->resource.context_key in list ['rockwool','krovlya','fasady-pro','pilomat']}
                      <li class="footer__nav-item"><a href="/stati/">Статьи</a></li>
                {/if}

                <li class="footer__nav-item"><a href="/certs/">Сертификаты</a></li>
                <li class="footer__nav-item"><a href="/garantii/">Гарантии</a></li>
                <li class="footer__nav-item"><a href="/otzyvy/">Отзывы</a></li>
            </ul>
        </div>
        <div class="footer__right">
            <div class="footer__nav-block-title">Контактная информация</div>
            <ul class="footer__contacts-list">
                <li><a class="footer__about-phone" href="tel:{'!get_virtual_phone' | snippet : ['type'=>'link']}">{'!get_virtual_phone' | snippet : ['type'=>'text']}</a></li>
                <li><a class="footer__email" href="mailto:{'!get_virtual_email' | snippet}"> {'!get_virtual_email' | snippet} </a></li>
                <li>{$_modx->getPlaceholder('localdata').offices.0.address}</li>
                <li>Часы работы: ежедневно с 8:00 до 21:00</li>
            </ul>

            {include "file:elements/social-list.tpl"}
        </div>
      </div>
      {$_modx->runSnippet('@FILE snippets/debug_placeholders.php')}
    </div>
</footer>