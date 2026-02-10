<?php

$context = $modx->resource->get('context_key');
$result = [];

switch ($context) {
  case 'rasprodazha':
    $result = [
      'navigations' => [
        [
          'title' => 'Крепежные изделия',
          'id' => 'krepezh',
          'id-svg' => 'krepezh-svg',
          'uri' => '/krepezhnye-izdeliya/',
        ],
        [
          'title' => 'Ручной инструмент',
          'id' => 'ruch-instrument',
          'id-svg' => 'ruch-instrument-svg',
          'uri' => '/ruchnoy-instrument/',
        ],
        [
          'title' => 'Измерительный инструмент',
          'id' => 'izm-instrument',
          'id-svg' => 'izm-instrument-svg',
          'uri' => '/izmeritelnyy-instrument/',
        ],
        [
          'title' => 'Режущий и шлифовальный инструмент',
          'id' => 'rez-shlif',
          'id-svg' => 'rez-shlif-svg',
          'uri' => '/rezhushchiy-i-shlifovalnyy-instrument/',
        ],
        [
          'title' => 'Крепежные аксессуары и элементы',
          'id' => 'krepezh-aks',
          'id-svg' => 'krepezh-aks-svg',
          'uri' => '/krepezhnye-aksessuary-i-ehlementy/',
        ],
        [
          'title' => 'Лестничные и транспортировочные средства',
          'id' => 'lest-transp',
          'id-svg' => 'lest-transp-svg',
          'uri' => '/lestnichnye-i-transportirovochnye-sredstva/',
        ],
        [
          'title' => 'Расходные материалы для строительства',
          'id' => 'rashod-mat',
          'id-svg' => 'rashod-mat-svg',
          'uri' => '/raskhodnye-materialy-dlya-stroitelstva/',
        ],
        [
          'title' => 'Средства защиты и разметки',
          'id' => 'zashchita-razmetka',
          'id-svg' => 'zashchita-razmetka-svg',
          'uri' => '/sredstva-zashchity-i-razmetki/',
        ],
        [
          'title' => 'Строительные оборудование',
          'id' => 'stroit-oborud',
          'id-svg' => 'stroit-oborud-svg',
          'uri' => '/stroitelnye-oborudovanie/',
        ],
      ],
      'contents' => [
        [
          'id' => 'krepezh',
          'items' => [
            [
              'category' => [
                'title' => 'Крепежные изделия',
                'uri' => '/krepezhnye-izdeliya/',
              ],
              'products' => [
                ['title' => 'Дюбель', 'uri' => '/dyubel/'],
                ['title' => 'Гвозди', 'uri' => '/gvozdi/'],
                ['title' => 'Гайка', 'uri' => '/gayka/'],
                ['title' => 'Шпилька резьбовая оцинкованная', 'uri' => '/shpilka-rezbovaya-ocinkovannaya/'],
                ['title' => 'Шпилька сантехническая', 'uri' => '/shpilka-santekhnicheskaya/'],
                ['title' => 'Инъекционная шпилька', 'uri' => '/inekcionnaya-shpilka/'],
                ['title' => 'Саморезы по дереву', 'uri' => '/samorezy-po-derevu/'],
                ['title' => 'Саморезы универсальные', 'uri' => '/samorezy-universalnye/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'ruch-instrument',
          'items' => [
            [
              'category' => [
                'title' => 'Ручной инструмент',
                'uri' => '/ruchnoy-instrument/',
              ],
              'products' => [
                ['title' => 'Бита', 'uri' => '/bita/'],
                ['title' => 'Ручной инструмент Ножовка', 'uri' => '/ruchnoy-instrument-nozhovka/'],
                ['title' => 'Молоток слесарный', 'uri' => '/molotok-slesarnyy/'],
                // ['title' => 'Рубанок', 'uri' => '/rubanok/'],
                // ['title' => 'Кельма-ковш', 'uri' => '/kelma-kovsh/'],
                ['title' => 'Ручной инструмент уровень пузырьковый', 'uri' => '/ruchnoy-instrument-uroven-puzyrkovyy/'],
                ['title' => 'Ручной инструмент уровень магнитный', 'uri' => '/ruchnoy-instrument-uroven-magnitnyy/'],
                ['title' => 'Нож строительный', 'uri' => '/nozh-stroitelnyy/'],
                ['title' => 'Степлер строительный', 'uri' => '/stepler-stroitelnyy/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'izm-instrument',
          'items' => [
            [
              'category' => [
                'title' => 'Измерительный инструмент',
                'uri' => '/izmeritelnyy-instrument/',
              ],
              'products' => [
                ['title' => 'Рулетка', 'uri' => '/ruletka/'],
                ['title' => 'Уровень пузырьковый', 'uri' => '/uroven-puzyrkovyy/'],
                ['title' => 'Уровень магнитный', 'uri' => '/uroven-magnitnyy/'],
                ['title' => 'Угольник', 'uri' => '/ugolnik/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'rez-shlif',
          'items' => [
            [
              'category' => [
                'title' => 'Режущий и шлифовальный инструмент',
                'uri' => '/rezhushchiy-i-shlifovalnyy-instrument/',
              ],
              'products' => [
                // ['title' => 'Круг отрезной', 'uri' => '/krug-otreznoy/'],
                ['title' => 'Ножовка', 'uri' => '/nozhovka/'],
                // ['title' => 'Штроборез', 'uri' => '/shtroborez/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'krepezh-aks',
          'items' => [
            [
              'category' => [
                'title' => 'Крепежные аксессуары и элементы',
                'uri' => '/krepezhnye-aksessuary-i-ehlementy/',
              ],
              'products' => [
                ['title' => 'Лента крепежная', 'uri' => '/lenta-krepezhnaya/'],
                ['title' => 'Пластина крепежная', 'uri' => '/plastina-krepezhnaya/'],
                ['title' => 'Уголок крепежный', 'uri' => '/ugolok-krepezhnyy/'],
                ['title' => 'Скобы', 'uri' => '/skoby/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'lest-transp',
          'items' => [
            [
              'category' => [
                'title' => 'Лестничные и транспортировочные средства',
                'uri' => '/lestnichnye-i-transportirovochnye-sredstva/',
              ],
              'products' => [
                ['title' => 'Лестница', 'uri' => '/lestnica/'],
                ['title' => 'Тележка', 'uri' => '/telezhka/'],
                ['title' => 'Тачка', 'uri' => '/tachka/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'rashod-mat',
          'items' => [
            [
              'category' => [
                'title' => 'Расходные материалы для строительства',
                'uri' => '/raskhodnye-materialy-dlya-stroitelstva/',
              ],
              'products' => [
                // ['title' => 'Шнур', 'uri' => '/shnur/'],
                ['title' => 'Нить', 'uri' => '/nit/'],
                // ['title' => 'Клей', 'uri' => '/kley/'],
                // ['title' => 'Мастика', 'uri' => '/mastika/'],
                ['title' => 'Пленка', 'uri' => '/plenka/'],
                // ['title' => 'Ветро-влагозащита', 'uri' => '/vetro-vlagozashchita/'],
                // ['title' => 'Паро-гидроизоляция', 'uri' => '/paro-gidroizolyaciya/'],
                ['title' => 'Мешок для мусора', 'uri' => '/meshok-dlya-musora/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'zashchita-razmetka',
          'items' => [
            [
              'category' => [
                'title' => 'Средства защиты и разметки',
                'uri' => '/sredstva-zashchity-i-razmetki/',
              ],
              'products' => [
                ['title' => 'Перчатки', 'uri' => '/perchatki/'],
                ['title' => 'Очки защитные', 'uri' => '/ochki-zashchitnye/'],
                ['title' => 'Маркер перманентный', 'uri' => '/marker-permanentnyy/'],
              ],
            ],
          ],
        ],
        [
          'id' => 'stroit-oborud',
          'items' => [
            [
              'category' => [
                'title' => 'Строительные оборудование',
                'uri' => '/stroitelnye-oborudovanie/',
              ],
              'products' => [
                // ['title' => 'Миксер-насадка', 'uri' => '/mikser-nasadka/'],
              ],
            ],
          ],
        ],
      ]
    ];
    break;
}

return $result;
