<?php

$cacheName = 'v1_assortItems';
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'default/file_snippets/' . $cacheName . '/' . $modx->context->key . '/',
];

if (!$result = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    switch ($modx->resource->context_key) {
            // case 'kirpich-m':
            //     $result = [
            //         'Строительный (рядовой) кирпич' => [
            //             'id' => 'assort-kirpich',
            //             'items' => [
            //                 'Рядовой кирпич' => [
            //                     'uri' => '/stroitelnye/',
            //                     'img' => '/assets/template/img/assort/kirpich.jpg',
            //                     'links' => [
            //                         'Полнотелый' => '/stroitelnye/?voidness=Полнотелый',
            //                         'Пустотелый' => '/stroitelnye/?voidness=Пустотелый',
            //                     ]
            //                 ],
            //             ]
            //         ],
            //         'Облицовочный (лицевой) кирпич' => [
            //             'id' => 'assort-brickwall',
            //             'items' => [
            //                 'Облицовочные кирпичи' => [
            //                     'uri' => '/oblicovochnye/',
            //                     'fullwidth' => true,
            //                 ],
            //                 'Керамический лицевой кирпич' => [
            //                     'uri' => '/keramicheskie-oblicovochnye/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/licevoj-kirpich-keramicheskij.jpg',
            //                 ],
            //                 'Клинкерный лицевой кирпич' => [
            //                     'uri' => '/klinkernye/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/klinkernyj-licevoj-kirpich.jpg',
            //                 ],
            //                 'Кирпич ручной формовки' => [
            //                     'uri' => '/ruchnoj-formovki',
            //                     'img' => '/assets/template/img/assort/kirpich-m/oblichovochnye-kirpichi-ruchnoj-formovki.jpg',
            //                 ],
            //             ]
            //         ],
            //         'Керамический широкоформатный блок' => [
            //             'id' => 'assort-brick',
            //             'items' => [
            //                 'Крупноформатные блоки' => [
            //                     'uri' => '/krupnoformatnyj-blok/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/krupnoformatnye-bloki.jpg',
            //                     'links' => [
            //                         'Керамоблоки ЛСР' => '/keramobloki/?proizvoditel=ЛСР',
            //                         'Радошковичи (Ceglar)' => '/keramobloki/?proizvoditel=Радошковичи%20(Ceglar)',
            //                         'Керамоблоки Porotherm (Wienerberger)' => '/keramobloki/?proizvoditel=Porotherm%20(Wienerberger)',
            //                         'Керамоблоки ВКЗ' => '/keramobloki/?proizvoditel=ВКЗ',
            //                         'Керамоблоки BRAER' => '/keramobloki/?proizvoditel=BRAER',
            //                         'Керамоблоки Гжельск' => '/keramobloki/?proizvoditel=Гжельский%20кирпичный%20завод',
            //                     ]
            //                 ],
            //             ]
            //         ],
            //         'Фасадная плитка, камень, декор' => [
            //             'id' => 'assort-plitka',
            //             'items' => [
            //                 'Фасадная плитка' => [
            //                     'uri' => '/fasadnaya-plitka/',
            //                     'fullwidth' => true,
            //                 ],
            //                 'Плитка под кирпич' => [
            //                     'uri' => '/plitka-pod-kirpich/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/plitka-pod-kirpich.jpg',
            //                     'links' => [
            //                         'Клинкерная плитка' => '/klinkernaya-plitka/',
            //                         'Керамическая плитка' => '/keramicheskaya-plitka/',
            //                         'Декоративный кирпич' => '/dekorativnyj-kirpich/'
            //                     ]
            //                 ],
            //                 'Плитка для печей и каминов' => [
            //                     'uri' => '/plitka-dlya-pechej-i-kaminov/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/plitka-dlya-pechej-i-kaminov.jpg',
            //                 ],
            //                 'Искусственный камень для фасада' => [
            //                     'uri' => '/iskusstvennyj-kamen-dlya-fasada/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/is-kamen-fasad.jpg',
            //                 ],
            //                 'Декоративный камень для внутренней отделки' => [
            //                     'uri' => '/dekorativnyij-kamen-dlya-vnutrennej-otdelki/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/dek-kamen-vn-otdelka.jpg',
            //                 ],
            //                 'Плитка для навесных фасадов' => [
            //                     'uri' => '/plitka-dlya-navesnyh-fasadov/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/plita-dlya-navesnyh-fasadov.jpg',
            //                 ],
            //                 'Фасадный декор' => [
            //                     'uri' => '/fasadnyj-dekor/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/fasadnyj-dekor.jpg',
            //                     'links' => [
            //                         'Архитектурные элементы фасада' => '/arhitekturnye-elementy-fasada/',
            //                         'Клинкерные подоконники и водоотливы' => '/klinkernye-podokonniki-i-vodootlivy/',
            //                     ]
            //                 ],
            //             ]
            //         ],
            //         'Печной кирпич' => [
            //             'id' => 'assort-stoneoven',
            //             'items' => [
            //                 'Шамотный кирпич' => [
            //                     'uri' => '/shamotnye/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/shamotniy.jpg',
            //                 ],
            //                 'Керамический кирпич для печей' => [
            //                     'uri' => '/pechnoj-kirpich-keramicheskiy/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/keramich-kirpich-dlya-pechej.jpg',
            //                 ]
            //             ]
            //         ],
            //         'Брусчатка и мощение' => [
            //             'id' => 'assort-paving',
            //             'items' => [
            //                 'Брусчатка' => [
            //                     'uri' => '/bruschatka-i-plitka-dlya-mosheniya/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/trotyarniy-kliner.jpg',
            //                     'links' => [
            //                         'Клинкерная брусчатка' => '/klinkernaya-bruschatka/',
            //                         'Бетонная тротуарная плитка' => '/betonnaya-trotuarnaya-plitka/'
            //                     ],
            //                 ],
            //                 'Бордюры' => [
            //                     'uri' => '/bordury/',
            //                     'img' => '/assets/template/img/assort/kirpich-m/bordury.jpg',
            //                     'links' => [
            //                         'Дорожные' => '/bordury-dorozhnyie/',
            //                         'Тротуарные' => '/bordury-trotuarnyie/',
            //                         'Садовые' => '/bordury-sadovyie/'
            //                     ],
            //                 ]
            //             ]
            //         ],
            //         'Кладочные смеси' => [
            //             'id' => 'assort-smesi',
            //             'items' => [
            //                 'Кладочные смеси' => [
            //                     'uri' => '/kladochnye-smesi/',
            //                     'img' => '/assets/template/img/assort/smesi.jpg',
            //                     'links' => [
            //                         'Клей для газобетона' => '/klej-dlya-gazobetona/',
            //                         'Цветные кладочные растворы' => '/cvetnye-kladochnye-rastvory/',
            //                         'Легкие, теплые растворы' => '/legkie-teplye-rastvory/',
            //                         'Огнеупорные смеси' => '/ogneupornye-smesi/',
            //                         'Нецветные смеси' => '/necvetnye-smesi/',
            //                     ]
            //                 ]
            //             ]
            //         ],
            //     ];
            //     break;

        case 'krovlya':
        $result = [
            'Металлочерепица' => [
                'id' => 'assort-cerepica',
                'items' => [
                    'Металлочерепица' => [
                        'uri' => '/metallocherepica/',
                        'fullwidth' => true,
                    ],
                    'Металлочерепица Grand Line' => [
                        'uri' => '/metallocherepitsya-grand-line/',
                        'img' => '/assets/template/img/assort/krovlya/grandline.jpg',
                        'links' => [
                            'Classic' => '/metallocherepitsya-grand-line-classic/',
                            'Kamea' => '/metallocherepitsya-grand-line-kamea/',
                            'Kredo' => '/metallocherepitsya-grand-line-kredo/',
                            'Kvinta plus' => '/metallocherepitsya-grand-line-kvinta-plus/',
                            'Kvinta Uno' => '/metallocherepitsya-grand-line-kvinta-uno/',
                            'Modern' => '/metallocherepitsya-grand-line-modern/',
                            'Монтеррей' => '/prodazha-metallocherepicy-monterrej-grand-line/',
                        ]
                    ],
                    'Металлочерепица Металл-Профиль' => [
                        'uri' => '/metallocherepica-metall-profil/',
                        'img' => '/assets/template/img/assort/krovlya/metallprofil.jpg',
                        'links' => [
                            'Ламонтерра' => '/metallocherepica-lamonterra/',
                            'Ламонтерра X' => '/metallocherepica-lamonterra-x/',
                            'Ламонтерра XL' => '/metallocherepica-lamonterra-xl/',
                            'Монтекристо' => '/metallocherepica-montekristo/',
                            'Монтерроса' => '/metallocherepica-monterrosa/',
                            'Трамонтана' => '/metallocherepica-tramontana/',
                        ]
                    ]
                ]
            ],
            'Профнастил и штакетник' => [
                'id' => 'assort-proflist',
                'items' => [
                    'Профнастил' => [
                        'uri' => '/proflist/',
                        'fullwidth' => true,
                    ],
                    'Профилированный лист для кровли' => [
                        'uri' => '/proflist-dlya-krovli/',
                        'img' => '/assets/template/img/assort/krovlya/profnastil.jpg',
                        'links' => [
                            'Профнастил для кровли Grand Line' => '/proflist-grand-line/',
                            'Профнастил для кровли Металл-Профиль' => '/proflist-metall-profil/',
                        ]
                    ],
                    'Профилированный лист для забора' => [
                        'uri' => '/profilirovannyy-list-dlya-zabora/',
                        'img' => '/assets/template/img/assort/krovlya/profnastil-dlya-zabora.jpg',
                        'links' => [
                            'Профнастил для забора Grand Line' => '/profilirovannyy-list-dlya-zabora-grand-layn/',
                            'Профнастил для забора Металл-Профиль' => '/profilirovannyj-list-dlya-zabora-metall-profil/',
                        ]
                    ],
                    'Штакетник' => [
                        'uri' => '/shtaketnik/',
                        'img' => '/assets/template/img/assort/krovlya/shtaketnik.jpg',
                        'links' => [
                            'Штакетник Grand Line' => '/shtaketnik-grand-line/',
                            'Штакетник Металл-Профиль' => '/shtaketnik-metall-profil/',
                        ]
                    ],
                ]
            ],
            'Гибкая черепица' => [
                'id' => 'assort-bit-krovlya',
                'items' => [
                    'Мягкая кровля' => [
                        'uri' => '/myagkaya-cherepica/',
                        'img' => '/assets/template/img/assort/krovlya/gibkaya-cerepica.jpg',
                        'links' => [
                            'CertainTeed' => '/myagkaya-cherepica-certainteed/',
                            'Docke' => '/docke-pie-gibkaya-cherepica/',
                            'Катепал' => '/myagkaya-cherepica-katepal/',
                            'Икопал' => '/myagkaya-cherepica-icopal/',
                            'Tegola' => '/myagkaya-cherepica-tegola/',
                            'Технониколь Шинглас' => '/myagkaya-cherepica-tehnonikol-shinglas/',
                        ]
                    ],
                ]
            ],
            'Фальцевая кровля' => [
                'id' => 'assort-falc-krovlya',
                'items' => [
                    'Фальцевая кровля' => [
                        'uri' => '/falcevaya-krovlya/',
                        'img' => '/assets/template/img/assort/krovlya/falcevaya-krovlya.jpg',
                        'links' => [
                            'Кликфальц' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86',
                            'Кликфальц Line' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Line',
                            'Кликфальц mini' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20mini',
                            'Кликфальц Pro' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Pro',
                            'Кликфальц Pro Gofr' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Pro%20Gofr',
                            'Кликфальц Pro Line' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Pro%20Line',
                            'Фальц двойной стоячий' => '/falcevaya-krovlya/?collection=%D0%A4%D0%B0%D0%BB%D1%8C%D1%86%20%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D1%82%D0%BE%D1%8F%D1%87%D0%B8%D0%B9',
                            'Фальц двойной стоячий Line' => '/falcevaya-krovlya/?collection=%D0%A4%D0%B0%D0%BB%D1%8C%D1%86%20%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D1%82%D0%BE%D1%8F%D1%87%D0%B8%D0%B9%20Line',
                        ]
                    ],
                ]
            ],
            'Рулонная кровля' => [
                'id' => 'assort-rulon-krovlya',
                'items' => [
                    'Рулонная кровля' => [
                        'uri' => '/rulonnaya-krovlya/',
                        'fullwidth' => true,
                    ],
                    'Наплавляемая кровля' => [
                        'uri' => '/rulonnaya-krovlya-tehnonikol/',
                        'img' => '/assets/template/img/assort/rulonnayakrovlya.jpg',
                        'links' => []
                    ],
                    'ПВХ мембраны' => [
                        'uri' => '/pvh-membrany/',
                        'img' => '/assets/template/img/assort/krovlya/pvh-membrany.jpg',
                        'links' => []
                    ]
                ]
            ],
            'Цементно-песчаная черепица' => [
                'id' => 'assort-natur-cerepica',
                'items' => [
                    'Цементно-песчаная черепица' => [
                        'uri' => '/cementno-peschanaya-cherepica/',
                        'img' => '/assets/template/img/assort/krovlya/cementpesccerepica.jpg',
                        'links' => [
                            'Цементно-песчаная черепица Kriastak' => '/cementno-peschanaya-cherepica-kriastak/',
                            'Цементно-песчаная черепица Braas' => '/cementno-peschanaya-cherepica-braas/',
                            'Комплектующие для ЦПЧ' => 'komplektuyushhie-dlya-cpch',
                        ]
                    ]
                ]
            ],
            'Натуральная керамическая черепица' => [
                'id' => 'assort-ceramocherepica',
                'items' => [
                    'Керамическая черепица' => [
                        'uri' => '/keramicheskaya-cherepica/',
                        'img' => '/assets/template/img/assort/krovlya/kermaicheskaya-cerepica.jpg',
                        'links' => [
                            'Керамическая черепица Braas' => '/keramicheskaya-cherepica-braas/',
                            'Комплектующие для керамической черепицы Braas' => '/komplektuyushhie-dlya-keramicheskoj-cherepicy-braas/'
                        ]
                    ],
                ]
            ],
            'Композитная черепица' => [
                'id' => 'assort-kompozitnaya',
                'items' => [
                    'Композитная черепица' => [
                        'uri' => '/kompozitnaya-cherepicza/',
                        'img' => '/assets/template/img/assort/krovlya/kompozitnaya-cherepicza.jpg',
                        'links' => [
                            'Технониколь' => '/kompozitnaya-cherepicza-texnonikol/',
                            'Metrotile' => '/kompozitnaya-cherepicza-metrotile/',
                            'Gerard' => '/kompozitnaya-cherepicza-gerard/',
                            'Grand Line' => '/kompozitnaya-cherepicza-grand-line/',
                            'Aerodek' => '/kompozitnaya-cherepicza-aerodek/',
                        ]
                    ],
                ]
            ],
            'Фиброцементная черепица' => [
                'id' => 'assort-cerepica1',
                'items' => [
                    'Фиброцементная черепица' => [
                        'uri' => '/fibroczementnaya-cherepicza/',
                        'img' => '/assets/template/img/assort/krovlya/fibrocementnaya-cherepica.png',
                        'links' => []
                    ],
                ]
            ],
            'Ондулин и шифер' => [
                'id' => 'assort-ondulin',
                'items' => [
                    'Ондулин' => [
                        'uri' => '/ondulin/',
                        'fullwidth' => true,
                    ],
                    'Черепица Ондулин' => [
                        'uri' => '/cherepica-ondulin/',
                        'img' => '/assets/template/img/assort/krovlya/ondulin-cerepica.jpg',
                        'links' => []
                    ],
                    'Ондулин Смарт' => [
                        'uri' => '/cherepica-ondulin-smart/',
                        'img' => '/assets/template/img/assort/krovlya/ondulin-smart.jpg',
                        'links' => []
                    ],
                    'Ондутисс' => [
                        'uri' => '/ondutiss/',
                        'img' => '/assets/template/img/assort/krovlya/ondutis.jpg',
                        'links' => []
                    ],
                    'Комплектующие для Ондулина' => [
                        'uri' => '/komplektuyushhie-dlya-ondulina/',
                        'img' => '/assets/template/img/assort/krovlya/komplektujushie-ondulin.jpg',
                        'links' => []
                    ],
                    'Шифер' => [
                        'uri' => '/shifer/',
                        'img' => '/assets/template/img/assort/krovlya/shifer.jpg',
                        'links' => []
                    ],
                ]
            ],
            'Сланцевая кровля' => [
                'id' => 'assort-bit-krovlya1',
                'items' => [
                    'Сланцевая кровля' => [
                        'uri' => '/slanczevaya-krovlya/',
                        'img' => '/assets/template/img/assort/krovlya/slancevaya-krovlya.png',
                        'links' => [
                            'Cupa pizarras' => '/slanczevaya-krovlya-cupa-pizarras/',
                            'Rathscheck' => '/slanczevaya-krovlya-rathscheck/',

                        ]
                    ]
                ]
            ],
            'Водосточные системы' => [
                'id' => 'assort-vodostoch',
                'items' => [
                    'Водостоки' => [
                        'uri' => '/vodostochnaya-sistema/',
                        'fullwidth' => true,
                    ],
                    'ПВХ водосточные системы' => [
                        'uri' => '/pvh-plastikovye-vodostochnye-sistemy/',
                        'img' => '/assets/template/img/assort/krovlya/plastikovye-truby.jpg',
                        'links' => [
                            'Braas' => '/vodostochnaya-sistema/?material=%D0%9F%D0%BB%D0%B0%D1%81%D1%82%D0%B8%D0%BA&proizvoditel=Braas',
                            'Docke' => '/vodostochnaya-sistema/?material=%D0%9F%D0%BB%D0%B0%D1%81%D1%82%D0%B8%D0%BA&proizvoditel=Docke',
                            'Grand Line' => '/vodostochnaya-sistema/?material=%D0%9F%D0%BB%D0%B0%D1%81%D1%82%D0%B8%D0%BA&proizvoditel=Grand%20Line',
                            'Альта-Профиль' => '/vodostochnaya-sistema/?material=%D0%9F%D0%BB%D0%B0%D1%81%D1%82%D0%B8%D0%BA&proizvoditel=%D0%90%D0%BB%D1%8C%D1%82%D0%B0-%D0%9F%D1%80%D0%BE%D1%84%D0%B8%D0%BB%D1%8C',
                        ]
                    ],
                    'Металлические водосточные системы' => [
                        'uri' => '/metallicheskie-vodostoki/',
                        'img' => '/assets/template/img/assort/krovlya/vodostochnayasistema.jpg',
                        'links' => [
                            'Aquasystem' => '/vodostochnaya-sistema/?material=%D0%9C%D0%B5%D1%82%D0%B0%D0%BB%D0%BB&proizvoditel=Aquasystem',
                            'Braas' => '/vodostochnaya-sistema/?material=%D0%9C%D0%B5%D1%82%D0%B0%D0%BB%D0%BB&proizvoditel=Braas',
                            'Docke' => '/vodostochnaya-sistema/?material=%D0%9C%D0%B5%D1%82%D0%B0%D0%BB%D0%BB&proizvoditel=Docke',
                            'Grand Line' => '/vodostochnaya-sistema/?material=%D0%9C%D0%B5%D1%82%D0%B0%D0%BB%D0%BB&proizvoditel=Grand%20Line',
                            'Альта-Профиль' => '/vodostochnaya-sistema/?material=%D0%9C%D0%B5%D1%82%D0%B0%D0%BB%D0%BB&proizvoditel=%D0%90%D0%BB%D1%8C%D1%82%D0%B0-%D0%9F%D1%80%D0%BE%D1%84%D0%B8%D0%BB%D1%8C'
                        ]
                    ],
                ]
            ],
            'Софиты' => [
                'id' => 'assort-sofity',
                'items' => [
                    'Софиты' => [
                        'uri' => '/sofity/',
                        'fullwidth' => true,
                    ],
                    'ПВХ софиты' => [
                        'uri' => '/pvh-sofity/',
                        'img' => '/assets/template/img/assort/krovlya/sofity-plastikovye.jpg',
                        'links' => []
                    ],
                    'Металлические софиты' => [
                        'uri' => '/metallicheskie-sofity/',
                        'img' => '/assets/template/img/assort/krovlya/sofity-metallicheskie.jpg',
                        'links' => []
                    ],
                ]
            ],
            'Доборные элементы' => [
                'id' => 'assort-dobor',
                'style' => 'columns-css',
                'items' => [
                    'Доборные элементы' => [
                        'uri' => '/dobornye-elementy/',
                        'fullwidth' => true,
                    ],
                    'J-Профиль' => [
                        'uri' => '/j-profil/',
                    ],
                    'Доборные элементы для мягкой кровли' => [
                        'uri' => '/dobornye-elementy-dlya-myagkoy-krovli/',
                    ],
                    'Доборные элементы фальц' => [
                        'uri' => '/dobornyie-elementyi-falc/',
                    ],
                    'Ендовы для кровли' => [
                        'uri' => '/endova/',
                    ],
                    'Заглушки' => [
                        'uri' => '/zaglushki/',
                    ],
                    'Карнизные планки' => [
                        'uri' => '/karniznye-planki/',
                    ],
                    'Коньковые элементы для кровли' => [
                        'uri' => '/konkovye-elementy/',
                    ],
                    'Лобовые планки' => [
                        'uri' => '/lobovye-planki/',
                    ],
                    'Мансардные планки' => [
                        'uri' => '/mansardnye-planki/',
                    ],
                    'Планка капельник' => [
                        'uri' => '/planka-kapelnik/',
                    ],
                    'Планки примыкания' => [
                        'uri' => '/planki-primykaniya/',
                    ],
                    'Планки снегозадержания' => [
                        'uri' => '/planki-snegozaderzhaniya/',
                    ],
                    'Торцевые планки' => [
                        'uri' => '/torcevye-planki/',
                    ],
                    'Тройники' => [
                        'uri' => '/troyniki/',
                    ],
                    'Четверники' => [
                        'uri' => '/chetverniki/',
                    ],
                ]
            ],
            'Комплектующие' => [
                'id' => 'assort-soputtovary',
                'style' => 'columns-css',
                'items' => [
                    'Комплектующие' => [
                        'uri' => '/komplektuyushhie/',
                        'fullwidth' => true,
                    ],
                    'Мастики и краски' => [
                        'uri' => '/mastiki-kraski/',
                    ],
                    'Герметики' => [
                        'uri' => '/germetiki-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Геосинтетические материалы' => [
                        'uri' => '/geosinteticheskie-materialy/',
                        'links' => []
                    ],
                    'Антисептик и огнебиозащита древесины' => [
                        'uri' => '/antiseptik-i-ognebiozashhita-drevesinyi/',
                        'links' => []
                    ],
                    'Моющие средства для очистки кровли' => [
                        'uri' => '/moyushchie-sredstva-dlya-ochistki-krovli/',
                        'links' => []
                    ],
                    'Плоский лист' => [
                        'uri' => '/ploskiy-list-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Битумный клей' => [
                        'uri' => '/bitumnyj-klej/',
                        'links' => []
                    ],
                    'Козырьки из поликарбоната' => [
                        'uri' => '/kozyrki-iz-polikarbonata/',
                        'links' => []
                    ],
                    'Флюгеры' => [
                        'uri' => '/flyugery-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Строительный крепёж' => [
                        'uri' => '/stroitelnyy-krepyozh-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Проходки и вентиляция' => [
                        'uri' => '/prohodki-i-ventilyaciya-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Элементы безопасности кровли' => [
                        'uri' => '/ehlementy-bezopasnosti-krovli-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Коньковый торцевой элемент' => [
                        'uri' => '/konkovyj-torcevoj-ehlement-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Металлические доборные элементы' => [
                        'uri' => '/metallicheskie-dobornye-ehlementy-v-sankt-peterburge/',
                        'links' => []
                    ],
                    'Устройство примыканий' => [
                        'uri' => '/ustrojstvo-primykanij/',
                        'links' => []
                    ],
                ]
            ],
        ];
        break;
        case 'fasad':
            $result = [
                'Виниловый сайдинг' => [
                    'id' => 'vinilovyy-sayding',
                    'items' => [
                        'Виниловый сайдинг' => [
                            'uri' => '/vinilovyj-sajding/',
                            'links' => [
                                'Docke' => '/vinilovyj-sajding-docke/',
                                'Альта-Профиль' => '/vinilovyj-sajding-alta-profil/',
                                'Grand Line' => '/vinilovyj-sajding-grand-line/',
                                'Ю-Пласт' => '/vinilovyy-sayding-yu-plast/',
                                'NordSide' => '/vinilovyj-sajding-nordside/',
                                'Mitten' => '/vinilovyj-sajding-mitten/',
                                'VOX' => '/vinilovyj-sajding-vox/',
                                'FineBer' => '/vinilovyy-sayding-fineber/',
                                'VINYLON' => '/vinilovyj-sajding-vinylon/',
                                'Комплектующие для винилового сайдинга' => '/komplektuyushhie-dlya-vinilovogo-sajdinga/'
                            ]
                        ]
                    ]
                ],
                'Металлический сайдинг' => [
                    'id' => 'metallicheskiy-sayding',
                    'items' => [
                        'Металлический сайдинг' => [
                            'uri' => '/metallicheskij-sajding/',
                            'links' => [
                                'Аквасистем' => '/metallicheskij-sajding-aquasystem/',
                                'Grand Line' => '/metallicheskij-sajding-grand-line/',
                                'Металл-Профиль' => '/metallicheskij-sajding-metallprofil/',
                                'Комплектующие для металлического сайдинга' => 'https =>//www-fasad.ru/komplektuyushhie-dlya-metallicheskogo-sajdinga/'
                            ]
                        ]
                    ]
                ],
                'Вспененный сайдинг' => [
                    'id' => 'vspenennyy-sayding',
                    'items' => [
                        'Вспененный сайдинг' => [
                            'uri' => '/vspenennyij-sajding/',
                            'links' => []
                        ]
                    ]
                ],
                'Фиброцементный сайдинг' => [
                    'id' => 'fibrocementnyy-sayding',
                    'items' => [
                        'Фиброцементный сайдинг' => [
                            'uri' => '/fibrocementnyj-sajding/',
                            'links' => [
                                'Кедрал' => '/fibrocementnyj-sajding-cedral/',
                                'Дековер' => '/fibrocementnyj-sajding-dekover/',
                                'Каньон' => '/fibrocementnyj-sajding-kanion/',
                                'БЕТЭКО' => '/fibrocementnyj-sajding-beteko/',
                                'FCS Group' => '/fibrocementnyj-sajding-fcs-group/',
                                'Фибратек' => '/fibrocementnyj-sajding-fibratek/',
                                'СМ Борд' => '/fibrocementnyj-sajding-sm-bord/',
                                'LATONIT' => '/fibrocementnyj-sajding-latonit/',
                                'Asahi' => '/fibrocementnyj-sajding-asahi/',
                                'Комплектующие для фиброцементного сайдинга' => '/komplektuyushhie-dlya-fibroczementnogo-sajdinga/'
                            ]
                        ]
                    ]
                ],
                'Акриловый сайдинг' => [
                    'id' => 'akrilovyy-sayding',
                    'items' => [
                        'Акриловый сайдинг' => [
                            'uri' => '/akrilovyij-sajding/',
                            'links' => [
                                'Альта-Профиль' => '/akrilovyij-sajding-alta-profil/',
                                'Tecos' => '/akrilovyij-sajding-tecos/',
                                'FineBer' => '/akrilovyij-sajding-fineber/',
                                'Grand-Line' => '/akrilovyij-sajding-grand-line/'
                            ]
                        ]
                    ]
                ],
                'Формованный сайдинг' => [
                    'id' => 'formovannyy-sayding',
                    'items' => [
                        'Формованный сайдинг' => [
                            'uri' => '/formovannyij-sajding/',
                            'links' => []
                        ]
                    ]
                ],
                'Софиты' => [
                    'id' => 'sofity',
                    'items' => [
                        'Софиты' => [
                            'uri' => '/sofityi/',
                            'links' => [
                                'Альта-Профиль' => '/sofityi-alta-profil/',
                                'Металл Профиль' => '/sofit-metall-profil/',
                                'Docke' => '/sofityi-deke/',
                                'Grand-Line' => '/sofityi-grand-lajn/',
                                'Ю-Пласт' => '/sofityi-yu-plast/',
                                'ТехноНИКОЛЬ' => '/sofityi-texnonikol/'
                            ]
                        ]
                    ]
                ],
                'Фасадные пластиковые панели' => [
                    'id' => 'fasadnye-plastikovye-paneli',
                    'items' => [
                        'Фасадные пластиковые панели' => [
                            'uri' => '/fasadnye-plastikovye-paneli/',
                            'links' => [
                                'Docke' => '/fasadnye-paneli-docke/',
                                'Альта-Профиль' => '/fasadnye-paneli-alta-profil/',
                                'Vox' => '/fasadnye-paneli-vox/',
                                'Ю-пласт' => '/fasadnye-paneli-u-plast/',
                                'Vilostone (Вилостоун)' => '/fasadnye-paneli-vilostone/',
                                'Fineber' => '/fasadnye-paneli-fineber/',
                                'Grand Line' => '/fasadnye-paneli-grand-line/'
                            ]
                        ]
                    ]
                ],
                'Фасадная штукатурка' => [
                    'id' => 'fasadnaya-shtukaturka',
                    'items' => [
                        'Фасадная штукатурка' => [
                            'uri' => '/fasadnaya-shtukaturka/',
                            'links' => [
                                'Baumit' => '/fasadnaya-shtukaturka-baumit/'
                            ]
                        ]
                    ]
                ],
                'Фасадная плитка Технониколь Hauberk' => [
                    'id' => 'fasadnaya-plitka-tehnonikol-hauberk',
                    'items' => [
                        'Фасадная плитка Технониколь Hauberk' => [
                            'uri' => '/fasadnaya-plitka-hauberk/',
                            'links' => []
                        ]
                    ]
                ],
                'Фасадные термопанели' => [
                    'id' => 'fasadnye-termopaneli',
                    'items' => [
                        'Фасадные термопанели' => [
                            'uri' => '/fasadnye-termopaneli/',
                            'links' => []
                        ]
                    ]
                ]
            ];

            break;
    }

    $modx->cacheManager->set($cacheName, $result, 0, $cacheOptions);
}

return $result;
