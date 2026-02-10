{if $_modx->resource.content}
    {set $content = $_modx->resource.content}
{/if}

{set $parent_tpl = $_modx->resource.parent | resource : 'content_tpl'}
{if $parent_tpl}
    {set $content = $parent_tpl}
{/if}

{if $content}
    <article class="content-block{if $mb} product-card__content-block{/if}{if $hideOnMobile} mobile-none{/if}{if $showOnMobile} mobile-block{/if} {if ($_modx->resource.context_key == 'plitaosb') && $contentSubClass}hide_text{/if}" itemprop="description">
        {$content}
    </article>
    {if ($_modx->resource.context_key == 'plitaosb' && $contentSubClass)}
        <div class="show-all-content {if $hideOnMobile}mobile-none{/if}">Читать полностью</div>
    {/if}
{/if}
