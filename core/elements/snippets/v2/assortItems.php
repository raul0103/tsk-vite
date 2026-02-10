<?php

$cacheName = 'v2_assortItems';
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheName . '/' . $modx->context->key . '/',
];

if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    switch ($modx->resource->context_key) {
        case 'kirpich-m':
            /**
             * Массив делится на 
             * tab-navigations - Кнопки переключения табов
             * tab-contents - Контент табов
             * Связаны между собой по id
             */
            $result = [
                'tab-navigations' => [
                    [
                        'title' => 'Строительный (рядовой) кирпич',
                        'id' => 'assort-kirpich',
                        'id-svg' => 'assort-kirpich', // Отделил Id на id-svg так как бывает svg дублируется, а поле id нельзя дублировать
                    ],
                    [
                        'title' => 'Облицовочный (лицевой) кирпич',
                        'id' => 'assort-brickwall',
                        'id-svg' => 'assort-brickwall',
                    ],
                    [
                        'title' => 'Керамический широкоформатный блок',
                        'id' => 'assort-brick',
                        'id-svg' => 'assort-brick',
                        'classes' => 'mobile__word-break-all'
                    ],
                    [
                        'title' => 'Фасадная плитка, камень, декор',
                        'id' => 'assort-plitka',
                        'id-svg' => 'assort-plitka',
                    ],
                    [
                        'title' => 'Печной кирпич',
                        'id' => 'assort-stoneoven',
                        'id-svg' => 'assort-stoneoven',
                    ],
                    [
                        'title' => 'Брусчатка и мощение',
                        'id' => 'assort-paving',
                        'id-svg' => 'assort-paving',
                    ],
                    [
                        'title' =>  'Кладочные смеси',
                        'id' => 'assort-smesi',
                        'id-svg' => 'assort-smesi',
                        'classes' => 'mobile__justify-content-center'
                    ],
                ],
                'tab-contents' => [
                    [
                        'title' => 'Строительный (рядовой) кирпич',
                        'id' => 'assort-kirpich',
                        'items' => [
                            [
                                'title' => 'Рядовой кирпич',
                                'uri' => '/stroitelnye/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/ryadovoy.webp', 'style' => 'width: 150px; right: 65px;'],
                                'class_names' => 'desktop-average mobile-very-small'
                            ],
                            [
                                'title' => 'Полнотелый кирпич',
                                'uri' => '/stroitelnye-keramicheskie-polnotelyij/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/stroitelnye-keramicheskie-polnotelii.webp', 'style' => 'width: 150px; right: 65px;'],
                                'class_names' => 'desktop-average mobile-very-small'
                            ],
                            [
                                'title' => 'Пустотелый кирпич',
                                'uri' => '/stroitelnye-keramicheskie-pustotelyij/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/stroitelnye-keramicheskie-pustotelyij.webp', 'style' => 'width: 140px; right: 50px;'],
                                'class_names' => 'desktop-average mobile-very-small',
                            ],
                        ]
                    ],
                    [
                        'title' => 'Облицовочный (лицевой) кирпич',
                        'id' => 'assort-brickwall',
                        'items' => [
                            [
                                'title' => 'Облицовочные кирпичи',
                                'uri' => '/oblicovochnye/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/oblitsovochnii.webp'],
                                'class_names' => 'desktop-small mobile-small'
                            ],
                            [
                                'title' => 'Керамический облицовочный кирпич',
                                'uri' => '/keramicheskie-oblicovochnye/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/licevoj-kirpich-keramicheskij.webp', 'style' => 'width: 160px; right: 70px;'],
                                'class_names' => 'desktop-average mobile-average'
                            ],
                            [
                                'title' => 'Клинкерный кирпич',
                                'uri' => '/klinkernye/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/klinkernyj-licevoj-kirpich.webp'],
                                'class_names' => 'desktop-small mobile-small'
                            ],
                            [
                                'title' => 'Кирпич ручной формовки',
                                'uri' => '/ruchnoj-formovki',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/oblichovochnye-kirpichi-ruchnoj-formovki.webp', 'style' => 'width: 140px; right: 50px;'],
                                'class_names' => 'desktop-average mobile-average'
                            ],
                        ]
                    ],
                    [
                        'title' => 'Керамический широкоформатный блок',
                        'id' => 'assort-brick',
                        'items' => [
                            [
                                'title' => 'Крупноформатные блоки',
                                'uri' => '/krupnoformatnyj-blok/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/krupnoformatnye-bloki.webp'],
                                'class_names' => 'desktop-big mobile-half'
                            ],
                            [
                                'title' => 'Керамоблоки ЛСР',
                                'uri' => '/keramobloki/?proizvoditel=ЛСР',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramobloki-LSR.webp'],
                                'class_names' => 'desktop-big mobile-half'
                            ],
                            [
                                'title' => 'Керамоблоки BRAER',
                                'uri' => '/keramobloki/?proizvoditel=BRAER',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramobloki-braer.webp'],
                                'class_names' => 'desktop-big mobile-half'
                            ],
                            [

                                'title' => 'Керамоблоки Радошковичи (Ceglar)',
                                'uri' => '/keramobloki/?proizvoditel=Радошковичи%20(Ceglar)',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramobloki-Радошковичи.png', 'style' => 'transform:scale(.8); '],
                                'class_names' => 'desktop-big mobile-half'
                            ],
                            [
                                'title' => 'Керамоблоки Гжельск',
                                'uri' => '/keramobloki/?proizvoditel=Гжельский%20кирпичный%20завод',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramobloki-gzhel.webp'],
                                'class_names' => 'desktop-big mobile-half'
                            ],
                            [
                                'title' => 'Керамоблоки Porotherm (Wienerberger)',
                                'uri' => '/keramobloki/?proizvoditel=Porotherm%20(Wienerberger)',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramobloki-Porotherm.webp', 'style' => 'transform: scale(.8); bottom: 0px;'],
                                'class_names' => 'desktop-big mobile-half'
                            ],
                        ],
                    ],
                    [
                        'title' => 'Фасадная плитка, камень, декор',
                        'id' => 'assort-plitka',
                        'items' => [
                            [
                                'title' => 'Фасадная плитка',
                                'uri' => '/fasadnaya-plitka/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/fasadnaya-plitka.webp', 'style' => 'right: 35px; bottom: 20px;'],
                                'class_names' => 'desktop-average mobile-small mobile-order-1'
                            ],
                            [
                                'title' => 'Плитка под кирпич',
                                'uri' => '/plitka-pod-kirpich/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/plitka-pod-kirpich.webp', 'style' => 'transform: scale(.7);bottom: 0;'],
                                'class_names' => 'desktop-small mobile-average mobile-order-2'
                            ],
                            [
                                'title' => 'Клинкерная плитка',
                                'uri' => '/klinkernaya-plitka/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/klinkernaya-plitka-1.webp', 'style' => 'transform: scale(.8); bottom: -17px; right: 20px;'],
                                'class_names' => 'desktop-average mobile-average mobile-order-3'
                            ],
                            [
                                'title' => 'Керамическая плитка',
                                'uri' => '/keramicheskaya-plitka/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramicheskaya-plitka.webp', 'style' => 'transform: scale(.8); bottom: 0px; right: 0px;'],
                                'class_names' => 'desktop-small mobile-small mobile-order-4'
                            ],
                            [
                                'title' => 'Декоративный кирпич',
                                'uri' => '/dekorativnyj-kirpich/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/dekorativnyj-kirpich-1.webp'],
                                'class_names' => 'desktop-small mobile-small mobile-order-5'
                            ],
                            [
                                'title' => 'Плитка для печей и каминов',
                                'uri' => '/plitka-dlya-pechej-i-kaminov/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/plitka-dlya-pechej-i-kaminov.webp', 'style' => 'transform: scale(.8); bottom: 0; right: 15px;'],
                                'class_names' => 'desktop-average mobile-average mobile-order-6'
                            ],
                            [
                                'title' => 'Искусственный камень для фасада',
                                'uri' => '/iskusstvennyj-kamen-dlya-fasada/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/is-kamen-fasad.webp', 'style' => 'transform: scale(.7); bottom: -25px; right: -20px;'],
                                'class_names' => 'desktop-small mobile-average mobile-order-9'
                            ],
                            [
                                'title' => 'Декоративный камень для внутренней отделки',
                                'uri' => '/dekorativnyij-kamen-dlya-vnutrennej-otdelki/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/dek-kamen-vn-otdelka.webp', 'style' => 'transform: scale(.7); bottom: -10px; right: 10px;'],
                                'class_names' => 'desktop-average mobile-average mobile-order-8'
                            ],
                            [
                                'title' => 'Фасадный декор',
                                'uri' => '/fasadnyj-dekor/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/fasadnyj-dekor.webp'],
                                'class_names' => 'desktop-small mobile-small mobile-order-7'
                            ],
                            [
                                'title' => 'Плитка для навесных фасадов',
                                'uri' => '/plitka-dlya-navesnyh-fasadov/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/plita-dlya-navesnyh-fasadov.webp', 'style' => 'transform: scale(.7); bottom: -8px; right: 2px;'],
                                'class_names' => 'desktop-average mobile-small mobile-order-10'
                            ],
                            [
                                'title' => 'Архитектурные элементы фасада',
                                'uri' => '/arhitekturnye-elementy-fasada/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/arhitekturnye-elementy-fasada.webp', 'style' => 'bottom: 22px;'],
                                'class_names' => 'desktop-small mobile-small mobile-order-11'
                            ],
                            [
                                'title' => 'Клинкерные подоконники и водоотливы',
                                'uri' => '/klinkernye-podokonniki-i-vodootlivy/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/klinkernye-podokonniki-i-vodootlivy-1.webp', 'style' => 'transform: scale(.7); bottom: -14px; right: 10px;'],
                                'class_names' => 'desktop-average mobile-average mobile-order-12'
                            ],
                        ]

                    ],
                    [
                        'title' => 'Печной кирпич',
                        'id' => 'assort-stoneoven',
                        'items' => [
                            [
                                'title' => 'Шамотный кирпич',
                                'uri' => '/shamotnye/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/shamotniy.webp', 'style' => 'transform: scale(1.5); right: 75px; bottom: 25px;'],
                                'class_names' => 'desktop-big mobile-small'
                            ],
                            [
                                'title' => 'Керамический кирпич для печей',
                                'uri' => '/pechnoj-kirpich-keramicheskiy/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/keramich-kirpich-dlya-pechej.webp', 'style' => 'transform: scale(1.5); right: 75px; bottom: 25px;'],
                                'class_names' => 'desktop-big mobile-average'
                            ],
                        ]
                    ],
                    [
                        'title' => 'Брусчатка и мощение',
                        'id' => 'assort-paving',
                        'items' => [
                            [
                                'title' => 'Брусчатка',
                                'uri' => '/bruschatka-i-plitka-dlya-mosheniya/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/trotyarniy-kliner.webp', 'style' => 'transform: scale(.8);bottom: 7px; right: 35px;'],
                                'class_names' => 'desktop-average mobile-small'
                            ],
                            [
                                'title' => 'Клинкерная брусчатка',
                                'uri' => '/klinkernaya-bruschatka/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/klinkernaya-bruschatka-1.webp', 'style' => 'transform: scale(.8); bottom: -23px; right: -12px;'],
                                'class_names' => 'desktop-small mobile-average'
                            ],
                            [
                                'title' => 'Бетонная тротуарная плитка',
                                'uri' => '/betonnaya-trotuarnaya-plitka/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/betonnaya-trotuarnaya-plitka.webp', 'style' => 'bottom: -23px; right: -12px;'],
                                'class_names' => 'desktop-average mobile-average'
                            ],
                            [
                                'title' => 'Бордюры',
                                'uri' => '/bordury/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/bordury.webp'],
                                'class_names' => 'desktop-small mobile-small'
                            ],
                            [
                                'title' => 'Дорожные бордюры',
                                'uri' => '/bordury-dorozhnyie/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/bordury-dorozhnyie-1.webp'],
                                'class_names' => 'desktop-small mobile-very-small'
                            ],
                            [
                                'title' => 'Тротуарные бордюры',
                                'uri' => '/bordury-trotuarnyie/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/bordury-trotuarnyie.webp', 'style' => 'transform: scale(.8); bottom: -4px; right: 30px;'],
                                'class_names' => 'desktop-average mobile-very-small'
                            ],
                            [
                                'title' => 'Садовые бордюры',
                                'uri' => '/bordury-sadovyie/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/bordury-sadovyie-1.webp', 'style' => 'transform: scale(1.5); bottom: 25px; right: 100px;'],
                                'class_names' => 'desktop-big mobile-very-small'
                            ],
                        ]
                    ],
                    [
                        'title' =>  'Кладочные смеси',
                        'id' => 'assort-smesi',
                        'items' => [
                            [
                                'title' => 'Кладочные смеси',
                                'uri' => '/kladochnye-smesi/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/smesi.webp', 'style' => 'transform: scale(.5); bottom: -60px; right: 10px;'],
                                'class_names' => 'desktop-average mobile-very-small'
                            ],
                            [
                                'title' => 'Клей для газобетона',
                                'uri' => '/klej-dlya-gazobetona/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/klej-dlya-gazobetona.webp', 'style' => 'transform: scale(.5); bottom: -65px; right: -22px;'],
                                'class_names' => 'desktop-small mobile-very-small'
                            ],
                            [
                                'title' => 'Цветные кладочные растворы',
                                'uri' => '/cvetnye-kladochnye-rastvory/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/cvetnie-kladochnie-rastvori.webp', 'style' => 'transform: scale(.5); bottom: -55px; right: 0;'],
                                'class_names' => 'desktop-average mobile-very-small'
                            ],
                            [
                                'title' => 'Легкие, теплые растворы',
                                'uri' => '/legkie-teplye-rastvory/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/legkie-teplye-rastvory.webp', 'style' => 'transform: scale(.5); bottom: -48px; right: -18px;'],
                                'class_names' => 'desktop-small mobile-very-small'
                            ],
                            [
                                'title' => 'Огнеупорные смеси',
                                'uri' => '/ogneupornye-smesi/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/ogneupornye-smesi.webp', 'style' => 'transform: scale(.7); bottom: -48px; right: 65px;'],
                                'class_names' => 'desktop-big mobile-very-small'
                            ],
                            [
                                'title' => 'Нецветные смеси',
                                'uri' => '/necvetnye-smesi/',
                                'img' => ['src' => '/assets/template/img/assort/kirpich-m/necvetnye-smesi.webp', 'style' => 'transform: scale(.7); bottom: -48px; right: 65px;'],
                                'class_names' => 'desktop-big mobile-very-small'
                            ],
                        ]
                    ],
                ]
            ];
            break;
    }

    $modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

return $result;
