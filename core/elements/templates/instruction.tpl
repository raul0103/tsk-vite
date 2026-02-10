{extends "file:layouts/default.layout.tpl"}

{block 'title'}
    {include "file:elements/product/meta-title.tpl"}
{/block}
{block 'description'}
    {include "file:elements/product/meta-description.tpl"}
{/block}

{block "page"}
    <div class="wrapper">
        {include "file:blocks/breadcrumbs.tpl"}
    </div>
    <div class="wrapper instruction">
        <div class="header-top">
            <h1 class="title-1">{$_modx->resource.pagetitle}</h1>
        </div>
        <div class="card-promo">
            <div class="card-promo__aside mb-hidden">
                <div class="cat-menu cat-menu--show">
                    <div class="cat-menu__wrap" style="max-height: 108rem;">
                        {block 'sidebar'}
                            {if $_modx->resource.pagetitle == "Чертежи"}
                                {include "file:elements/instruction/chertezhi_menu.tpl"}
                            {elseif $_modx->resource.pagetitle == "Инструкции"}
                                {include "file:elements/instruction/instruction_menu.tpl"}
                            {/if}
                        {/block}
                    </div>
                </div>
            </div>
            <div class="card-promo__visual">
                <div id="b-pjax-1" class="block-indent" data-pjax-container="" data-pjax-push-state=""
                     data-pjax-timeout="1000">
                    {if $_modx->resource.pagetitle == "Чертежи"}
                        {set $type = "chertezhi"}
                    {elseif $_modx->resource.pagetitle == "Инструкции"}
                        {set $type = "instruction"}
                    {else}
                        {set $type = "chertezhi"}
                    {/if}
                    <div class="documentation-list" data-type="{$type}">
                        {$_modx->runSnippet("@FILE snippets/instructionArray.php", ["type" => $type])}
                    </div>

                </div>
            </div>
        </div>

    </div>
{/block}
