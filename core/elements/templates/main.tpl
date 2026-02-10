{extends "file:layouts/default.layout.tpl"}

{block 'schema'}
    {set $idCat = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'catalog']}

    {* Отзывы *}
    {set $reviews = 'getSchemaReview' | snippet : ['idCat' => $idCat]}

    {* Минимальные / максимальные значения и общее количество товаров *}
    {*'@FILE snippets/msSchemaTools/msGetProductsCount.php' | snippet : ['ids' => $idCat]*}
    {*'@FILE snippets/msSchemaTools/msGetProductsMinMaxPrice.php' | snippet : ['ids' => $idCat]*}

    {* Микроразметка *}
    <script type="application/ld+json">
    {if $_modx->resource.menutitle?}
        {set $name = $_modx->resource.menutitle}
    {else}
        {set $name = $_modx->resource.pagetitle}
    {/if}
    {
        "@context": "https://schema.org/",
        "@type": "Product",
        "name": "{$name}",
        "image": "{$_modx->config.site_url ~ 'assets/template/img/favicons/' ~ $site_context ~ '/apple-touch-icon.png'}",
        "description": "{$_modx->resource.description}",
        "brand": "{$brand}",
        {if $reviews ?}
        "review": {
            "@type": "Review",
            "author": "{$reviews['review']['author']}",
            "datePublished": "{$reviews['review']['date']}",
            "name": "{$reviews['reviewName']}",
            "reviewBody": "{$reviews['review']['text']}",
            "reviewRating": {
                "@type": "Rating",
                "ratingValue": "{$reviews['review']['value']}"
            }
        },
        {/if}
        
        {* @return - "offers","aggregateRating" *}
        {'@FILE snippets/getSchemaDataByContext.php' | snippet}

        {*
        "offers": {
            "@type": "AggregateOffer",
            "lowPrice": "{$_modx->getPlaceholder('min_price')}",
            "highPrice": "{$_modx->getPlaceholder('max_price')}",
            "offerCount": "{$_modx->getPlaceholder('total_count')}",
            "priceCurrency": "RUB"
        },
        {if $reviews ?}
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "{$reviews['ratingValue']}",
            "ratingCount": "{$reviews['ratingCount']}",
            "reviewCount": "{$reviews['reviewCount']}"
        }
        {/if} *}
    }
    </script>
{/block}

{block "page"}
    <div class="wrapper">
        {include "file:blocks/topbar-search.tpl"}
    </div>

    {if $_modx->resource.context_key in list ['kirpich-m']}
      {include "file:sections/main/banner-slider.tpl"}
    {elseif $_modx->resource.context_key in list ['policarbonat']}
        {include "file:sections/main/banner-slider-policarbonat.tpl"}
    {elseif $_modx->resource.context_key in list ['gazobeton']}
        {include "file:modules/banner-double/chunks/wrapper.tpl"}
    {elseif $_modx->resource.context_key in list ['krovlya']}
        {include "file:_moduls/main_banner/v2/main_banner.tpl"}
    {elseif $_modx->resource.context_key in list ['rockwool']}
        {include "file:_moduls/main_banner/v2/uteplitel/main_banner.tpl"}
    {elseif $_modx->resource.context_key in list ['fasad']}
      {include "file:sections/main/v1/banner.tpl"}
    {else}
      {include "file:sections/main/banner.tpl"}
    {/if}
    
    {if $_modx->resource.context_key == 'pro-fanera'}
        <div class="wrapper prods-links">
            <h1 class="title-1">Фанера по толщине</h1>
            <div class="prods-links__items-wrap">
              <a href="/fanera-3-mm/" class="prods-links__item">3 мм</a>
              <a href="/fanera-4-mm/" class="prods-links__item">4 мм</a>
              <a href="/fanera-5-mm/" class="prods-links__item">5 мм</a>
              <a href="/fanera-6-mm/" class="prods-links__item">6 мм</a>
              <a href="/fanera-6.5-mm/" class="prods-links__item">6.5 мм</a>
              <a href="/fanera-7-mm/" class="prods-links__item">7 мм</a>
              <a href="/fanera-8-mm/" class="prods-links__item">8 мм</a>
              <a href="/fanera-9-mm/" class="prods-links__item">9 мм</a>
              <a href="/fanera-10-mm/" class="prods-links__item">10 мм</a>
              <a href="/fanera-12-mm/" class="prods-links__item">12 мм</a>
              <a href="/fanera-15-mm/" class="prods-links__item">15 мм</a>
              <a href="/fanera-18-mm/" class="prods-links__item">18 мм</a>
              <a href="/fanera-20-mm/" class="prods-links__item">20 мм</a>
              <a href="/fanera-21-mm/" class="prods-links__item">21 мм</a>
              <a href="/fanera-24-mm/" class="prods-links__item">24 мм</a>
              <a href="/fanera-27-mm/" class="prods-links__item">27 мм</a>
              <a href="/fanera-30-mm/" class="prods-links__item">30 мм</a>
              <a href="/fanera-35-mm/" class="prods-links__item">35 мм</a>
              <a href="/fanera-40-mm/" class="prods-links__item">40 мм</a>
            </div>
        </div>

        <div class="wrapper section section_mb_60">
          <h1 class="title-1">Фанера по применению</h1>
          <div class="subbanner">
            <a href="/fanera-dlya-pola/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-pola.png" alt="">
              <p class="subbanner__text">Для пола</p>
            </a>
            <a href="/fanera-dlya-lodok/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-lodok.jpg" alt="">
              <p class="subbanner__text">Для лодок</p>
            </a>
            <a href="/fanera-dlya-opalubki/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-opalubki.jpg" alt="">
              <p class="subbanner__text">Для опалубки</p>
            </a>
            <a href="/fanera-dlya-lazernoj-rezki/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-lazernoj-rezki.jpg" alt="">
              <p class="subbanner__text">Для лазерной резки</p>
            </a>
            <a href="/fanera-dlya-mebeli/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-mebeli.jpg" alt="">
              <p class="subbanner__text">Для мебели</p>
            </a>
            <a href="/fanera-dlya-igrushek/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-igrushek.jpg" alt="">
              <p class="subbanner__text">Для игрушек</p>
            </a>
            <a href="/fanera-dlya-podelok/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-podelok.jpg" alt="">
              <p class="subbanner__text">Для поделок</p>
            </a>
            <a href="/fanera-dlya-potolka/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-potolka.jpg" alt="">
              <p class="subbanner__text">Для потолка</p>
            </a>
            <a href="/fanera-dlya-sten/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/template/img/subbanner/pro-fanera/fanera-dlya-sten.jpg" alt="">
              <p class="subbanner__text">Для стен</p>
            </a>
            <a href="/dlya-transporta/" class="subbanner__item">
              <img class="subbanner__item-img" src="/assets/images/products/124333/transportnaya-fanera-1.webp" alt="">
              <p class="subbanner__text">Для транспорта</p>
            </a>
          </div>
        </div>
    {/if}

    {if $_modx->resource.context_key not in list ['krovlya', 'kirpich-m', 'plity-mdvp', 'fasady-pro']}
        <div class="wrapper main-page-content">
            <h1 class="title-1">{$_modx->resource.pagetitle}</h1>

            {if $_modx->resource.introtext | length > 0}
                <div class="content-block">
                    {$_modx->resource.introtext}
                </div>
            {/if}
        </div>
    {/if}

    {if $_modx->resource.context_key in list ['policarbonat']}
      {include "file:sections/main/application-icons.tpl"}
    {/if}

    {if $_modx->resource.template === 25}
        {include "file:sections/main/listing.tpl" title="Цены на арматуру"}

        {if $_modx->resource.additionalContent ?}
            {include "file:sections/additional-content.tpl"}
        {/if}
    {/if}

    {if $_modx->resource.context_key not in list ['krovlya', 'kirpich-m', 'plity-mdvp', 'fasad', 'fasady-pro']}
      {include "file:sections/popular/sect-pop-main.tpl"}
    {/if}

    {if $_modx->resource.context_key == 'krovlya'}
        {include "file:sections/main/v1/assort.tpl"}
    {elseif $_modx->resource.context_key == 'kirpich-m'}
        {include "file:sections/main/v2/assort.tpl"}
    {else}
        {if $_modx->resource.context_key != 'pro-fanera'}
            {include "file:sections/main/catalog.tpl"}
        {/if}
    {/if}

    {if $_modx->resource.context_key in list ['krovlya', 'kirpich-m', 'plity-mdvp', 'fasad', 'fasady-pro']}
        {include "file:sections/popular/sect-pop-main.tpl"}
    {/if}

    {if $_modx->resource.context_key == 'krovlya'}
        {include "file:sections/category/simple-listing.tpl"}
    {/if}

    {include "file:sections/main/promo.tpl"}
    {if $_modx->resource.context_key not in list ['drova', 'pellety', 'brikety', 'ugol']}
        {include "file:sections/main/stocks.tpl"}
    {/if}
    {include "file:sections/certs.tpl"}
    {include "file:sections/faq.tpl"}
    {include "file:sections/payment.tpl"}
    {include "file:sections/appeal.tpl"}
    {include "file:sections/advantages.tpl"}

    {if $_modx->resource.context_key in list ['krovlya', 'kirpich-m', 'plity-mdvp', 'fasady-pro']}
      <div class="wrapper main-page-content">
        <h1 class="title-1">{$_modx->resource.pagetitle}</h1>

          {if $_modx->resource.introtext | length > 0}
            <div class="content-block">
                {$_modx->resource.introtext}
            </div>
          {/if}
      </div>
    {/if}
    {if $_modx->resource.content | length > 0}
        <div class="wrapper">
            <article class="content-block">
                {$_modx->resource.content}
            </article>
        </div>
    {/if}

    {include "file:sections/steps.tpl"}
    {include "file:sections/partners.tpl"}
    {include "file:sections/districts-map.tpl"}
{/block}
