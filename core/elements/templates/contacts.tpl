{extends "file:layouts/default.layout.tpl"}

{block "page"}
    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>

    {insert "file:sections/contacts/contacts.tpl"}
    {include "file:sections/sect-pilorama.tpl"}

    {if $_modx->resource.content | length > 0}
        <div class="wrapper section_mb_60">
            <article class="content-block">
                {$_modx->resource.content}
            </article>
        </div>
    {/if}


    {include "file:sections/districts-map.tpl"}

    {if $_modx->resource.context_key == "krovlya"}
        <div class="wrapper section_mb_60">
            {include 'file:blocks/production-block.tpl'}
        </div>
    {/if}

    {include "file:sections/faq.tpl"}
    {include "file:sections/steps.tpl"}
    {include "file:sections/partners.tpl"}
{/block}
