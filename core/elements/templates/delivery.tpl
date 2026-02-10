{extends "file:layouts/default.layout.tpl"}

{block "page"}
    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>
    <div class="wrapper">
        {if $_modx->resource.context_key != "krovlya"}
            <h1 class="title-1 delivery-header">{$_modx->resource.pagetitle}</h1>
        {/if}
    </div>

    {if $_modx->resource.context_key == "krovlya"}
        <div class="wrapper">
            <div class="delivery-banner delivery-page__delivery-banner">
                <a class="delivery-banner__link" href="#" data-fancybox data-src="#header-callback">
                    <picture>
                        <source media="(max-width: 799px)" srcset="/assets/images/delivery/banner/mobile1.png"/>
                        <source media="(min-width: 800px)" srcset="/assets/images/delivery/banner/desctop1.png"/>
                        <img class="delivery-banner__image" src="/assets/images/delivery/banner/desctop1.png"/>
                    </picture>
                </a>
            </div>
        </div>
    {/if}

    {set $localdata = $_modx->getPlaceholder('localdata')}
    {set $emailPrefix = ''}
    {if $localdata && $localdata.main_contacts? && $localdata.main_contacts.email_prefix?}
        {set $emailPrefix = $localdata.main_contacts.email_prefix}
    {/if}
    {set $isBlockedSubdomain = ($emailPrefix == 'krasnodar')}
    {if $_modx->resource.context_key in list ['penoplex', 'tn', 'rockwool', 'isover', 'paroc', 'knauf', 'krovlya']}
        {if $isBlockedSubdomain == false}
            {insert "file:modules/deliveryCalculatorServiceAreas/sections/deliveryCalculator.tpl"}
        {/if}
    {/if}

    {if $_modx->resource.content | length > 0}
        <div class="wrapper">
            {include 'file:blocks/content-delivery.tpl'}
        </div>
    {/if}



    {if $_modx->resource.context_key == "krovlya"}
        <div class="wrapper section_mb_60">
            {include "file:chunks/banner-calculator.tpl"}
        </div>
    {/if}

 
    {include "file:sections/payment.tpl"}
    {include "file:sections/faq.tpl"}
    {include "file:sections/districts-map.tpl"}
    {include "file:sections/appeal.tpl"}
    {include "file:sections/advantages.tpl"}
    {include "file:sections/steps.tpl"}
    {include "file:sections/partners.tpl"}
{/block}
