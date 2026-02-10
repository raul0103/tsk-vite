<section class="catalog">
    <div class="wrapper">
        <h2 class="title-2">Наш ассортимент</h2>
        <div class="catalog__cards">
            {set $params = [
              'tpl' => '@FILE chunks/catalogCard.tpl',
              'depth' => 0,
              'limit' => 0,
              'includeTVs' => 'mainImage',
              'sortby' => 'menuindex',
              'sortdir' => 'ASC',
              'parents' => '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'catalog'],
              'select' => 'menutitle,uri,id,class_key'
            ]}


            {if $_modx->resource.context_key == 'proflist'}
                {set $params['resources'] = '144860,144861,146954,148085,146979,146974,146975,146966,146968,146973'}
            {/if}

            {if $_modx->resource.context_key == 'armatura-178'}
                {set $params['where'] = '{"hidemenu:=": 0}'}
            {/if}

            {if $_modx->resource.context_key == 'krovlya'}
                {set $params['resources'] = '-56941'}
            {/if}

            {if $_modx->resource.context_key == 'gazobeton'}
                {set $params['resources'] = '133204, 133671, 133672, 133673, 133674, 133676, 133677'}
                {set $params['sortby'] = ''}
                {set $params['depth'] = 100}
            {/if}

            {if $_modx->resource.context_key == 'fasad'}
                {set $params['resources'] = '36783, 36784, 34819, 36793, 36807, 36806, 36804, 36782,96060,96063,96064'}
                {set $params['sortby'] = ''}
                {set $params['sortdir'] = 'ASC'}
                {set $params['depth'] = 100}
            {/if}

            {'!pdoResources' | snippet : $params}
</section>
