{* TODO: слишком много повторяющегося кода, надо бы упростить его *}

<div class="product-card__info-block">
    {* На плитах МДВП главная цена - за м2, вторая цена - за лист *}
    {if $_modx->resource.context_key in list ['plity-mdvp']}
      <div class="product-card__info-block-elem">
        <div class="product-card__info-elem">
          <div class="product-card__side-panel-text">Цена за м<sup>2</sup></div>
        </div>
        <div class="product-card__info-val product-card__info-val_content_price">
          <div class="product-card__info-price js-product__price-wrap">
            <span class="product-card__price-val">
                {$outputPrice}
            </span>
            <span class="product-card__price-unit">руб</span>
          </div>
        </div>
      </div>
      <div class="product-card__info-block-elem">
        <div class="product-card__info-elem">
          <div class="product-card__side-panel-text">Цена за лист</div>
        </div>
        <div class="product-card__info-val product-card__info-val_content_price">
          <div class="product-card__info-price js-product__price-wrap">
              <span class="product-card__price-val">
                  {($defaultPrice / $list) | ceil | preg_replace : '/\B(?=(\d{3})+(?!\d))/': ' ' | replace : ',' : '.'}
              </span>
              <span class="product-card__price-unit">руб</span>
          </div>
        </div>
      </div>

    {* На остальных контекстах главная цена - за лист, вторая цена - за м2 *}
    {else}
      
      {if $_modx->resource.context_key == 'pilomat'}
          {set $priceUnitFirst = 'м<sup>3</sup>'}
          {set $priceUnitSecond = 'шт.'}
          {set $priceUnitSecondVal = ($defaultPrice / $_modx->resource['kol-vokub-sh'][0])} 
      {else}
          {set $priceUnitFirst = 'лист'}
          {set $priceUnitSecond = 'м<sup>2</sup>'}
          {set $priceUnitSecondVal = ($defaultPrice / $m2)}
      {/if}
      
      <div class="product-card__info-block-elem">
        <div class="product-card__info-elem">
          <div class="product-card__side-panel-text">Цена за {$priceUnitFirst}</div>
        </div>
        <div class="product-card__info-val product-card__info-val_content_price">
          <div class="product-card__info-price js-product__price-wrap">
            <span class="product-card__price-val">
                {$outputPrice}
            </span>
            <span class="product-card__price-unit">руб</span>
          </div>
        </div>
      </div>
      <div class="product-card__info-block-elem">
        <div class="product-card__info-elem">
          <div class="product-card__side-panel-text">Цена за {$priceUnitSecond}</div>
        </div>
        <div class="product-card__info-val product-card__info-val_content_price">
          <div class="product-card__info-price js-product__price-wrap">
                    <span class="product-card__price-val">
                        {$priceUnitSecondVal | ceil | preg_replace : '/\B(?=(\d{3})+(?!\d))/': ' ' | replace : ',' : '.'}
                    </span>
            <span class="product-card__price-unit">руб</span>
          </div>
        </div>
      </div>
    {/if}

    <div class="product-card__info-block-elem">
        <div class="product-card__info-elem">
            <div class="product-card__side-panel-text">Общая сумма</div>
        </div>
        <div class="product-card__info-val product-card__info-val_content_price">
            <div class="product-card__info-price js-product__price-wrap">
                <span class="product-card__price-val product-card__price-val_type_total">
                    {$outputPrice}
                </span>
                <span class="product-card__price-unit">руб</span>
            </div>
        </div>
    </div>

    {if $outputOldPrice?}
      <div class="product-card__new-price-wrap js-product__new-price-wrap">
        <div class="js-product__new-price-val">
          <span class="js-product__new-price-output product-card__new-price">
              {$outputOldPrice}
          </span>
          руб
        </div>
        <div class="js-product__new-price-wrap listing__new-price-text js-product__new-price-text">
          Цена действительна до {'!getTomorrowDate' | snippet}
        </div>
      </div>
    {/if}
</div>