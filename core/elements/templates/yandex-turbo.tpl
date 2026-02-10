{set $articles_id = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'stati']}

<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:yandex="http://news.yandex.ru"
     xmlns:media="http://search.yahoo.com/mrss/"
     xmlns:turbo="http://turbo.yandex.ru"
     version="2.0">
    
    <title>{$articles_id|resource:'longtitle'}</title>
    <link>{$_modx->makeUrl($articles_id, "", "", "full")}</link>
    <description>{$articles_id|resource:'description'}</description>
    <language>ru</language>
    
    <channel>
        {'!pdoResources' | snippet : [
        'parents' => $articles_id
        'tvPrefix' => ''
        'includeContent' => 1
        'includeTVs' => 'article_author,article_image,article_read_also'
        'tpl' => '@FILE chunks/yandex-turbo.tpl'
        'limit' => 0
        'articles_id' => $articles_id
        ]}
    </channel>
</rss>