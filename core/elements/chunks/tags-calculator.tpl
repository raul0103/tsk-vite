{set $tags = json_decode($_modx->resource.tagsCalculator, true)}
{if count($tags) > 0}
<div class="tags-calculator">
    <div>
        <span class="tags-calculator__header">Также искали:</span>
        <div class="tags-calculator__tags">
            {foreach $tags as $tag}
                <div class="tags-calculator__tag"><a href="{$tag.link}">{$tag.name}</a></div>
            {/foreach}
        </div>
    </div>

    <span class="tags-calculator__show_more">Все теги</span>
</div>
{/if}