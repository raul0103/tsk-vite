<section class="similar-tabs-products">
    <div class="wrapper">
        <h2 class="similar-tabs-products__title title-2">Сопутствующие товары</h2>


        <div class="similar-tabs-products__tabs">
            {* Навигация по табам *}
            <div class="similar-tabs-products__nav">
                {set $isFirst = true}
                {set $index = 0}
                {foreach $data['rules'] as $rule}

                        {set $index = $index + 1}
                        <button class="similar-tabs-products__nav-item{$isFirst ? ' active' : ''}"
                                data-tab="tab-{$index}">
                            {$rule['name']}
                        </button>
                        {set $isFirst = false}

                {/foreach}
            </div>

            {* Содержимое табов *}

            <div class="similar-tabs-products__content">
                {set $isFirst = true}
                {set $index = 0}
                {foreach $data['data'] as $value}
                    {set $index = $index + 1}
                    <div class="similar-tabs-products__tab{$isFirst ? ' active' : ''}"
                            id="tab-{$index}">
                        {'msProducts' | snippet : [
                        'parents' => $value['parents'] | join,
                        'resources' => $value['products'] | join,
                        'tpl' => '@FILE sections/popular/pop-slide.tpl',
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


                {/foreach}
            </div>
        </div>

    </div>
</section>

