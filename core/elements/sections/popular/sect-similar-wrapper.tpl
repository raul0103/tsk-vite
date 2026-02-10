{if $_modx->resource.context_key in list ['fasad', 'gazobeton']}
    {set $title = "Сопутствующие товары"}
    {else}
    {set $title = "Похожие товары"}
{/if}
{include "file:sections/popular/sect-pop-wrapper.tpl" title=$title sliderVal=3}
