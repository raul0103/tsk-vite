<div class="delivery-cars">
    <div class="delivery-cars__list">

        {set $cars = json_decode($_modx->resource.delivery_cars, true)}
        {foreach $cars as $car}
        <div class="delivery-cars__item item-car">
            <div class="item-car__image">
                <span>{$car.name}</span>
                <img src="/{$car.image}" alt="{$car.name}">
            </div>
            <div class="item-car__characteristic characteristic-list">
                {set $characteristics = json_decode($car.characteristics , true)}
                {foreach $characteristics as $characteristic}
                    <div class="characteristic-list__item">
                        <span class="title">{$characteristic.name}</span>
                        <span class="value">{$characteristic.value}</span>
                    </div>
                {/foreach}

            </div>
            <div class="item-car__description">
                <div class="description">
                    <p>{$car.description}</p>
                </div>
                <div class="order-container">
                    <button class="order-btn" data-fancybox data-src="#header-callback" class="listing__catalog-promo-btn-more" data-btn-key="delivery-callback">Заказать
                        <div class="icon">
                            <svg width="11" height="10" viewBox="0 0 11 10" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M1 5H10M10 5L6.25 1M10 5L6.25 9" stroke="white" stroke-linecap="round"
                                      stroke-linejoin="round"/>
                            </svg>
                        </div>
                    </button>
                </div>
            </div>
        </div>
        {/foreach}
    </div>
</div>
