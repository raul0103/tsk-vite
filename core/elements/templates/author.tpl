{extends "file:layouts/default.layout.tpl"}

{block "page"}
<div class="wrapper">
    {include "file:blocks/breadcrumbs.tpl"}
</div>
<div class="wrapper author-page">
    {set $resource = $_modx->resource}
    {set $articles = '!pdoResources' | snippet : [
    'limit' => 0
    'parents' => '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'stati']
    'includeTVs'=>'article_author_id,page_views,article_tags'
    'tvPrefix' => ''
    'where' => ('{"article_author_id":'~$resource.id~' }'),
    'tpl' => '@INLINE <p>{$pagetitle}</p>'
    'return' => 'json'
    ]}
    {set $articles = $articles | json_decode : true}
    <div class="author-page__section">
        <div class="author-page__section__main">
            <div class="author-page__section__main-image" style="background-image: url('{$resource.author_image}');">
            </div>

            <div class="author-page__section__main-info">
                <div class="author-page__section__main-top">
                    <h1 class="author-page__section__main-pagetitle">{$resource.pagetitle}</h1>
                    <div class="author-page__section__main-badge">{$articles | length | declension :
                        'статья|статьи|статей' : true}</div>
                </div>

                <div class="author-page__section__main-fields">
                    {foreach $resource.author_fields | json_decode : true as $field}
                    <div class="author-page__section__main-field">
                        {$field['title']}: {$field['value']}
                    </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    <div class="author-page__section">
        <div class="author-page__section-title">Об авторе</div>
        <div class="author-page__section-content">{$resource.content}</div>
    </div>
    {if $articles}
    <div class="author-page__section">
        <div class="author-page__section-title">Статьи автора</div>
        <div class="author-page__section-content">
            <div class="article-items">
                {foreach $articles as $article}
                <div class="article-items__item">
                    <div class="article-items__item-header">
                        <div class="article-items__item-title"><a href="{$article['uri']}">{$article['pagetitle']}</a>
                        </div>
                        <button class="article__favorite" data-article-favorite
                            data-article-id="{$article['id']}">
                            <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                                <use fill="none" xlink:href="/assets/template/img/svg-sprite.svg#icon-heart"></use>
                            </svg>
                        </button>
                    </div>
                    {if $article['article_tags']}
                    <div class="article-items__item-tags">
                        {foreach $article['article_tags'] | split : ',' as $tag}
                        <a class="article-items__item-tag" href="/stati/?tag={$tag}">#{$tag}</a>
                        {/foreach}
                    </div>
                    {/if}
                    <div class="article-items__item-bottom">
                        <div class="article-items__item-bottom-left">
                            <div class="article-items__item-date article-icon-block">
                                <svg xmlns="http://www.w3.org/2000/svg" width="800px" height="800px" viewBox="0 0 24 24"
                                    fill="none">
                                    <path
                                        d="M3 9H21M7 3V5M17 3V5M6 12H8M11 12H13M16 12H18M6 15H8M11 15H13M16 15H18M6 18H8M11 18H13M16 18H18M6.2 21H17.8C18.9201 21 19.4802 21 19.908 20.782C20.2843 20.5903 20.5903 20.2843 20.782 19.908C21 19.4802 21 18.9201 21 17.8V8.2C21 7.07989 21 6.51984 20.782 6.09202C20.5903 5.71569 20.2843 5.40973 19.908 5.21799C19.4802 5 18.9201 5 17.8 5H6.2C5.0799 5 4.51984 5 4.09202 5.21799C3.71569 5.40973 3.40973 5.71569 3.21799 6.09202C3 6.51984 3 7.07989 3 8.2V17.8C3 18.9201 3 19.4802 3.21799 19.908C3.40973 20.2843 3.71569 20.5903 4.09202 20.782C4.51984 21 5.07989 21 6.2 21Z"
                                        stroke="#777" stroke-width="2" stroke-linecap="round" />
                                </svg>
                                {$article['publishedon'] | date : 'd.m.Y'}
                            </div>
                            <div class="article-items__item-views article-icon-block">
                                <svg xmlns="http://www.w3.org/2000/svg" width="800px" height="800px" viewBox="0 0 24 24"
                                    fill="none">
                                    <path
                                        d="M15.0007 12C15.0007 13.6569 13.6576 15 12.0007 15C10.3439 15 9.00073 13.6569 9.00073 12C9.00073 10.3431 10.3439 9 12.0007 9C13.6576 9 15.0007 10.3431 15.0007 12Z"
                                        stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    <path
                                        d="M12.0012 5C7.52354 5 3.73326 7.94288 2.45898 12C3.73324 16.0571 7.52354 19 12.0012 19C16.4788 19 20.2691 16.0571 21.5434 12C20.2691 7.94291 16.4788 5 12.0012 5Z"
                                        stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                                {$article['page_views'] ?: 0}
                            </div>
                        </div>
                        <div class="article-items__item-rating article-icon-block">
                            <svg xmlns="http://www.w3.org/2000/svg" width="800px" height="800px" viewBox="0 0 24 24"
                                fill="none">
                                <path
                                    d="M11.2691 4.41115C11.5006 3.89177 11.6164 3.63208 11.7776 3.55211C11.9176 3.48263 12.082 3.48263 12.222 3.55211C12.3832 3.63208 12.499 3.89177 12.7305 4.41115L14.5745 8.54808C14.643 8.70162 14.6772 8.77839 14.7302 8.83718C14.777 8.8892 14.8343 8.93081 14.8982 8.95929C14.9705 8.99149 15.0541 9.00031 15.2213 9.01795L19.7256 9.49336C20.2911 9.55304 20.5738 9.58288 20.6997 9.71147C20.809 9.82316 20.8598 9.97956 20.837 10.1342C20.8108 10.3122 20.5996 10.5025 20.1772 10.8832L16.8125 13.9154C16.6877 14.0279 16.6252 14.0842 16.5857 14.1527C16.5507 14.2134 16.5288 14.2807 16.5215 14.3503C16.5132 14.429 16.5306 14.5112 16.5655 14.6757L17.5053 19.1064C17.6233 19.6627 17.6823 19.9408 17.5989 20.1002C17.5264 20.2388 17.3934 20.3354 17.2393 20.3615C17.0619 20.3915 16.8156 20.2495 16.323 19.9654L12.3995 17.7024C12.2539 17.6184 12.1811 17.5765 12.1037 17.56C12.0352 17.5455 11.9644 17.5455 11.8959 17.56C11.8185 17.5765 11.7457 17.6184 11.6001 17.7024L7.67662 19.9654C7.18404 20.2495 6.93775 20.3915 6.76034 20.3615C6.60623 20.3354 6.47319 20.2388 6.40075 20.1002C6.31736 19.9408 6.37635 19.6627 6.49434 19.1064L7.4341 14.6757C7.46898 14.5112 7.48642 14.429 7.47814 14.3503C7.47081 14.2807 7.44894 14.2134 7.41394 14.1527C7.37439 14.0842 7.31195 14.0279 7.18708 13.9154L3.82246 10.8832C3.40005 10.5025 3.18884 10.3122 3.16258 10.1342C3.13978 9.97956 3.19059 9.82316 3.29993 9.71147C3.42581 9.58288 3.70856 9.55304 4.27406 9.49336L8.77835 9.01795C8.94553 9.00031 9.02911 8.99149 9.10139 8.95929C9.16534 8.93081 9.2226 8.8892 9.26946 8.83718C9.32241 8.77839 9.35663 8.70162 9.42508 8.54808L11.2691 4.41115Z"
                                    stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                            5.0
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>

        </div>
    </div>
    {/if}
</div>
{/block}