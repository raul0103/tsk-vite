
<item turbo="true">
    <link>{$_modx->makeUrl($id, "", "", "full")}</link>
    <author>{$article_author ?: 'Автор'}</author>
    <pubDate>{'' | date : 'Y-m-d 01:00:00'}</pubDate>
    <turbo:content>
        <![CDATA[
            <header>
                <h1>{$pagetitle}</h1>
                <figure>
                    <img src="/{$article_image ?: 'assets/images/no_image.jpg'}" />
                </figure>
                <menu>
                    {'!pdoMenu' | snippet : [
                    'parents' => $articles_id
                    'tplOuter' => '@INLINE {$wrapper}'
                    'tpl' => '@INLINE <a href="{$link}">{$menutitle}</a>'
                    ]}
                </menu>
            </header>
            <div itemscope itemtype="http://schema.org/Rating">
                <meta itemprop="ratingValue" content="5">
                <meta itemprop="bestRating" content="5">
            </div>
            <div>
                {$introtext}
            </div>
            <div>
                {$content | replace: 'src="assets' : 'src="/assets'}
            </div>
            {if $article_read_also}
            <div data-block="feed" data-layout="vertical" data-title="Читать так же">
                {'!pdoResources' | snippet : [
                'parents' => $articles_id
                'resources' => $article_read_also
                'tvPrefix' => ''
                'includeTVs' => 'article_image'
                'tpl'=> '@INLINE 
                <div data-block="feed-item"
                    data-title="{$longtitle}"
                    data-description="{$description}"
                    data-href="{$_modx->makeUrl($id, "", "", "full")}"
                    data-thumb="/{$article_image}"
                    data-thumb-position="left"
                    data-thumb-ratio="4x3">
                </div>
                '
                ]}
            </div>
            {/if}
            <div data-block="share" data-network="facebook, odnoklassniki, telegram, twitter, vkontakte"></div>
        ]]>
    </turbo:content>
</item>