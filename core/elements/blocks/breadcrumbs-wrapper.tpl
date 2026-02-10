{if $_modx->context.key in list ['krovlya', 'plitaosb']}
    {set $js_bcms_more="js-bcms-more"}
{/if}
<ul itemscope itemtype="https://schema.org/BreadcrumbList" class="breadcrumbs {$js_bcms_more}">{$output}</ul>