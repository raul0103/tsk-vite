{extends "file:layouts/default.layout.tpl"}

{block 'title'}
    {include "file:elements/product/meta-title.tpl"}
{/block}
{block 'description'}
    {include "file:elements/product/meta-description.tpl"}
{/block}

{block "page"}


    {if $_modx->resource.template in list [17, 20, 22]}
        {set $cardClass = 'product-card_type_relinking'}
    {elseif $_modx->resource.template == 21}
        {set $cardClass = 'product-card_type_relinking-btns'}
    {elseif $_modx->resource.template == 51}
        {set $cardClass = 'product-card_type_relinking-btns product-card_type_relinking-petrovich'}
    {elseif $_modx->resource.template == 53}
        {set $cardClass = 'product-card_type_relinking product-card_type_relinking-v2 product-card--fasad-standart'}
    {elseif $_modx->resource.template == 58}
        {set $cardClass = 'product-card_type_relinking product-card_type_relinking-v2 product-card--fasad-standart product-card--fasad-images'}
    {elseif $_modx->resource.template == 59}
        {set $cardClass = 'product-card_type_usual card-product-mv78'}
    {else}
        {set $cardClass = 'product-card_type_usual'}
    {/if}

    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>
    <div class="wrapper product-card {$cardClass}" data-views="{'!HitsPage' | snippet : ['saveTv' => 'true']}" itemscope itemtype="http://schema.org/Product">
         {if $_modx->resource.context_key!=='plitaosb'}
            <h1 class="title-1 product-card__title-1" itemprop="name">{$_modx->resource.pagetitle}</h1>
         {/if}
        {include "file:sections/product/card.tpl"}
    </div>

    {if ($_modx->resource.context_key in list ['plitaosb'])}
        <div class="wrapper">
            <div class="banner_product_horisontal">
                <img src="assets/template/img/banners/plitaosb/product_horisontal_11.webp">
                <span data-fancybox="" data-src="#callback" class="listing__catalog-promo-btn-more" data-btn-key="catalog">
                    Заказать
                </span>
            </div>
        </div>
    {/if}
    {if ($_modx->resource.context_key in list ['rockwool'])}
        <div class="wrapper">
            <div class="banner_product_horisontal">
                <picture>
                    <source media="(max-width: 600px)" srcset="/assets/template/img/banners/rockwool/mobile-product.svg">
                    <img src="/assets/template/img/banners/rockwool/product.svg">
                </picture>
                <span data-metrica-config='rockwool-product-banner' data-fancybox="" data-src="#callback" class="listing__catalog-promo-btn-more listing__catalog-promo-btn-more--rockwool" data-btn-key="catalog">
                    Заказать
                </span>
            </div>
        </div>
    {/if}

    {if ($_modx->resource.context_key not in list ['fasad','krovlya', 'kirpich-m']) && ($_modx->resource.item_thickness is not empty)}
        {set $resources = '!msProducts' | snippet : [
        'parents' => 0,
        'depth' => 50,
        'limit' => 42,
        'returnIds' => 1,
        'innerJoin' => '{"Options":{"class":"msProductOption"} }',
        'where' => '{"Options.key":"item_thickness", "Options.value:=":"'~$_modx->resource['item_thickness'].0~'", "context_key:=": "'~$_modx->resource.context_key~'"}',
        'resources' => '-' ~ $_modx->resource.id
        ]}
    {/if}


    {if $_modx->context.key == 'onduline1'}
        {include "file:sections/advantages.tpl"}
        {include "file:sections/faq.tpl"}
        {include "file:sections/popular/sect-pop.tpl" resources=$resources}
        {include "file:sections/districts-map.tpl"}
        {include "file:sections/sect-pilorama.tpl"}
        {include "file:sections/recent.tpl"}
        {include "file:sections/payment.tpl"}
        {include "file:sections/steps.tpl"}
        {include "file:sections/partners.tpl"}
    {else}

        {set $output = $_modx->runSnippet("@FILE modules/similarsamples/snippets/getSimilarProducts.php")}
        {if $output}
            {$output}
        {else}
            {include "file:sections/popular/sect-pop.tpl" resources=$resources}
        {/if}

        {if $_modx->resource.context_key == "krovlya"}
            <div class="wrapper section_mb_60">
                {include "file:chunks/banner-calculator.tpl"}
            </div>
        {/if}


        {include "file:sections/districts-map.tpl"}
        {include "file:sections/sect-pilorama.tpl"}
        {include "file:sections/recent.tpl"}
        {if $_modx->context.key not in list ['rasprodazha']}
        {include "file:sections/faq.tpl"}
        {/if}
        {include "file:sections/payment.tpl"}
        {if $_modx->context.key not in list ['rasprodazha']}
        {include "file:sections/appeal.tpl"}
        {/if}
        {include "file:sections/advantages.tpl"}
        {include "file:sections/steps.tpl"}
        {include "file:sections/partners.tpl"}
    {/if}
{/block}