{* === НАСТРОЙКИ === *}
{set $rid = $_modx->resource.id|int}
{set $assets_url = $_modx->config.assets_url}
{set $baseDir = 'template/img/banners-catalog'}    {* одна папка *}
{set $defaultPattern = '%v%.webp'}          {* дефолт, если не нашли совпадение *}
{set $variants = ['v1','v2']}
{set $has86214 = $_modx->resource.id in list $_modx->runSnippet('@FILE snippets/getCategoriesListIds.php', [
'parent' => '86214'
])}

{set $ids86214Raw = $_modx->runSnippet('@FILE snippets/getCategoriesListIds.php', ['parent' => '86214']) ?: []}
{set $ids86214 = []}
{foreach $ids86214Raw as $i}{set $ids86214[] = $i|int}{/foreach}

{* Базовые списки ID из ТЗ *}
{set $ids_v1_1 = [105469,144840,144842,144841,144839,144838]}
{set $ids_v1_2 = [26581]}
{set $ids_v1_3 = [81051]}
{set $ids_v1_4 = $ids86214}

{set $ids_v2_1 = [105469,144840,144842,144841,144839,144838]}
{foreach $ids86214 as $x}{set $ids_v2_1[] = $x}{/foreach}   {* добавили 86214 и потомков *}
{set $ids_v2_2 = [26581]}

{* === Карта "вариант → файл → список ID" (в одной папке) === *}
{set $map = [
  'v1' => [
    'v1_1.svg' => $ids_v1_1,
    'v1_2.svg' => $ids_v1_2,
    'v1_3.svg' => $ids_v1_3,
    'v1_4.svg' => $ids_v1_4,
  ],
  'v2' => [
    'v2_1.svg' => $ids_v2_1,
    'v2_2.svg' => $ids_v2_2,
  ],
]}

{* === Готовим ссылки для всех вариантов (без {function}) === *}
{set $urls = []}
{foreach $variants as $v}
  {set $picked = ''}        {* итоговый файл для варианта *}
  {set $found = 0}          {* флаг, чтобы не нужен был break *}

  {foreach $map[$v] as $fname => $ids}
  {if $found == 0}
    {if $rid in $ids}
      {set $picked = $fname}
      {set $found = 1}
    {/if}
  {/if}
{/foreach}

{if $picked == ''}
  {set $picked = str_replace('%v%', $v, $defaultPattern)}
{/if}

  {set $urls = $urls + [
    $v => [
      'file' => $picked,
      'url'  => $assets_url ~ $baseDir ~ '/' ~ $picked
    ]
  ]}
{/foreach}

{* === Логика белой кнопки (по ID и/или по имени файла) === *}
{set $whiteIds = [81051,26581,86214]}

{set $white =
  ($rid in $whiteIds)
  or $has86214
}

{* === ВЫВОД === *}
<article class="catalog-side-carousel">
  <div class="swiper">
    <div class="swiper-wrapper">
      {if $urls.v1?}
      <!-- slide v1 -> {$urls.v1.file} -->
      <div class="swiper-slide">
        <div class="catalog-side-carousel__banner" style="background-image:url('{$urls.v1.url}')">
          <a href="#" data-fancybox data-src="#header-callback"
             class="catalog-side-carousel__button {if $white}catalog-side-carousel__button_white{/if}">
            Заказать
          </a>
        </div>
      </div>
      {/if}

      {if $urls.v2?}
      <!-- slide v2 -> {$urls.v2.file} -->
      <div class="swiper-slide">
        <div class="catalog-side-carousel__banner" style="background-image:url('{$urls.v2.url}')">
          <a href="#" data-fancybox data-src="#header-callback"
             class="catalog-side-carousel__button">
            Заказать
          </a>
        </div>
      </div>
      {/if}
    </div>

    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>
</article>
