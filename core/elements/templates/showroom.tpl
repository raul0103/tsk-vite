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
        {set $content = '<article class="sect-inner__content content-block">'~ $_modx->resource.content ~'</article>'}
    {/if}
    {* {ereplace:'/\D+/':'' | ereplace:'/^(8)?(.+)?':'7{$2}'} *}

    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>
    
    <section class="wrapper sect-showroom-title">
        <h1 class="title-1">{$_modx->resource.pagetitle}</h1>
    </section>

    {include "file:sections/showroom/sect-showroom-info.tpl"}

    <section class="wrapper sect-showroom-content">
        {$content} 
    </section>

    
    <section class="wrapper sect-showroom-title">
        <h2 class="title-2">Фотографии шоу-рума</h2>
    </section>
    {include "file:sections/showroom/sect-showroom-gallery.tpl"}

    {include "file:sections/showroom/sect-showroom-banner.tpl"}
    {if $_modx->context.key != 'kirpich-m'}
        <section class="wrapper sect-showroom-title">
            <h2 class="title-2">Наши объекты</h2>
        </section>
        {include "file:sections/showroom/sect-showroom-swiper.tpl"}
    {/if}
    {include "file:sections/advantages.tpl"}
{/block}
