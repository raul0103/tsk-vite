{* Сертификаты *}
{if $_modx->resource.certs}
    {set $certs = $_modx->resource.certs}

    {set $certs = json_decode($certs, true)}
    {if $certs | count > 0}
        {set $renderCerts = 1}
    {/if}
{/if}

{set $renderMontage = 0}
{if $_modx->resource.montages}
    {set $montages = $_modx->resource.montages}
    {set $montages = json_decode($montages, true)}
    {if $montages | count > 0}
        {set $renderMontage = 1}
    {/if}
{/if}

{* Видео *}
{set $video = $_modx->resource.video}
{if $video | length > 0}
    {set $renderVideo = 1}
{/if}

{* Pricetable *}
{if $_modx->resource.context_key == 'pilomat'}
    {set $pricetable = 'msProductsMy' | snippet : [
    'parents' => 0,
    'depth' => 50,
    'limit' => 42,
    'sortby' => 'Data.price',
    'sortdir' => 'ASC',
    'tpl' => '@FILE blocks/pilomat/pricetable-row.tpl',
    'where' => '{"id:!=": "'~$_modx->resource.id~'"}',
    'optionFilters' => '{"item_width:=": "'~$_modx->resource.item_width[0]~'", "item_thickness:=":"'~$_modx->resource.item_thickness[0]~'", "vlazhnost:=":"'~$_modx->resource.vlazhnost[0]~'", "anticeptirovannaya":"'~$_modx->resource.anticeptirovannaya[0]~'"}',
    'tplWrapper' => '@FILE blocks/pilomat/pricetable.tpl',
    'context' => $_modx->resource.context_key
    ]}
{/if}

{if $_modx->context.key == 'krovlya'}
    {set $theme_color_class_name = "theme-color"}
{/if}

<div class="product-card__tabs {$theme_color_class_name}" id="card-tabs">
    <div class="product-card__tabs-buttons" data-tabs="product-card__tabs-pages">
        {if $pricetable ?}
            <div class="product-card__tabs-button active">Прайс-лист</div>
        {/if}

        {if ($_modx->resource.template != 21 && !$pricetable && $_modx->resource.context_key != 'plitaosb') || $_modx->resource.context_key == 'policarbonat'}
            <div class="product-card__tabs-button active">Описание</div>
        {/if}

        <div class="product-card__tabs-button{if ($_modx->resource.template == 21 && $_modx->resource.context_key != 'policarbonat' && !$pricetable) || ($_modx->resource.context_key == 'plitaosb')} active{/if}">Характеристики</div>

        {if $_modx->resource.context_key in list ['penoplex', 'tn', 'rockwool']}
            {if $renderMontage}
                <div class="product-card__tabs-button">Руководство по монтажу</div>
            {/if}
        {/if}


        <div class="product-card__tabs-button">Доставка и оплата</div>


        {if $renderCerts == 1 and $_modx->context.key not in list ['rasprodazha']}
            <div class="product-card__tabs-button">Сертификаты</div>
        {/if}

        {if $renderVideo == 1}
            <div class="product-card__tabs-button" data-tab="Видео">Видео</div>
        {/if}

        <div class="product-card__tabs-button product-card__tabs-button_type_reviews">Отзывы</div>
    </div>
    <div class="product-card__tabs-pages">
        {if $pricetable ?}
            <div class="product-card__tabs-page active">
                <div class="product-card__mobile-tabs-button">Прайс-лист</div>
                <div class="product-card__content-wrap">
                    {$pricetable}
                </div>
            </div>
        {/if}

        {if ($_modx->resource.template != 21 && !$pricetable && $_modx->resource.context_key != 'plitaosb') || $_modx->resource.context_key == 'policarbonat'}
            <div class="product-card__tabs-page active">
                <div class="product-card__mobile-tabs-button">Описание</div>
                <div class="product-card__content-wrap">
                    {include 'file:sections/product/card-content-tab.tpl'}
                </div>
            </div>
        {/if}

        <div class="product-card__tabs-page{if ($_modx->resource.template == 21 && $_modx->resource.context_key != 'policarbonat' && !$pricetable) || ($_modx->resource.context_key == 'plitaosb')} active{/if}">
            <div class="product-card__mobile-tabs-button">Характеристики</div>
            <div class="product-card__content-wrap">
                {include 'file:sections/product/card-specs-tab.tpl'}
            </div>
        </div>

        {if $_modx->resource.context_key in list['penoplex', 'tn', 'rockwool'] }
            {if $renderMontage}
                <div class="product-card__tabs-page">
                    <div class="product-card__mobile-tabs-button">Руководство по монтажу</div>
                    <div class="product-card__content-wrap">
                        {include 'file:sections/product/card-montage-tab.tpl'}
                    </div>
                </div>
            {/if}
        {/if}

        <div class="product-card__tabs-page">
            <div class="product-card__mobile-tabs-button">Доставка и оплата</div>
            <div class="product-card__content-wrap">
                {include 'file:blocks/content-delivery.tpl'}
            </div>
        </div>

        {if $renderCerts == 1  and $_modx->context.key not in list ['rasprodazha']}
            <div class="product-card__tabs-page">
                <div class="product-card__mobile-tabs-button">Сертификаты</div>
                <div class="product-card__content-wrap">
                    {include 'file:blocks/certs.tpl'}
                </div>
            </div>
        {/if}

        {if $renderVideo == 1}
            <div class="product-card__tabs-page" data-tab="Видео">
                <div class="product-card__mobile-tabs-button">Видео</div>
                <div class="product-card__content-wrap">
                    {include 'file:sections/product/card-video-tab.tpl' value=$video}
                    <div class="content-block"></div>
                </div>
            </div>
        {/if}

        <div class="product-card__tabs-page">
            <div class="product-card__mobile-tabs-button">Отзывы</div>
            <div class="product-card__content-wrap">
                {include 'file:sections/product/card-reviews-tab-new.tpl'}
            </div>
        </div>
    </div>
</div>
