{extends "file:layouts/default.layout.tpl"}

{block "page"}
    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>

    <div class="wrapper">
        <h1 class="title-1">{$_modx->resource.pagetitle}</h1>
    </div>

    {if $_modx->resource.content | length > 0}
        <div class="wrapper">
            <div class="delivery"> 
                <div class="delivery__block">
        {include "file:sections/delivery/delivery-description.tpl"}
        {include "file:sections/delivery/delivery-cars.tpl"}
        {* {include "file:sections/delivery/delivery-regions.tpl"} *}
                </div>
            </div>
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
