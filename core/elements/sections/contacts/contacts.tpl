{set $utm_city = '!utm' | snippet : ['val' => 'city']}

<section class="contacts">
    <div class="wrapper">
        <div class="contacts__left{if $utm_city['icase'] ?} contacts__left_width_full{/if}" itemscope itemtype="http://schema.org/LocalBusiness">
            <h1 class="title-1 title-1_align_left">Контакты</h1>

            <ul class="contacts__list">
                <li class="contacts__item">
                    <div class="contacts__item-key"><span>Отдел продаж</span></div>
                    <a class="contacts__item-value" href="tel:{'!get_virtual_phone' | snippet : ['type'=>'link']}">
                        <span itemprop="telephone">{'!get_virtual_phone' | snippet : ['type'=>'text']}</span>
                    </a>
                </li>
                <li class="contacts__item">
                    <div class="contacts__item-key"><span>Приём заявок</span></div>
                    <div class="contacts__item-value">Ежедневно с 08:00-21:00</div>
                </li>
                <li class="contacts__item">
                    <div class="contacts__item-key"><span>Работа офиса</span></div>
                    <div class="contacts__item-value">Пн-пт с 08:00 - 21:00</div>
                </li>
                <li class="contacts__item">
                    <div class="contacts__item-key"><span>E-mail для заявок</span></div>
                    <a class="contacts__item-value" href="mailto:{'!get_virtual_email' | snippet}">
                        <span itemprop="email">{'!get_virtual_email' | snippet}</span>
                    </a>
                </li>
                <li class="contacts__item contacts__item_content_address" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
                    <div class="contacts__item-key"><span>Адрес офиса</span></div>
                        {if $.session.city_change == 'msk'}
                            <div class="contacts__item-value-text" itemprop="streetAddress">{'address' | option}</div>
                        {elseif $.session['+source_utm'] is empty}
                            {'!get_address_select' | snippet : ['type' => 'contacts']}
                        {else}
                            <div class="contacts__item-value-text" itemprop="streetAddress">{'address' | option}</div>
                        {/if}
                </li>


                {'!lumbermills' | snippet : ['type'=>'select']}
                {*
                {if $_modx->resource.context_key == 'pilomat'}
                    <li class="contacts__item contacts__item_content_address contacts__item_wrap_true" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress"> 
                        <div class="contacts__item-key"><span>Пилорамы</span></div>
                        <div class="contacts__item-value" itemprop="streetAddress" 
                            data-address-2="Парголово, Ленинградская улица, 93В" 
                            data-address-3="Всеволожский район, территория Соржа-Старая производственно-складская зона, Заневское городское поселение"
                        >
                            Санкт-Петербург, территория Сергиево, Красная улица, 44Д
                        </div>
                    </li>
                {/if}
                *}

            </ul>
            <div class="contacts__left-bottom">
                {*
                <div class="contacts__social">
                    <div class="contacts__social-title">Мы в соц. сетях</div>
                    <div class="contacts__social-list">
                        {include "file:elements/social-list.tpl"}
                    </div>
                </div>
                *}
                <span class="contacts__callback custom-btn" data-src="#callback" data-fancybox="">ЗАДАТЬ ВОПРОС</span>
            </div>
            {* >>> meta *}
            <meta itemprop="name" content="{'site_name' | option}">
            <meta itemprop="priceRange" content="От 250 RUB">
            <meta itemprop="image" content="/assets/template/img/favicons/{$site_context}/favicon.ico">
            <time itemprop="openingHours" datetime="Mo-Su 08:00−21:00">
            {* <<< meta *}
        </div>
        {if $utm_city['icase'] is empty}
            <div class="contacts__map">  
            {if $.session.city_change == 'msk'}
                <div class="map__container">
                    <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Ac901c3bc8f7ab6a1d4db4b5777a9226b17b21e91f5ccc0c8d25ffcb9dae91398&amp;width=460&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>
                </div> 
            {elseif $_modx->context.key === 'pro-fanera'}

                    {if $_modx->getPlaceholder('localdata').local}
                        {set $count=0}
                        {foreach $_modx->getPlaceholder('localdata').offices as $office}
                            {set $count=$count+1}
                            {if  $count>1}
                                {set $style='style="display: none;"'}
                            {else}
                                {set $style=''}
                            {/if}
                            <div class="map__container" data-map="{$count}" {$style}>
                                <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%{$office.ymap}&amp;source=constructor" width="500" height="400" frameborder="0"></iframe>
                            </div>
                        {/foreach}
                        {if $_modx->getPlaceholder('localdata').omny_offices_use}
                            {foreach $_modx->getPlaceholder('localdata').omny_offices as $office1}
                                {set $count=$count+1}
                                {set $style='style="display: none;"'}
                                <div class="map__container" data-map="{$count}" {$style}>
                                    <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%{$office1.ymap}&amp;source=constructor" width="500" height="400" frameborder="0"></iframe>
                                </div>
                            {/foreach}
                        {/if}
                    {else}
                        <div class="map__container">
                            <iframe src="https://yandex.ru/map-widget/v1/?z=12&ol=biz&oid=54568639872" width="560" height="400" frameborder="0"></iframe>
                        </div> 
                    {/if}
            {else}
                {if $.session['+source_utm'] is empty}

                    {set $count=0}
                    {foreach $_modx->getPlaceholder('localdata').offices as $office}
                        {set $count=$count+1}
                        {if  $count>1}
                            {set $style='style="display: none;"'}
                        {else}
                            {set $style=''}
                        {/if}
                        <div class="map__container" data-map="{$count}" {$style}>
                            <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%{$office.ymap}&amp;source=constructor" width="500" height="400" frameborder="0"></iframe>
                        </div>
                    {/foreach}
                    {foreach $_modx->getPlaceholder('localdata').omny_offices as $office1}
                        {set $count=$count+1}
                        {set $style='style="display: none;"'}
                        <div class="map__container" data-map="{$count}" {$style}>
                            <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%{$office1.ymap}&amp;source=constructor" width="500" height="400" frameborder="0"></iframe>
                        </div>
                    {/foreach}
                    
                {else}
                    <div class="map__container" data-map="1">
                      <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um={'yandex_map_contacts' | get_option}&amp;width=100%25&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>
                    </div>
                {/if}
            {/if}
            </div>
        {/if}
    </div>
</section>