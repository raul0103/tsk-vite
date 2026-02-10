{if $_modx->resource.context_key == 'fasad'}
    {* Получение характеристик товара в формате json за исключенимем цвет*}
{*    {set $optionProduct = '!msProductOptions' | snippet : [*}
{*    'tpl' => '@FILE chunks/charecter-json.tpl',*}
{*    'onlyOptions' => 'proizvoditel,cvet,item_thickness,pokrytie'*}
{*    ]}*}


{*    {set $idsSimillarProduct =  $_modx->runSnippet("@FILE snippets/product/similarProductIdsFromOptions.php",*}
{*    ["jsonParams" => $optionProduct, 'returnString' => true, 'ignoreId' => $_modx->resource.id])}*}

    {set $optionProduct = '@FILE snippets/simillarFasad.php' | snippet : [    ]}

    {if $optionProduct}
        {'msProducts' | snippet : [
        'resources' => implode(",", $optionProduct),
        'parents' => 0,
        'depth' => 50,
        'limit' => 20,
        'tpl' => '@FILE sections/popular/pop-slide.tpl',
        'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
        'tplWrapper' => '@FILE sections/popular/sect-similar-wrapper.tpl',
        'wrapIfEmpty' => 0
        ]}
    {/if}


    {set $parent = null}

        {if $_modx->resource.parent in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => 34819]) }
            {set $parent = 29293}
        {elseif $_modx->resource.parent in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => 36783])}
            {set $parent = 100744}
        {elseif  $_modx->resource.parent in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => 36784])}
            {set $parent = 100746}
        {/if}

        {if $parent}
            {set $similarProducts = $_modx->runSnippet("msProductsMy", [
                'parents' => $parent,
                'depth' => 50,
                'optionFilters' => '{"cvet":"'~$_modx->resource.cvet[0]~'", "tip": "Комплектующие"}',
                'returnIds' => 1
            ])}
            {if $similarProducts != ''}
                {'msProductsMy' | snippet : [
                'resources' => $similarProducts,
                'parents' => $parent,
                'depth' => 50,
                'limit' => 42,
                'tpl' => '@FILE sections/popular/pop-slide.tpl',
                'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
                'tplWrapper' => '@FILE sections/popular/sect-similar-wrapper.tpl',
                'wrapIfEmpty' => 0
                ]}
                {else}
                {'msProducts' | snippet : [
                'parents' => $parent,
                'sortby' => 'RAND()',
                'depth' => 50,
                'limit' => 8,
                'tpl' => '@FILE sections/popular/pop-slide.tpl',
                'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
                'tplWrapper' => '@FILE sections/popular/sect-similar-wrapper.tpl',
                'wrapIfEmpty' => 0
            ]}
            {/if}
        {/if}
  {elseif $_modx->resource.context_key == 'gazobeton'}
      {'msProductsMy' | snippet : [
      'parents' => 133676,
      'depth' => 50,
      'tpl' => '@FILE sections/popular/pop-slide.tpl',
      'tplWrapper' => '@FILE sections/popular/sect-similar-wrapper.tpl',
      'wrapIfEmpty' => 0
      ]}
  {else}
      {set $params = [
        'resources' => $resources,
      ]}
      {if $_modx->context.key == 'krovlya'}
        {set $params['tpl'] = '@FILE sections/category/listing-products-item.tpl'}
      {/if}
      {'@FILE snippets/getPopularProductsClass.php' | snippet : $params}
  {/if}


{if $_modx->resource.context_key in list ['web', 'rockwool', 'tn', 'penoplex', 'isover', 'paroc', 'ursa', 'isorok']}
  {'@FILE snippets/getSimilarProducts.php' | snippet}

{*Виниловый сайдинг 36783*}
{elseif $_modx->resource.parent in list [95979,95978,95977,76482,76483,76484,76492,76493,76494,76495,76496,76497,76498,76499,76481,76480,76478,36786,36787,36788,74115,74117,74118,74120,74122,74274,74275,74277,74279,74281,36785,36783]}
  {'msProductsMy' | snippet : [
    'resources' => '-' ~ $_modx->resource.id,
    'parents' => 36783,
    'depth' => 50,
    'limit' => 42,
    'tpl' => '@FILE sections/popular/pop-slide.tpl',
    'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
    'tplWrapper' => '@FILE sections/popular/sect-similar-wrapper.tpl',
    'optionFilters' => '{"factura":"'~$_modx->resource.factura[0]~'","cvet":"'~$_modx->resource.cvet[0]~'"}',
    'wrapIfEmpty' => 0
  ]}
{elseif $_modx->resource.context_key == 'krovlya' || $_modx->resource.parent in list [16805, 36871]}
  {'msProductsMy' | snippet : [
    'resources' => '-' ~ $prodId,
    'parents' => 16786,
    'depth' => 50,
    'limit' => 42,
    'tpl' => '@FILE sections/popular/pop-slide.tpl',
    'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
    'tplWrapper' => '@FILE sections/popular/sect-pop-wrapper.tpl',
    'optionFilters' => '{"cvet":"'~$_modx->resource.cvet[0]~'"}',
    'wrapIfEmpty' => 0
  ]}
{/if}
