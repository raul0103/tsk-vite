{extends "file:layouts/default.layout.tpl"}

{block "page"}
<meta name="context" content="{$_modx->resource.context_key}">
<div class="wrapper">
    {include "file:blocks/breadcrumbs.tpl"}
</div>

<div class="wrapper warehouse-back">
    <button class="warehouse-back__button white-btn  whBack">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="/assets/template/img/svg-sprite.svg#return"></use>
        </svg>
        <span>Вернуться к выбору</span>
    </button>
</div>

<div class="wrapper">
    <h1 class="title-1">{$_modx->resource.pagetitle}</h1>
</div>
<section class="warehouse-contacts">
    <div class="wrapper">
        <div class="warehouse-contacts__photo">
            {if $_modx->resource.warehouse_photo}
            <img class="" alt="{$_modx->resource.pagetitle}" src="{$_modx->resource.warehouse_photo}">
            {/if}
        </div>
        <div class="warehouse-contacts__contacts">
            <h2 class="warehouse-contacts__contacts-title">Контакты</h2>
            <ul class="contacts__list">
                <li class="contacts__item">
                    <div class="contacts__item-key"><span>Часы работы</span></div>
                    <div class="contacts__item-value">
                        {if $_modx->resource.warehouse_operating_mode}
                        {$_modx->resource.warehouse_operating_mode}
                        {else}
                        Ежедневно с 06:00 до 22:00
                        {/if}
                    </div>
                </li>
                <li class="contacts__item">
                    <div class="contacts__item-key"><span>Телефон</span></div>
                    <a class="contacts__item-value" href="tel:{$_modx->getPlaceholder('localdata').offices.0.phone}">
                        <span itemprop="telephone">
                            {$_modx->getPlaceholder('localdata').offices.0.phone}
                            {if $_modx->resource.warehouse_additional_contact}
                            (доб. {$_modx->resource.warehouse_additional_contact})
                            {else}
                            (доб. 11)
                            {/if}
                        </span>
                    </a>
                </li>
            </ul>
            <div class="warehouse-contacts__callback callback-delivery custom-btn" data-src="#callback"
                data-fancybox="">РАССЧИТАТЬ СТОИМОСТЬ ДОСТАВКИ</div>
            <div class="warehouse-contacts__callback callback-pickup custom-btn" data-src="#callback" data-fancybox="">
                ОСТАВИТЬ ЗАЯВКУ НА <span>САМОВЫВОЗ</span></div>
        </div>
    </div>
</section>

<section>
    <div class="wrapper">
        <div class="warehouse-search">
            <div class="warehouse-search__form">
                <div class="warehouse-search__form-input">
                    <input type="text" class="warehouse-search__input" placeholder="Найти товар на складе">

                    <span class="warehouse-search__clear" style="display: none;">
                        <svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M1 0.814209L8.99998 8.80977" stroke="#323232" stroke-width="1.5" stroke-linecap="round"/>
                            <path d="M1 8.80981L8.99998 0.814254" stroke="#323232" stroke-width="1.5" stroke-linecap="round"/>
                            <path d="M1 8.81421L7.66664 2.15124" stroke="#323232" stroke-width="1.5" stroke-linecap="round"/>
                        </svg>
                    </span>
                    <button class="warehouse-search__button">
                        <svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M7.22266 0.814209C11.2117 0.814209 14.4461 4.04787 14.4463 8.03687C14.4463 9.67085 13.9022 11.1771 12.9873 12.3875L15.708 15.1082C16.0985 15.4987 16.0985 16.1317 15.708 16.5222C15.3175 16.9127 14.6845 16.9127 14.2939 16.5222L11.5732 13.8015C10.3629 14.7164 8.85664 15.2605 7.22266 15.2605C3.23365 15.2603 0 12.0259 0 8.03687C0.000224959 4.04799 3.23379 0.814411 7.22266 0.814209ZM7.22266 2.81421C4.33837 2.81441 2.00023 5.15255 2 8.03687C2 10.9214 4.33823 13.2603 7.22266 13.2605C8.62819 13.2605 9.90279 12.7037 10.8418 11.8005C10.8632 11.7744 10.8857 11.7488 10.9102 11.7244C10.9349 11.6996 10.9607 11.6766 10.9873 11.655C11.8899 10.7161 12.4463 9.44191 12.4463 8.03687C12.4461 5.15243 10.1071 2.81421 7.22266 2.81421Z"
                                fill="white" />
                        </svg>
                    </button>
                </div>
            </div>
            <div class="warehouse-search__result">
                <div class="warehouse-search__result-search">
                    <span>Поиск по запросу: <span class="warehouse-search__result-search-query"></span></span>
                </div>

                <div class="warehouse-search__result-stocks" style="display: none;">
                    <!-- Результаты поиска будут добавлены динамически через JavaScript -->
                </div>
                
                <div class="warehouse-search__not-in-stock" style="display: none;">
                    <span class="warehouse-search__not-in-stock-text">Данный товар поставляется на склад под запрос. Пожалуйста, оставьте заявку, и мы привезём товар в течение 2–3 дней на склад!</span>
                    <div class="warehouse-search__not-in-stock-button" data-src="#callback" data-fancybox="">
                        Забронировать
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="wrapper">
    {set $where = $_modx->runSnippet("@FILE modules/warehoses/snippets/dataSetWarehouse.php")}
    {if $_modx->resource.context_key == 'plitaosb'}
    {include 'file:modules/warehoses/sections/universal/wrapper-stocks.tpl'}
    {elseif $_modx->resource.context_key == 'fasad'}
    {include 'file:modules/warehoses/sections/universal/wrapper-stocks.tpl'}
    {elseif $_modx->resource.context_key == 'kirpich-m'}
    {include 'file:modules/warehoses/sections/universal/wrapper-stocks.tpl'}
    {elseif $_modx->resource.context_key in list ['tn', 'ursa', 'umatex']}
     {include "file:modules/warehoses/sections/universal/wrapper-stocks.tpl"}
    {elseif $_modx->resource.context_key in list ['penoplex','rockwool', 'isover', 'knauf', 'paroc']}
    {include 'file:modules/warehoses/sections/universal/wrapper-stocks.tpl'}
    {/if}

</div>


{/block}