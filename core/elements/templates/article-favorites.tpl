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
<div class="wrapper sect-inner articles">
    <h1 class="title-1">{$_modx->resource.pagetitle}</h1>
    <div class="content-block" id="pdopage">
        <div class="article-card-row rows">
            {if $article_ids = $.session['article_favorites']}
            {'!pdoPage' | snippet : [
            'limit' => 6,
            'resources' => $article_ids
            'ajaxMode' => 'button',
            'ajaxElemMore' => "#pdopage .btn_more",
            'ajaxTplMore' => '@INLINE <button class="btn btn-default btn_more" data-max="42">Показать еще</button>',
            'context' => $_modx->context.key,
            'parents' => 0,
            'includeTVs' => 'article_image',
            'tvPrefix' => '',
            'where' => '{"template:=":34}',
            'tpl' => '@INLINE
            <div class="article-card-row__item"
                style=" background-image: linear-gradient(90deg, #1D62AD 2.54%, rgba(61, 120, 184, 0.8) 71.07%, rgba(141, 176, 214, 0.51) 100%),url(\'{$article_image}\'); ">
                <div class="article-card-row__item-title">
                    {$pagetitle}
                </div>
                <div class="article-card-row__item-intro">
                    {$introtext}
                </div>
                <a href="{$uri}" class="article-card-row__item-btn" style="border:none">
                    Читать
                </a>
            </div>'
            ]}
            {else}
            Пусто
            {/if}
        </div>

        {$_modx->getPlaceholder('page.nav')}
    </div>
</div>
{/block}