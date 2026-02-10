<section class="similar-tabs-products">
    <div class="wrapper">
        <h2 class="similar-tabs-products__title title-2">Сопутствующие товары</h2>
        
        {if $tabs && count($tabs) > 0}
            <div class="similar-tabs-products__tabs">
                {* Навигация по табам *}
                <div class="similar-tabs-products__nav">
                    {set $isFirst = true}
                    {foreach $tabs as $categoryId => $productIds}
                        {if $productIds && count($productIds) > 0}
                            <button class="similar-tabs-products__nav-item{$isFirst ? ' active' : ''}" 
                                    data-tab="tab-{$categoryId}">
                                {$categoryNames[$categoryId] ?: 'Категория'}
                            </button>
                            {set $isFirst = false}
                        {/if}
                    {/foreach}
                </div>
                
                {* Содержимое табов *}
                <div class="similar-tabs-products__content">
                    {set $isFirst = true}
                    {foreach $tabs as $categoryId => $productIds}
                        {if $productIds && count($productIds) > 0}
                            <div class="similar-tabs-products__tab{$isFirst ? ' active' : ''}" 
                                 id="tab-{$categoryId}">
                                {'msProducts' | snippet : [
                                    'resources' => implode(",", $productIds),
                                    'parents' => 0,
                                    'tpl' => '@FILE sections/category/listing-products-item.tpl',
                                    'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
                                    'tplWrapper' => '@INLINE <div class="swiper-buttons similar-tabs-products__swiper-buttons" style="display: none;">
                                        <div class="swiper-button-prev"></div>
                                        <div class="swiper-button-next"></div>
                                    </div>
                                    <div class="swiper-container similar-tabs-products__slider">
                                        <div class="swiper-wrapper sect-pop__slider">
                                        {$output}
                                        </div>
                                    </div>',
                                    'wrapIfEmpty' => 0
                                ]}
                            </div>
                            {set $isFirst = false}
                        {/if}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>
</section>

