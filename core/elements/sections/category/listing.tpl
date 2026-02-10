<section class="listing">
    <div class="wrapper">
        <div class="listing__content" id="mse2_mfilter">

            {if $_modx->getPlaceholder('mspcs.option') ? || $_modx->getPlaceholder('mspcs.where') ?}
                {set $isSeoPage = 1}
            {else}
                {set $isSeoPage = 0}
            {/if}

            {set $sort = '@FILE snippets/getListingSort.php' | snippet}

            {* TV поле для сортировки товаров в каталоге *}
            {if $_modx->resource.sortProducts ?}
                {set $sort = $_modx->resource.sortProducts}
            {elseif $sort == 'popular'}
                {set $sort = 'tv|priority1:asc,tv|HitsPage:asc'}
            {else}
                {set $sort = 'price:asc'}
            {/if}

            {*
            Если будешь менять здесь какие-либо условия вывода, то поменяй их еще и в /core/components/pricelists-generator/start.php.
            TODO: по-хорошему, надо написать сниппет, который будет задавать условия вывода. И в обоих местах вызывать этот сниппет. Тогда менять надо будет только код сниппета.
             *}

            {if $_modx->resource.context_key in list ['kirpich-m']}
                {set $aliases = 'price==price,msoption|color==color,msoption|cvet==cvet,msoption|proizvoditel==proizvoditel,msoption|voidness==voidness'}
                {set $aliases = $aliases ~ ',msoption|strength_grade==strength_grade,msoption|format==format,msoption|razmer-mm==razmer-mm'}
                {set $aliases = $aliases ~ ',msoption|item_length==item_length,msoption|item_width==item_width,msoption|tip==tip,msoption|ottenok==ottenok'}
                {set $aliases = $aliases ~ ',msoption|massa==massa,msoption|pokrytie==pokrytie,msoption|surface==surface,msoption|oblastprimeneniya==oblastprimeneniya'}
                {set $aliases = $aliases ~ ',msoption|material-osnovaniya==material-osnovaniya,msoption|sezon-primeneniya==sezon-primeneniya,msoption|osnova==osnova'}
                {set $aliases = $aliases ~ ',msoption|surface==surface,msoption|item_thickness==item_thickness,msoption|strana==strana,msoption|ton==ton'}
                {set $aliases = $aliases ~ ',msoption|forma==forma,msoption|tipsystem==tipsystem,msoption|collection==collection,msoption|viddekora==viddekora'}
                {set $aliases = $aliases ~ ',msoption|poriz==poriz'}
                {set $params = [
                'element' => 'msProductsMy',
                'suggestions' => 0,
                'filters' => $_modx->resource.listFilters ?: "",
                'tpls' => "@FILE sections/category/listing-products-item.tpl",
                'tplOuter' => '@FILE sections/category/listing-outer.tpl',
                'tplFilter.outer.default' => '@FILE sections/category/filter/tpl.filter.outer.tpl',
                'ajaxMode' => 'button',
                'showEmptyFilters' => 1,
                'limit' => 44,

                'tplFilter.row.price' => '@FILE chunks/filterNumberInner.tpl',
                'tplFilter.outer.price' => '@FILE chunks/filterNumber.tpl',
                'tplFilter.row.default' => '@FILE chunks/filterCheckboxNew.tpl',

                'aliases' => $aliases,
                'sort' => $sort,
                'includeTVs' => 'priority1,HitsPage,isFractional,productNotAvailable,freeShipping,imgWithWatermark',

                'values_delimeter' => '~',
                'context' => $_modx->resource.context_key,

                'optionFilters' => $_modx->getPlaceholder('mspcs.option'),
                'where' => $_modx->getPlaceholder('mspcs.where'),

                'setMeta' => 0,

                'parents' => 'excludeIds' | snippet : [
                'isSeoPage' => $isSeoPage,
                ],

                'totalVar' => 'total'
                ]}
            {else}
                {set $params = [
                'element' => 'msProductsMy',
                'suggestions' => 0,
                'filters' => $_modx->resource.listFilters ?: "",
                'tpls' => "@FILE sections/category/listing-products-item-category.tpl",
                'tplOuter' => '@FILE sections/category/listing-outer.tpl',
                'tplFilter.outer.default' => '@FILE sections/category/filter/tpl.filter.outer.tpl',
                'ajaxMode' => 'button',
                'showEmptyFilters' => 1,
                'limit' => 44,

                'tplFilter.row.price' => '@FILE chunks/filterNumberInner.tpl',
                'tplFilter.outer.price' => '@FILE chunks/filterNumber.tpl',
                'tplFilter.row.default' => '@FILE chunks/filterCheckboxNew.tpl',

                'aliases' => 'ms|price==price',
                'sort' => $sort,
                'includeTVs' => 'priority1,HitsPage,isFractional,productNotAvailable,freeShipping,imgWithWatermark',

                'values_delimeter' => '~',
                'context' => $_modx->resource.context_key,

                'optionFilters' => $_modx->getPlaceholder('mspcs.option'),
                'where' => $_modx->getPlaceholder('mspcs.where'),

                'setMeta' => 0,

                'parents' => 'excludeIds' | snippet : [
                'isSeoPage' => $isSeoPage,
                ],

                'totalVar' => 'total'
                ]}
            {/if}




            {if $_modx->resource.context_key == 'umatex'}
                {set $params['aliases'] = '@FILE snippets/getAliasesFromFilters.php' | snippet}
            {/if}
                {set $params['aliases'] = '@FILE snippets/getAliasesFromFilters.php' | snippet}
            {*
            Это для отладки
            <div class="hidden parents">
                {$params['parents']}
            </div>
            *}

            {* Страница "Продажа досок" на Пиломатериалах *}
            {if $_modx->resource.id == 80986}
                {if $params['parents'] ?}
                    {set $params['parents'] = $params['parents'] ~ ','}
                {else}
                    {set $params['parents'] = ''}
                {/if}
                {set $params['parents'] = $params['parents'] ~ '-48823,-56923,-48824,-80318'}
            {/if}

            {'!mFilter2' | snippet : $params}
        </div>
    </div>
</section>
