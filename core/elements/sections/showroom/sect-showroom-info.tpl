<section class="wrapper sect-showroom-info">

    <div class="sect-showroom-info__info showroom-grid" itemscope itemtype="http://schema.org/LocalBusiness">
        <div class="showroom-grid__line">
            <h2>Информация о магазине</h2>
        </div>
        
            

                {if ('show_room' in keys $_modx->getPlaceholder('localdata'))}
                    <div class="showroom-grid__line">
                        <div class="showroom-grid__line_left">Телефон</div>
                        <div class="showroom-grid__line_right showroom-phone">
                            <a href="tel:{$_modx->getPlaceholder('localdata').show_room.phone}" itemprop="telephone">{$_modx->getPlaceholder('localdata').show_room.phone}</a>
                        </div>
                    </div>
                    <div class="showroom-grid__line">
                        <div class="showroom-grid__line_left">E-mail</div>
                        <div class="showroom-grid__line_right" >
                            <a class="link-red" href="mailto:{'email' | option}" itemprop="email">{'email' | option}</a>
                        </div>
                    </div>
                    <div class="showroom-grid__line" itemprop="address">
                        <div class="showroom-grid__line_left">Адрес</div>
                        <div class="showroom-grid__line_right"  itemprop="streetAddress">
                            <p>
                                {$_modx->getPlaceholder('localdata').show_room.address}
                            </p>
                            <p>
                                <a class="link-red" href="{$_modx->getPlaceholder('localdata').show_room.ymap_link}">
                                    На карте
                                </a>
                            </p>
                        </div>
                    </div>
                {else}
                    <div class="showroom-grid__line">
                        <div class="showroom-grid__line_left">Телефон</div>
                        <div class="showroom-grid__line_right showroom-phone">
                            <a href="tel:{$_modx->getPlaceholder('localdata').offices.0.phone}" itemprop="telephone">{$_modx->getPlaceholder('localdata').offices.0.phone}</a>
                        </div>
                    </div>
                    <div class="showroom-grid__line">
                        <div class="showroom-grid__line_left">E-mail</div>
                        <div class="showroom-grid__line_right" >
                            <a class="link-red" href="mailto:{'email' | option}" itemprop="email">{'email' | option}</a>
                        </div>
                    </div>
                    <div class="showroom-grid__line" itemprop="address">
                        <div class="showroom-grid__line_left">Адрес</div>
                        <div class="showroom-grid__line_right"  itemprop="streetAddress">
                            <p>
                            Россия, Санкт-Петербург, Мурино, ул. Кооперативая, д. 20Б
                            {* {'address' | option} *}
                            </p>
                            <p>
                                <a class="link-red" href="https://yandex.ru/maps/-/CDuOuPn2">
                                    На карте
                                </a>
                            </p>
                        </div>
                    </div>
                {/if}

                

        
        
        
        <div class="showroom-grid__line">
            <div class="showroom-grid__line_left">График работы</div>
            <div class="showroom-grid__line_right">
                <div>ежедневно с 8:00 до 21:00</div>
            </div>
        </div>
        <div class="showroom-grid__cta">
                <span data-fancybox data-src="#showroom" class="listing__catalog-promo-btn-more showroom-grid__cta-button" data-btn-key="showroom">
                    Запись в Шоу-рум
                    <span class="listing__catalog-promo-btn-more-arrow"></span>
                </span>
        </div>

    </div>
    <div class="sect-showroom-info__map">
        <div class="showroom-map">  
            {if ('show_room' in keys $_modx->getPlaceholder('localdata'))}
            <div class="map__container">
                <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%{$_modx->getPlaceholder('localdata').show_room.ymap}&amp;width=460&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
            {else}
            <div class="map__container">
                <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A31df190eea88679967ae35e35e6dcc4126648da41068891dbc7988e304baa628&amp;width=460&amp;height=400&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
            {/if} 
        </div>
    </div>
</section>
