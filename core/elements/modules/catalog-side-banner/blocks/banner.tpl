{set $show_carousel = $_modx->resource.id not in list $_modx->runSnippet('@FILE snippets/getCategoriesListIds.php', [
  'parent' => '56941, 15436, 81059, 58555, 18853'
])}
{set $idsin86214 = $_modx->resource.id in list $_modx->runSnippet('@FILE snippets/getCategoriesListIds.php', [
'parent' => '86214'
])}
{set $rid = $_modx->resource.id|int}
{if ($rid in [81051,26581,105469,86214]) or ($idsin86214)}
<script>
  window.show_catalog_side_carousel = true; //Это для инициализации слайдера на фронтенде
</script>
{insert 'file:modules/catalog-side-banner/inner-blocks/carousel2.tpl'}
{else}

  {if $show_carousel}
    <script>
      window.show_catalog_side_carousel = true; //Это для инициализации слайдера на фронтенде
    </script>
    {insert 'file:modules/catalog-side-banner/inner-blocks/carousel.tpl'}
  {else}
    {insert 'file:modules/catalog-side-banner/inner-blocks/blueprint.tpl'}
  {/if}
{/if}
