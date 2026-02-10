<section class="sect-listing wrapper">
    <h2 class="sect-listing__title title-2">Все товары</h2>
    <div id="pdopage" class="sect-listing__content">
        <div class="listing__products-list rows grid js-catalog">
            {set $parents = '@FILE snippets/getIdByAlias.php' | snippet : ['alias' => 'catalog']}
            {if $_modx->resource.context_key == 'krovlya'}
                {set $parents = $parents ~ ',-100246'}
            {/if}

            {set $params = [
                'parents' => $parents,

                'element' => 'msProductsMy',
                'tpl' => "@FILE sections/category/listing-products-item.tpl",
                'ajax' => 1,
                'limit' => 42,
                'sort' => 'tv|priority1:asc,tv|HitsPage:asc',
                'includeTVs' => 'priority1,HitsPage,isFractional,productNotAvailable,freeShipping,imgWithWatermark',
                'context' => $_modx->resource.context_key,

                'optionFilters' => $_modx->getPlaceholder('mspcs.option'),
                'where' => $_modx->getPlaceholder('mspcs.where'),

                'ajaxMode' => 'button',
                'ajaxElemMore' => "#pdopage .btn_more",
                'ajaxTplMore' => '@INLINE <button class="btn btn-default btn_more" data-max="42">Показать еще</button>',

                'setMeta' => 0,
            ]}
            {'!pdoPage' | snippet : $params}
        </div>

        {$_modx->getPlaceholder('page.nav')}
    </div>
    {if $_modx->context.key not in list ['rasprodazha']}
    {'!AjaxForm' | snippet : [
        'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
        'snippet' => 'FormIt',
        'form' => '@FILE sections/catalog/catalog-banner.tpl',
        'customValidators' => 'checkPhone,check_request',
        'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
        'validationErrorMessage' => 'В форме содержатся ошибки!',
        'successMessage' => 'Сообщение успешно отправлено',
    ]}
    {/if}
    <div class="hidden-data">
        <span id="pdopage_total">{'page.total' | placeholder ?: 0}</span>
        <span id="mse2_total">{$total ?: 0}</span>
    </div>
</section>
