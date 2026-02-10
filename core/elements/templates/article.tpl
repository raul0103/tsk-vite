{extends "file:layouts/default.layout.tpl"}

{block 'title'}
{include "file:elements/product/meta-title.tpl"}
{/block}
{block 'description'}
{include "file:elements/product/meta-description.tpl"}
{/block}

{block "page"}

{if $_modx->resource.context_key in list ['plitaosb', 'web', 'rockwool', 'tn', 'paroc', 'penoplex',
'ursa', 'isover', 'fasady-pro', 'pro-fanera', 'fasad', 'policarbonat', 'isorok', 'drova', 'ugol',
'umatex', 'brikety', 'pellety']}
    {set $logosrc = '/assets/template/img/logos/'~$site_context~'.png'}
{else}
    {set $logosrc = '/assets/template/img/logos/'~$site_context~'.svg'}
{/if}


{'@FILE snippets/pageViews.php' | snippet}

<div class="wrapper">
    {include "file:blocks/breadcrumbs.tpl"}
</div>
<div class="wrapper sect-inner article" itemscope="" itemtype="http://schema.org/BlogPosting">
    <div itemprop="publisher" itemscope="" itemtype="https://schema.org/Organization">
        <div itemprop="logo" itemscope="" itemtype="https://schema.org/ImageObject">
            <img style="display:none;" itemprop="url" src="{$logosrc}">
            <meta itemprop="width" content="222">
            <meta itemprop="height" content="70">
        </div>
        <meta itemprop="telephone" content="{$_pls['+phone']}">
        <meta itemprop="address" content="Россия">
        <meta itemprop="name" content="{'site_name' | option}">
        <meta itemprop="url" content="{'site_url' | option}">
        <meta itemprop="image" content="{$logosrc}">
    </div>
    <link itemprop="mainEntityOfPage" itemscope itemType="https://schema.org/WebPage"
        itemid="{'site_url' | option}{$_modx->resource.id | url}">
    <div class="article__info">
        <div class="article__info-left">
            <div class="article__info-item" itemprop="datePublished" title="Дата публикации">
                <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="none">
                    <path
                        d="M3 9H21M7 3V5M17 3V5M6 12H8M11 12H13M16 12H18M6 15H8M11 15H13M16 15H18M6 18H8M11 18H13M16 18H18M6.2 21H17.8C18.9201 21 19.4802 21 19.908 20.782C20.2843 20.5903 20.5903 20.2843 20.782 19.908C21 19.4802 21 18.9201 21 17.8V8.2C21 7.07989 21 6.51984 20.782 6.09202C20.5903 5.71569 20.2843 5.40973 19.908 5.21799C19.4802 5 18.9201 5 17.8 5H6.2C5.0799 5 4.51984 5 4.09202 5.21799C3.71569 5.40973 3.40973 5.71569 3.21799 6.09202C3 6.51984 3 7.07989 3 8.2V17.8C3 18.9201 3 19.4802 3.21799 19.908C3.40973 20.2843 3.71569 20.5903 4.09202 20.782C4.51984 21 5.07989 21 6.2 21Z"
                        stroke="#777" stroke-width="2" stroke-linecap="round"></path>
                </svg>
                {$_modx->resource['createdon']}
            </div>
            <meta itemprop="dateModified" content="{$_modx->resource['createdon']}">

            <div class="article__info-item" title="Количество просмотров">
                <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="none">
                    <path
                        d="M15.0007 12C15.0007 13.6569 13.6576 15 12.0007 15C10.3439 15 9.00073 13.6569 9.00073 12C9.00073 10.3431 10.3439 9 12.0007 9C13.6576 9 15.0007 10.3431 15.0007 12Z"
                        stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                    <path
                        d="M12.0012 5C7.52354 5 3.73326 7.94288 2.45898 12C3.73324 16.0571 7.52354 19 12.0012 19C16.4788 19 20.2691 16.0571 21.5434 12C20.2691 7.94291 16.4788 5 12.0012 5Z"
                        stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
                {$_modx->resource.page_views}
            </div>

            <div class="article__info-item" title="Время на чтение">
                <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24" fill="none">
                    <path
                        d="M12 7V12L9.5 13.5M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z"
                        stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /> </svg>
                {'@FILE snippets/articleReadTime.php' | snippet : [
                'content' => $_modx->resource.content
                ] | declension : 'минута|минуты|минут' : true }
            </div>
        </div>
        <div class="article__info-right">
{*
    <div class="article__info-rating" itemprop="aggregateRating" itemscope
    itemtype="http://schema.org/AggregateRating">
    <div class="article__info-rating-stars five">
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="/assets/template/img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="/assets/template/img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="/assets/template/img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="/assets/template/img/svg-sprite.svg#icon-star"></use>
        </svg>
        <svg class="svg icon-star" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
            <use xlink:href="/assets/template/img/svg-sprite.svg#icon-star"></use>
        </svg>
    </div>
    <span itemprop="ratingValue">5.0</span>
    <meta itemprop="ratingCount" content="145">
    <meta itemprop="worstRating" content="1.0">
    <meta itemprop="bestRating" content="5.0">

</div>
    *}
            <button class="article__favorite" data-article-favorite data-article-id="{$_modx->resource.id}">
                <svg class="svg icon-heart" xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                    <use fill="none" xlink:href="/assets/template/img/svg-sprite.svg#icon-heart"></use>
                </svg>
            </button>
            <button data-article-id="{$_modx->resource.id}" data-article-like class="article__like">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"
                    height="20px" width="20px" version="1.1" id="Capa_1" viewBox="0 0 486.926 486.926"
                    xml:space="preserve">
                    <g>
                        <path
                            d="M462.8,181.564c-12.3-10.5-27.7-16.2-43.3-16.2h-15.8h-56.9h-32.4v-75.9c0-31.9-9.3-54.9-27.7-68.4   c-29.1-21.4-69.2-9.2-70.9-8.6c-5,1.6-8.4,6.2-8.4,11.4v84.9c0,27.7-13.2,51.2-39.3,69.9c-19.5,14-39.4,20.1-41.5,20.8l-2.9,0.7   c-4.3-7.3-12.2-12.2-21.3-12.2H24.7c-13.6,0-24.7,11.1-24.7,24.7v228.4c0,13.6,11.1,24.7,24.7,24.7h77.9c7.6,0,14.5-3.5,19-8.9   c12.5,13.3,30.2,21.6,49.4,21.6h65.9h6.8h135.1c45.9,0,75.2-24,80.4-66l26.9-166.9C489.8,221.564,480.9,196.964,462.8,181.564z    M103.2,441.064c0,0.4-0.3,0.7-0.7,0.7H24.7c-0.4,0-0.7-0.3-0.7-0.7v-228.4c0-0.4,0.3-0.7,0.7-0.7h77.9c0.4,0,0.7,0.3,0.7,0.7   v228.4H103.2z M462.2,241.764l-26.8,167.2c0,0.1,0,0.3-0.1,0.5c-3.7,29.9-22.7,45.1-56.6,45.1H243.6h-6.8h-65.9   c-21.3,0-39.8-15.9-43.1-36.9c-0.1-0.7-0.3-1.4-0.5-2.1v-191.6l5.2-1.2c0.2,0,0.3-0.1,0.5-0.1c1-0.3,24.7-7,48.6-24   c32.7-23.2,49.9-54.3,49.9-89.9v-75.3c10.4-1.7,28.2-2.6,41.1,7c11.8,8.7,17.8,25.2,17.8,49v87.8c0,6.6,5.4,12,12,12h44.4h56.9   h15.8c9.9,0,19.8,3.7,27.7,10.5C459,209.864,464.8,225.964,462.2,241.764z" />
                    </g>
                </svg>
                <span data-article-like-count>{$_modx->resource.article_likes}</span></button>
        </div>
    </div>

    {if $_modx->resource.article_author_id && $_modx->resource.article_author_id !== 'null'}
    {set $article_author = '!pdoResources' | snippet : [
    'parents' => 0
    'resources' => $_modx->resource.article_author_id
    'includeTVs' => 'author_image'
    'tvPrefix' => ''
    'tpl' => '@INLINE
    <a href="{$uri}" class="article__author" itemscope="" itemtype="http://schema.org/Person">
        <div class="article__author-image" style="background-image: url(\'{$author_image}\');"></div>
        <div class="article__author-name" itemprop="name" style=" font-size: 12px; ">
            {$pagetitle}
        </div>
    </a>
    '
    ]}
    {else}
    {set $article_author = '
    <div class="article__author" itemscope="" itemtype="http://schema.org/Person">
        <span itemprop="name" style=" font-size: 12px; ">{$_modx->resource["article_author"]}</span>
    </div>
    '}
    {/if}

    {$article_author}

    <article itemprop="articleBody">
        <h1 class="title-1" itemprop="headline">{$_modx->resource.pagetitle}</h1>

        {if $_modx->resource.article_image}
        <div class="article-image-container" itemprop="image" itemscope="" itemtype="https://schema.org/ImageObject">
            <meta itemprop="name" content="{$_modx->resource.pagetitle}">
            <img class="article-image" src="{$_modx->resource.article_image}" itemprop="contentUrl">
        </div>
        {/if}

        <div class="content-block">


            <p>{$_modx->resource.introtext}</p>

            {'@FILE snippets/generateArticleContent.php' | snippet : [
            'content' => $_modx->resource['content']
            ]}
            <a href="/stati" class="article-back">Вернуться в раздел статьи</a>

            <div class="article__social-sharing">
                <script type="text/javascript">
                    function setOnclick(a) {
                        a.setAttribute("onclick",
                            "popupWin = window.open(this.href,'contacts','toolbar=0,status=0,width=626,height=436'); popupWin.focus(); return false"
                        );
                    }

                    function externalLinks() {
                        var links = document.getElementsByTagName("a");
                        for (i = 0; i < links.length; i++) {
                            if (links[i].getAttribute("href") && links[i].getAttribute("rel") == "nofollow") {
                                setOnclick(links[i])
                            }
                        }
                    }
                    window.onload = externalLinks;
                </script>

                <div class="article__social-sharing__title">Поделиться статьёй в социальных сетях:</div>

                <!-- ВКонтакте  -->
                <a title="Поделиться статьей в Вконтакте"
                    href="http://vk.com/share.php?url={$_modx->config['site_url']}{$_modx->resource.id | url}&title={$_modx->resource.longtitle}&description={$_modx->resource.description}&image={$_modx->config.site_url}{$_modx->resource.image}&noparse=true"
                    onclick="return Share.me(this);" rel="nofollow">
                    <img style="width:60px" src="/assets/template/img/socialsharingicon/VK.png"></a>

                <!-- Одноклассники  -->
                <a title="Поделиться статьей в Одноклассники"
                    href="https://connect.ok.ru/offer?url={$_modx->config['site_url']}{$_modx->resource.id | url}&title={$_modx->resource.longtitle}&imageUrl={$_modx->config.site_url}{$_modx->resource.image}"
                    rel="nofollow">
                    <img style="width:60px" src="/assets/template/img/socialsharingicon/Ok.png"></a>

                <!-- Twitter  -->
                <a title="Поделиться статьей в Twitter"
                    href="https://twitter.com/intent/tweet?original_referer=http%3A%2F%2Ffiddle.jshell.net%2F_display%2F&text={$_modx->resource.longtitle}&url={$_modx->config['site_url']}{$_modx->resource.id | url}"
                    rel="nofollow">
                    <img style="width:60px" src="/assets/template/img/socialsharingicon/Twitter.png"></a>

                <!-- Telegram  -->
                <a title="Поделиться статьей в Telegram"
                    href="https://telegram.me/share/url?url={$_modx->config['site_url']}{$_modx->resource.id | url}&text={$_modx->resource.longtitle}"
                    rel="nofollow">
                    <img style="width:60px" src="/assets/template/img/socialsharingicon/Telegram.png"></a>
            </div>

            {if $_modx->resource['article_read_also']}
            <div class="article-also">
                <h2 class="article-also__title">Читайте также</h2>
                <div class="article-card-row">
                    {'pdoResources' | snippet : [
                    'context_key' => $_modx->context.key,
                    'parents' => 0,
                    'resources' => $_modx->resource['article_read_also'],
                    'includeTVs' => 'article_image',
                    'tvPrefix' => '',
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
                </div>
            </div>
            {/if}
        </div>
    </article>


    <div class="comments-block">
        <div class="comment-block__header">
            <h2 class="sect-pop__title title-2">Комментарии</h2>
            <div class="comments-block__header-info">
                <div class="comments-block__header-info-item">
                    Напишите свое мнение или вопросы по статье, вам ответит ее автор
                </div>
                {*
                <div class="comments-block__header-info-item">
                    {$article_author}
                </div>
                *}
            </div>

        </div>
        {'!TicketComments' | snippet: [
        'customValidators' => 'mycaptcha'
        'validate' => 'name:required, text:required, g-recaptcha-response:mycaptcha'
        'requiredFields' => 'text,name'
        'enableCaptcha' => 0
        'allowGuest'=>1
        'autoPublishGuest' => 0
        'formBefore' => 1
        ]}
    </div>


    {set $queries_id = $_modx->resource.article_queries_id}

    {if $queries_id !== '-'}
    <section class="questions">
        <div class="wrapper">
            <h2 class="title-2 questions__title">Ответы на популярные вопросы</h2>
            <div class="questions__list" itemscope="" itemtype="https://schema.org/FAQPage">
                <div class="questions__list-visible">

                    {'jsonBlocks' | snippet : ['ids'=> $queries_id, 'tpl' => '@INLINE
                    {foreach $items as $item}
                    <div class="questions__item" itemscope="" itemprop="mainEntity"
                        itemtype="https://schema.org/Question">
                        <div class="questions__item-top">
                            <span itemprop="name">{$item["query"]}</span>
                            <svg class="svg icon-arrow" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                                <use xlink:href="{$_modx->config[" template_path"]}img/svg-sprite.svg#icon-arrow">
                                    </use> </svg> </div> <div class="questions__item-content" itemprop="acceptedAnswer"
                                    itemscope="" itemtype="https://schema.org/Answer">
                                    <meta itemprop="upvoteCount" content="1">
                                    <div itemprop="text" class="content-block">
                                        {$item["answer"]}
                                    </div>
                        </div>
                    </div>
                    {/foreach}
                    ']}


                </div>
            </div>
        </div>
    </section>
    {/if}

</div>


{/block}