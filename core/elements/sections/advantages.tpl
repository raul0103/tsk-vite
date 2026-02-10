{switch $_modx->resource.context_key}
    {case 'kirpich-m'}
    {set $block_title = "Преимущества компании"}
    {set $advantages = [
        [
            'title' => 'ОФИЦИАЛЬНЫЕ ДИЛЕРЫ',
            'text' => 'Мы напрямую сотрудничаем с крупными производителями строительных материалов такими как LSR и другие, что гарантирует самые выгодные цены для наших клиентов',
            'image' => 'advant-3'
        ],
        [
            'title' => 'САМЫЙ БОЛЬШОЙ АССОРТИМЕНТ КИРПИЧА',
            'text' => 'В наличии всегда имеются любые позиции кирпича от самых популярных до более редких',
            'image' => 'advant-8'
        ],
        [
            'title' => 'ПОИСК НЕСТАНДАРТНЫХ МАТЕРИАЛОВ',
            'text' => 'Если вам нужны нестандартные строительные материалы, наши менеджеры помогут вам найти их и организовать доставку',
            'image' => 'icon-puzzle'
        ],
        [
            'title' => 'БЫСТРАЯ ДОСТАВКА ПО ЗВОНКУ',
            'text' => 'Доставим заказ в любую точку Санкт-Петербурга и Ленинградской области. После уточнения наличия вы можете получить кирпич уже через 2 часа у Вас на объекте!',
            'image' => 'advant-6'
        ],
        [
            'title' => 'ПРОФЕССИОНАЛЬНЫЕ ЛОГИСТЫ И МЕНЕДЖЕРЫ',
            'text' => 'Позвоните нам и наши сотрудники бесплатно проконсультируют вас, помогут с расчетом стоимости материалов и подберут подходящий транспорт для разгрузки у вас на объекте',
            'image' => 'advant-7'
        ],
        [
            'title' => 'ЛУЧШАЯ ЦЕНА',
            'text' => 'Мы гарантируем самую низкую цену на кирпич и стройматериалы, так как являемся одним из самых крупных поставщиков',
            'image' => 'advant-5'
        ],
        [
            'title' => 'ВЫСОКОЕ КАЧЕСТВО ПРОДУКЦИИ',
            'text' => 'Высокое качество нашей продукции подтверждено сертификатами и действующими ГОСТами',
            'image' => 'advant-2'
        ],
        [
            'title' => 'КОМПЛЕКСНЫЕ ПОСТАВКИ МАТЕРИАЛОВ',
            'text' => 'Мы можем предложить все необходимые материалы для строительства дома под ключ, а также скидки на оптовые закупки',
            'image' => 'advant-1'
        ],
    ]}
    {case 'onduline1'}
        {set $block_title = "Преимущества Ондулина"}
        {if $_modx->resource.parent in list [126001,125604]}
            {set $garanty = ['full_image' => '/assets/template/img/advantages/onduline1/pictograms-svg-7.svg','title'=>'Гарантия от протечек 15 лет']}
        {else}
            {set $garanty = ['full_image' => '/assets/template/img/advantages/onduline1/pictograms-svg-1.svg','title'=>'Гарантия от протечек 20 лет']}
        {/if}
        {set $advantages = [
            $garanty,
            [
            'title' => 'Не конденсирует',
            'full_image' => '/assets/template/img/advantages/onduline1/ne-kondensiruet.svg'
            ],
            [
            'title' => 'Не протекает',
            'full_image' => '/assets/template/img/advantages/onduline1/ne-protekaet.svg'
            ],
            [
            'title' => 'Не ржавеет',
            'full_image' => '/assets/template/img/advantages/onduline1/pictograms-svg-9.svg'
            ],
            [
            'title' => 'Тихая кровля, не шумит в дождь',
            'full_image' => '/assets/template/img/advantages/onduline1/pictograms-svg-2.svg?v=1'
            ],
            [
            'title' => 'Не нагревается',
            'full_image' => '/assets/template/img/advantages/onduline1/pictograms-svg-5.svg?v=1'
            ],
            [
            'title' => 'Простой монтаж',
            'full_image' => '/assets/template/img/advantages/onduline1/pictograms-svg-4.svg?v=1'
            ],
            [
            'title' => 'Удобная транспортировка',
            'full_image' => '/assets/template/img/advantages/onduline1/udobnaia-transportirovka.svg?v=1'
            ],
            [
            'title' => 'Лёгкий вес',
            'full_image' => '/assets/template/img/advantages/onduline1/legkii-ves.svg?v=1'
            ],
            [
            'title' => 'Устойчив к ветру',
            'full_image' => '/assets/template/img/advantages/onduline1/ustoichiv-k-vetru.svg?v=1'
            ],
            [
            'title' => 'Устойчив к случайному возгоранию',
            'full_image' => '/assets/template/img/advantages/onduline1/ne-vozgoraetsia-ot-iskr.svg?v=1'
            ],
            [
            'title' => 'Не экранирует сигнал',
            'full_image' => '/assets/template/img/advantages/onduline1/ne-ekraniruet.svg?v=1'
            ],
        ]}
    {default}
    {set $block_title = "Преимущества компании"}
    {set $brand_with_space = ''}

    {if $_modx->resource.context_key in list ['rockwool', 'penoplex', 'web', 'tn', 'ursa', 'isover', 'paroc', 'isorok', 'tizol', 'isotecti', 'izomin', 'baswool', 'xotpipe', 'izovol', 'beltep', 'ruspanel', 'umatex']}
    {set $iword = 'утеплитель'}
    {set $rword = 'утеплителя'}
    {set $brand_with_space = ' ' ~ $brand}
    {elseif $_modx->resource.context_key == 'krovlya'}
    {set $iword = 'кровельные материалы'}
    {set $rword = 'кровельных материалов'}
    {elseif $_modx->resource.context_key == 'kirpich-m'}
    {set $iword = 'кирпич'}
    {set $rword = 'кирпича'}
    {elseif $_modx->resource.context_key == 'asconcrete'}
    {set $iword = 'асфальт'}
    {set $rword = 'асфальта'}
    {elseif $_modx->resource.context_key == 'fasady-pro'}
    {set $iword = 'деревянный фасад'}
    {set $rword = 'деревянного фасада'}
    {elseif $_modx->resource.context_key == 'fasad'}
    {set $iword = 'фасадные материалы'}
    {set $rword = 'фасадных материалов'}
    {elseif $_modx->resource.context_key == 'armatura-178'}
    {set $iword = 'арматуру'}
    {set $rword = 'арматуры'}
    {elseif $_modx->resource.context_key == 'pilomat'}
    {set $iword = 'пиломатериалы'}
    {set $rword = 'пиломатериалов'}
    {elseif $_modx->resource.context_key == 'plitaosb'}
    {set $iword = 'плитные материалы'}
    {set $rword = 'плитных материалов'}
    {elseif $_modx->resource.context_key == 'pro-fanera'}
    {set $iword = 'фанеру'}
    {set $rword = 'фанеры'}
    {elseif $_modx->resource.context_key == 'plity-mdvp'}
    {set $iword = 'плиты МДВП'}
    {set $rword = 'плит МДВП'}
    {elseif $_modx->resource.context_key == 'policarbonat'}
    {set $iword = 'поликарбонат'}
    {set $rword = 'поликарбоната'}
    {elseif $_modx->resource.context_key == 'ugol'}
    {set $iword = 'уголь'}
    {set $rword = 'угля'}
    {elseif $_modx->resource.context_key == 'pellety'}
    {set $iword = 'пеллеты'}
    {set $rword = 'пеллетов'}
    {elseif $_modx->resource.context_key == 'drova'}
    {set $iword = 'дрова'}
    {set $rword = 'дров'}
    {elseif $_modx->resource.context_key == 'brikety'}
    {set $iword = 'топливные брикеты'}
    {set $rword = 'топливных брикетов'}
    {elseif $_modx->resource.context_key == 'ceresit'}
    {set $iword = 'строительные смеси Ceresit'}
    {set $rword = 'строительных смесей Ceresit'}
    {elseif $_modx->resource.context_key == 'gazobeton'}
    {set $iword = 'свой заказ'}
    {set $rword = 'газобетон'}
    {/if}
    
    {set $advantages = [
        [
            'title' => 'Комплексные поставки материалов',
            'text' => 'Для строительства дома под ключ',
            'image' => 'advant-1'
        ],
        [
            'title' => 'Высокое качество продукции',
            'text' => 'Подтвержденное сертификатами и действующими ГОСТ',
            'image' => 'advant-2'
        ],
        [
            'title' => 'Доставка',
            'text' => 'В любую точку Санкт-Петербурга и Ленинградской области',
            'image' => 'advant-3'
        ],
        [
            'title' => 'Круглосуточная поставка',
            'text' => 'Без праздников и выходных',
            'image' => 'advant-4'
        ],
        [
            'title' => 'Лучшая цена',
            'text' => 'Мы гарантируем самую низкую цену на '~$rword~$brand_with_space~', так как являемся одним из самых крупных поставщиков',
            'image' => 'advant-5'
        ],
        [
            'title' => 'Доставка по звонку',
            'text' => 'После уточнения наличия вы можете получить '~$iword~' уже через 2 часа у Вас на объекте!',
            'image' => 'advant-6'
        ],
        [
            'title' => 'Бесплатная консультация менеджера',
            'text' => 'Позвоните нам и наш менеджер подберет наиболее оптимальный вариант под Ваши нужды',
            'image' => 'advant-7'
        ],
        [
            'title' => 'Огромный ассортимент',
            'text' => 'В наличии всегда имеются самые популярные позиции '~$rword~$brand_with_space,
            'image' => 'advant-8'
        ],
    ]}
{/switch}

<section class="advantages" id="section-advantages">
    <div class="wrapper">
        <h2 class="title-2">{$block_title}</h2>
        <div class="advantages__cards">

            {foreach $advantages as $index => $advant}
            <div class="advantages__card">
                
                    {if $advant['full_image']}
                        <img src="{$advant['full_image']}">
                    {else}
                    <div class="advantages__card-img">
                        <svg class="svg advant-{$index+1}" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 39 38" width="39"
                        height="38">
                            <use xlink:href="{$_modx->config["template_path"]}img/svg-sprite.svg?v={'file_version'|config}#{$advant['image']}"></use>
                        </svg>
                    </div>
                    {/if}
    
                {if $advant['text']}
                    <div class="advantages__card-title">{$advant['title']}</div>
                    <div class="advantages__card-text">{$advant['text']}</div>
                {else}
                    <div class="advantages__card-title" style="margin:0">{$advant['title']}</div>
                {/if}
            </div>
            {/foreach}

        </div>
    </div>
</section>
