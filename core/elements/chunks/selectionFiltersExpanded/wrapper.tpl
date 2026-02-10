
<div class="wrapper_selection_custom_filters">
    <div class="selection_custom_filters-small show">
        {'getTags' | snippet : [
            "tplTagsErapper" => "@FILE chunks/selections.tpl",
            "tplTagsItem" => "@FILE sections/category/listing-tags-item-no-image.tpl",
            "limit" => $_modx->resource.count_filter
        ]}
    </div>

    <div class="selection_custom_filters">
        {$_modx->runSnippet("@FILE snippets/selectionExpandedFilterLinks.php", [
            'tvField' => "selectionCustomFilters",
            'tplItemLink' => "@FILE chunks/selectionFiltersExpanded/linkNoImage.tpl"
        ])}
        {include 'file:chunks/selectionFiltersExpanded/buttonHideAll.tpl'}
    </div>
</div>

{set $resultColors = $_modx->runSnippet('pdoResources', [
'tpl' => '@FILE chunks/selectionsItem.tpl',
'depth' => 0,
'limit' => $_modx->resource.count_filter_color,
'sortby' => 'menuindex',
'sortdir' => 'ASC',
'tplWrapper' => '@FILE chunks/selections.tpl',
'tvPrefix' => '',
'includeTVs' => 'showInDropdownPanel,mainImage',
'where' => '{"template:in":[27]}',
'totalVar' => 'total',
'setTotal' => 1,
'select' => 'menutitle,uri'
])}
{if $resultColors}
<span class="selection-header">Цветовая палитра</span>
<div class="wrapper_selection_custom_filters colors">
    <div class="selection_custom_filters-small show">
        {$resultColors}
    </div>

    <div class="selection_custom_filters">
        {$_modx->runSnippet("@FILE snippets/selectionExpandedFilterLinks.php", [
            'tvField' => "selectionCustomFiltersColors",
            'tplItemLink' => "@FILE chunks/selectionFiltersExpanded/linkWithImage.tpl"
        ])}
        {include 'file:chunks/selectionFiltersExpanded/buttonHideAll.tpl'}
    </div>
</div>
{/if}