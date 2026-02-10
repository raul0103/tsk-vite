{* Вынес в отдельный чанк, чтобы удобнее было работать, т.к. тут много кода *}

<div class="listing__products-item-chars-wrap">
    <span class="listing__products-item-chars-btn">
        <svg class="svg icon-info" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
             version="1.1">
            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-info"></use>
        </svg>
        {if $_modx->context.key in list ['krovlya', 'plitaosb']}
            Характеристики
        {else}
            Показать информацию
        {/if}
    </span>

    <div class="listing__products-item-chars">
        {*
            Массив со сложными опциями.
            Сложные - это те, где может быть больше 1 значения.
        *}
        {if $_modx->resource.context_key == 'armatura-178'}
            {set $compositeKeys = [
                'Марка стали' => 'marka-stali'
            ]}
        {/if}
        {if $_modx->resource.context_key not in list ['web', 'rockwool', 'tn', 'penoplex', 'isover', 'paroc', 'ursa']}
            {set $compositeKeys['Применение'] = 'primenenie'}
        {/if}
        {* Профлист в кровле *}
        {if $src['parent'] in list [86214,43730,81058,81057,81056,81055,81054,81053,81047,43790,43775,43760,43748,43720,43711,43536,41715,41709,41706,41701,41699,41690,41684,41628,37728,26581,81051,81052,26582,86228,86218,86215,86229,86227,86226,86225,86224,86223,86222,86221,86220,86219,86217,86216]}
            {set $compositeKeys['Цвет'] = 'cvet'}
        {/if}

        {* Получение значений опций *}
        {set $compositeValues = []}
        {set $compositeExtraValues = []}
        {set $compositeCount = []}
        {foreach $compositeKeys as $title => $key}
            {set $compositeCount[$key] = $src[$key] | count}
            {set $info = []}
            {if $compositeCount[$key] > 1}
                {set $compositeValues[$key] = $src[$key][0] ~ '...'}

                {foreach 1..($compositeCount[$key]-1) as $value}
                    {set $compositeExtraValues[$key][] = $src[$key][$value]}
                {/foreach}
            {else}
                {set $compositeValues[$key] = $src[$key][0]}
            {/if}
        {/foreach}

        {* Определяем сроки поставки *}
        {set $deliveryHeader = 'Срок поставки'}
        {set $deliveryValue = '1-2 дня'}
        {set $deliveryMetalValue = '3-4 дня'}

        {* Определяем, какие опции будут выводиться *}
        {if $src['context_key'] == 'armatura-178'}
            {set $charsValues = [
                $src['diametr-mm'][0],
                $src['dlina-m'][0],
                $src['surface'][0],
                $src['massa-1-m-profilya-kg'][0],
                $src['marka-stali'][0],
                $src['kolichestvo-metrov-v-1-tonne'][0],
            ]}
            {set $charsHeaders = [
                'Диаметр, мм',
                'Длина, м',
                'Поверхность',
                'Масса 1 п.м. профиля, кг',
                'Марка стали',
                'Количество п.м. в 1 тонне',
            ]}
        {elseif $src['context_key'] == 'plitaosb'}
            {set $charsValues = [
                $src['proizvoditel'][0],
                $src['item_thickness'][0],
                $src['item_width'][0],
                $src['item_length'][0],
                $src['ploshad_m2'][0],
            ]}
            {set $charsHeaders = [
                'Производитель',
                'Толщина, мм',
                'Ширина, мм',
                'Длина, мм',
                'Площадь, м2'
            ]}
        {elseif $src['context_key'] == 'pilomat'}
            {set $charsValues = [
                ([$src['item_thickness'][0], $src['item_width'][0], $src['item_length'][0]] | implode : 'x'),
                $src['vlazhnost'][0],
                $src['product-sort'][0],
                $src['vid-obrabotki'][0],
                $src['massa'][0],
                $src['kol-vokub-sh'][0],
            ]}
            {set $charsHeaders = [
                'Размер',
                'Влажность',
                'Сорт',
                'Вид обработки',
                'Вес, кг',
                'Кол-во в кубе, шт',
            ]}
        {elseif $src['context_key'] == 'kirpich-m'}
            {set $charsValues = [
                $src['voidness'][0],
                $src['proizvoditel'][0],
                $src['razmer-mm'][0],
                $src['strength_grade'][0],
                $src['pallet_num'][0],
                $src['plotnost'][0],
                $src['massa'][0],
                $src['format'][0],
            ]}
            {set $charsHeaders = [
                'Пустотность',
                'Производитель',
                'Размер, мм',
                'Марка прочности',
                'Кол-во на поддоне',
                'Плотность, кг/м3',
                'Вес, кг',
                'Формат',
            ]}
        {elseif $src['context_key'] == 'fasady-pro'}
            {set $charsValues = [
                $src['razmer-mm'][0],
                $src['product-sort'][0],
                $src['poroda-drevesiny'][0],
                $src['obyem_m3'][0],
                $src['obschaya-ploshad'][0],
            ]}
            {set $charsHeaders = [
                'Размер, мм',
                'Сорт',
                'Порода древесины',
                'Объем, м3',
                'Общая площадь, м2',
            ]}
        {elseif $src['context_key'] == 'policarbonat'}
            {set $charsValues = [
                $src['item_thickness'][0],
                $src['garantiya'][0],
                $src['stoykost-k-uf'][0],
                $src['tolshchina-zashchitnogo-sloya'][0],
                $src['massazam2'][0],
            ]}
            {set $charsHeaders = [
                'Толщина, мм',
                'Гарантия, лет',
                'Стойкость к УФ',
                'Толщина защитного слоя',
                'Вес, кг/м2',
            ]}
        {* Профлист в кровле *}
        {elseif $src['parent'] in list [86214,43730,81058,81057,81056,81055,81054,81053,81047,43790,43775,43760,43748,43720,43711,43536,41715,41709,41706,41701,41699,41690,41684,41628,37728,26581,81051,81052,26582,86228,86218,86215,86229,86227,86226,86225,86224,86223,86222,86221,86220,86219,86217,86216]}
            {set $charsValues = [
                $deliveryMetalValue,
                $src['profil'][0],
                $src['item_thickness'][0],
                $src['cvet'],
                $src['obshaya-shirina'][0],
                $src['poleznaya-shirina'][0],
            ]}
            {set $charsHeaders = [
                $deliveryHeader,
                'Профиль',
                'Толщина, мм',
                'Цвет'
                'Общая ширина, мм',
                'Полезная ширина, мм',
            ]}
        {* Ондулин на кровле *}
        {elseif $src['parent'] in list [16783,18186,18189,18193,18181,16805,36871,16784,16786]}
            {set $charsValues = [
                $deliveryValue,
                $src['ottenok'][0],
                $src['kolichestvo-voln'][0],
                $src['vysota-volny'],
                $src['item_thickness'][0],
                $src['item_width'][0],
                $src['item_length'][0],
                $src['ploshad_m2'][0],
            ]}
            {set $charsHeaders = [
                $deliveryHeader,
                'Оттенок',
                'Количество волн',
                'Высота волны, мм'
                'Толщина, мм',
                'Ширина, мм',
                'Длина, мм'
                'Площадь, м2'
            ]}
        {* Шифер на кровле *}
        {elseif $src['parent'] in list [92921]}
            {set $charsValues = [
                $deliveryValue,
                $src['cvet'][0],
                $src['item_thickness'][0],
                $src['item_width'][0],
                $src['item_length'][0],
            ]}
            {set $charsHeaders = [
                $deliveryHeader,
                'Цвет',
                'Толщина, мм',
                'Ширина, мм'
                'Длина, мм',
            ]}
        {* Металлочерепица на кровле *}
        {elseif $src['parent'] in list [16788,11760,12069,12070,12071,12073,12074,16789,37621,44676,44677,44678,44679,44680,44681,76923]}
            {set $charsValues = [
                $deliveryMetalValue,
                $src['item_thickness'][0],
                $src['pokrytie'][0],
                $src['cvet'][0],
                $src['collection'][0],
                $src['vid-poverhnosti'][0],
            ]}
            {set $charsHeaders = [
                $deliveryHeader,
                'Толщина, мм',
                'Покрытие',
                'Цвет',
                'Коллекция',
                'Вид поверхности',   
            ]}
        {* Бикрост  ("32363) и его потомки на кровле *}
        {elseif $src['parent'] in list $_modx->runSnippet("@FILE snippets/getCategoriesListIds.php", ["parent" => "32363"])}
            {set $charsValues = [
                $deliveryValue,
                $primenenie,
                $src['plotnost'][0],
                $src['teploprovodnost'][0],
                $src['ploshad_m2'][0],
                $src['obyem_m3'][0],
                $src['v_upakovke'][0],
                $pm,
                $src['osnova'][0],
            ]}
            {set $charsHeaders = [
                $deliveryHeader,
                'Применение',
                'Плотность, кг/м3',
                'Теплопроводность',
                'Площадь, м2',
                'Объем, м3',
                'Кол-во в упаковке, шт',
                'Кол-во в упаковке, п.м.',
                "Основа",
            ]}
        {* Штакетник (81059) и его потомки на кровле *}
        {elseif $src['parent'] in list [81059,81060,81061,81062,81063,81064,81065,81066,81067,81068,81069,81070,81071,81072,86230,86231,86232,86233,100239]}
            {set $charsValues = [
                $deliveryValue,
                $src['cvet'][0],
                $src['pokrytie'][0],
                $src['item_thickness'][0],
            ]}
            {set $charsHeaders = [
                $deliveryHeader,
                'Цвет',
                'Покрытие',
                'Толщина, мм',
            ]}
        {* Фасады *}
        {elseif $src['context_key'] == 'fasad'}
            {if $src['parent'] in list [36783,95979,95978,95977,76482,76483,76484,76492,76493,76494,76495,76496,76497,76498,76499,76481,76480,76478,36785,36786,36787,36788,74115,74117,74118,74120,74281,74279,74277,74275,74274,74122,96008,95999,95996,95995,95994,95991,95990,95986,95985,95980,96010]}
                {set $charsValues = [
                    $src['factura'][0],
                    $src['proizvoditel'][0],
                    $src['cvet'][0],
                    $src['collection'][0],
                    $src['razmer-mm'][0],
                ]}
                {set $charsHeaders = [
                    'Фактура',
                    'Производитель',
                    'Цвет'
                    'Коллекция',
                    'Размер, мм',
                ]}
            {* Фиброцементный сайдинг *}
            {elseif $src['parent'] in list [95969,95968,95967,95966,95964,95963,95962,36302,36301,33663,32903,32889,32629,34792,34797,34799,34819,34933,34934,34935,34936,47094,47098,47101,47102,47107,47108,47109,47110,47111,47112,47113,47114,47115,47116,47117,47118,47119,47120,47121,47122,47123,47124,47167,47168,47169,47170,47171,47172,47173,47174,47175,47176,47177,47178,47179,47180,47181,47182,47183,47184,47185,47186,47187,47188]}
                {set $charsValues = [
                    $src['proizvoditel'][0],
                    $src['cvet'][0],
                    $src['dlina'][0],
                    $src['item_width'][0],
                    $src['item_thickness'][0],
                    '1-2 дня',
                ]}
                {set $charsHeaders = [
                    'Производитель',
                    'Цвет',
                    'Длина',
                    'Ширина, мм',
                    'Толщина, мм',
                    'Срок поставки'
                ]}
            {* Софиты *}
            {elseif $src['parent'] in list [95970,95971,95972,95973,95974,95975,95976,96656,105287]}
                {set $charsValues = [
                    $src['proizvoditel'][0],
                    $src['factura'][0],
                    $src['cvet'][0],
                    $src['item_thickness'][0],
                    $src['material'][0],
                    $src['item_length'][0],
                ]}
                {set $charsHeaders = [
                    'Производитель',
                    'Фактура',
                    'Цвет',
                    'Толщина, мм',
                    'Материал',
                    'Длина, мм'
                ]}
            {* Сайдинг *}
            {elseif $src['parent'] in list [36782,102890,102893,102894,102892,102895,100744,100746,99966,99965,99964,99963,99962,99961,99960,99959,99958,96101,96100,100294,105433,96097,96093,96095,100295,100296,96060,96064,98898,98899,98900,98901,96063,95977,95978,95979,36783,36784,36785,36786,36787,36788,36789,36790,36791,72627,72634,72635,72637,72639,72641,72643,72646,72648,72804,72805,72806,72807,72808,72809,72810,72811,72812,72813,72814,72815,72816,72817,72818,72819,72820,72821,72822,72823,72824,72825,72826,72827,72828,72829,72830,72831,72832,72833,72834,72835,72839,72841,72844,72847,72851,72853,72854,72858,72861,72864,72866,72867,72870,72871,72872,72873,72874,72888,72890,72893,72897,72898,72900,72901,72912,72913,72915,72916,72918,72919,72924,72925,72928,72929,72932,72933,72935,72936,72941,72943,72946,72947,72953,72956,72958,72984,72986,72988,72990,72991,72998,73001,73851,73853,73855,73856,73860,73862,73865,73869,73870,73875,73876,73878,73880,73881,73884,73885,73888,73889,73891,73893,73894,73899,73901,73903,73904,73921,73924,73926,73931,73932,73935,73936,73939,73940,73942,73943,73946,73947,74115,74117,74118,74120,74122,74274,74275,74277,74279,74281,76478,76480,76481,76482,76483,76484,76492,76493,76494,76495,76496,76497,76498,76499,95980,95985,95986,95990,95991,95994,95995,95996,95999,96008,96010,96096,96102]}
                {set $charsValues = [
                    $src['proizvoditel'][0],
                    $src['factura'][0],
                    $src['cvet'][0],
                    $src['item_thickness'][0],
                    $src['razmer-mm'][0]
                ]}
                {set $charsHeaders = [
                    'Производитель',
                    'Фактура',
                    'Цвет',
                    'Толщина, мм',
                    'Размер, мм'
                ]}
            {* Фасадные панели *}
            {elseif $src['parent'] in list [36792,102891,102852,102863,102853,102854,102855,102856,102859,102896,102858,102864,102860,102861,102862,102857,102851,102873,102872,102871,102870,102869,102868,102867,102866,102865,100745,96076,96071,96072,96073,96074,96075,96069,36793,36794,36795,36796,36797,36798,36799,36800,36801,36802,36804,71821,71824,71826,71829,71831,71842,71844,71845,72526,72527,72528,72529,72530,72531,72532,72533,72534,72535,72536,72537,72539,72540,72541,72542,72543,72544,72545,72546,72547,72548,72549,72550,72552,72553,72554,72555,72556,72557,72558,72559,72560,72561,72563,72564,72565,72566,72567,72568,72569,72570,72571,72572,72573,72574,72575,72576,72577,72578,72579,72580,72581,72582,72583,72584,72585,72586,72587,72588,72589,72590,72591,76485,76486,76487,76488,76489,76490,76491,104225,104226,104227,96077,96078]}
                {set $charsValues = [
                  $src['cvet'][0],
                  $src['proizvoditel'][0],
                  $src['factura'][0],
                  $src['item_thickness'][0],
                  $src['item_width'][0],
                  $src['item_length'][0]
                ]}
                {set $charsHeaders = [
                  'Цвет',
                  'Производитель',
                  'Фактура',
                  'Толщина, мм',
                  'Ширина, мм',
                  'Длина, мм',
                ]}
            {/if}
        {elseif $src['context_key'] == 'gazobeton'}
            {if $src['parent'] in list [133676]}
                {set $charsValues = [
                    $src['proizvoditel'][0],
                    $src['massa'][0],
                    $src['cvet'][0],
                    $src['strength_grade'][0],
                ]}
                {set $charsHeaders = [
                    'Производитель',
                    'Вес, кг',
                    'Цвет'
                    'Марка прочности'
                ]}
            {elseif $src['parent'] not in list [133677]}
                {set $charsValues = [
                    $src['razmer-mm'][0],
                    $src['plotnost-ob'][0],
                    $src['pallet_num'][0]
                ]}
                {set $charsHeaders = [
                    'Размер, мм',
                    'Плотность',
                    'Кол-во на поддоне'
                ]}
            {/if}
        {* В остальных случаях *}
        {else}
            {set $charsValues = [
                $primenenie,
                $src['plotnost'][0],
                $src['teploprovodnost'][0],
                $src['ploshad_m2'][0],
                $src['obyem_m3'][0],
                $src['v_upakovke'][0],
                $pm,
            ]}
            {set $charsHeaders = [
                'Применение',
                'Плотность, кг/м3',
                'Теплопроводность',
                'Площадь, м2',
                'Объем, м3',
                'Кол-во в упаковке, шт',
                'Кол-во в упаковке, п.м.',
            ]}
        {/if}

        {if $_modx->context.key == 'krovlya'}
            {set $charsValues[] = $article}
            {set $charsHeaders[] = "Артикул"}
        {/if}

        {* Вывод опций *}
        {foreach $charsValues as $key => $value}
            {if $value ?}
                <div class="listing__products-item-chars-line">
                    <span class="listing__products-item-chars-span">
                        {$charsHeaders[$key]}:
                    </span>
                    <span class="listing__products-item-chars-val">
                        {if $compositeValues[$compositeKeys[$charsHeaders[$key]]]}
                            {$compositeValues[$compositeKeys[$charsHeaders[$key]]]}

                            {if $compositeExtraValues[$compositeKeys[$charsHeaders[$key]]] | count > 0}
                                <div class="listing__products-item-chars-val-info-wrap">
                                    <span class="listing__products-item-chars-val-info-btn">
                                        <svg class="svg icon-info" xmlns="http://www.w3.org/2000/svg"
                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                             version="1.1">
                                            <use xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-info"></use>
                                        </svg>
                                    </span>
                                    <div class="listing__products-item-chars-val-info">
                                        {$compositeExtraValues[$compositeKeys[$charsHeaders[$key]]] | implode : ', '}
                                    </div>
                                </div>
                            {/if}
                        {else}
                            {* На всякий случай делаем join, вдруг значение - это массив. Ну а если нет, то со значением ничего не будет *}
                            {$value | join : ', '}
                        {/if}
                    </span>
                </div>
            {/if}
        {/foreach}
    </div>
</div>
