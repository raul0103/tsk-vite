<?php

$context = $modx->resource->get('context_key');
$result = [];

switch ($context) {
    case 'kirpich-m':
        $result = [
            'navigations' => [
                [
                    'title' => 'Строительный (рядовой) кирпич',
                    'id' => 'assort-kirpich',
                    'id-svg' => 'assort-kirpich', // Отделил Id на id-svg так как бывает svg дублируется, а поле id нельзя дублировать
                    'uri' => '/stroitelnye/'
                ],
                [
                    'title' => 'Облицовочный (лицевой) кирпич',
                    'id' => 'assort-brickwall',
                    'id-svg' => 'assort-brickwall',
                    'uri' => '/oblicovochnye/',
                ],
                [
                    'title' => 'Керамический широкоформатный блок',
                    'id' => 'assort-brick',
                    'id-svg' => 'assort-brick',
                    'uri' => '/keramobloki/'
                ],
                [
                    'title' => 'Фасадная плитка, камень, декор',
                    'id' => 'assort-plitka',
                    'id-svg' => 'assort-plitka',
                    'uri' => '/fasadnaya-plitka/',
                ],
                [
                    'title' => 'Печной кирпич',
                    'id' => 'assort-stoneoven',
                    'id-svg' => 'assort-stoneoven',
                    'uri' => '/pechnoj-kirpich/'
                ],
                [
                    'title' => 'Брусчатка и мощение',
                    'id' => 'assort-paving',
                    'id-svg' => 'assort-paving',
                    'uri' => '/bruschatka-i-plitka-dlya-mosheniya/'
                ],
                [
                    'title' =>  'Кладочные смеси',
                    'id' => 'assort-smesi',
                    'id-svg' => 'assort-smesi',
                    'uri' => '/kladochnye-smesi/'
                ],
            ],
            'contents' => [
                [
                    'id' => 'assort-kirpich',
                    'items' => [
                        [
                            'category' =>  [
                                'title' => 'Рядовой кирпич',
                                'uri' => '/stroitelnye/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Полнотелый',
                                    'uri' => '/stroitelnye/?voidness=Полнотелый',
                                ],
                                [
                                    'title' => 'Пустотелый',
                                    'uri' => '/stroitelnye/?voidness=Пустотелый',
                                ],
                            ]
                        ]
                    ]

                ],
                [
                    'id' => 'assort-brickwall',
                    'items' => [
                        [
                            'category' => [
                                'title' => 'Керамический лицевой кирпич',
                                'uri' => '/keramicheskie-oblicovochnye/',
                            ],
                        ],
                        [
                            'category' => [
                                'title' => 'Клинкерный кирпич',
                                'uri' => '/klinkernye/',
                            ],
                        ],
                        [
                            'category' => [
                                'title' => 'Кирпич ручной формовки',
                                'uri' => '/ruchnoj-formovki',
                            ],
                        ],
                        [
                            'category' => [
                                'title' => 'Кирпич ЛСР',
                                'uri' => '/lsr/',
                            ],
                        ],
                    ]
                ],
                [
                    'id' => 'assort-brick',
                    'items' => [
                        [
                            'category' => [
                                'title' => 'Крупноформатные блоки',
                                'uri' => '/krupnoformatnyj-blok/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Керамоблоки ЛСР',
                                    'uri' => '/keramobloki/?proizvoditel=ЛСР',
                                ],
                                [
                                    'title' => 'Радошковичи (Ceglar)',
                                    'uri' => '/keramobloki/?proizvoditel=Радошковичи%20(Ceglar)',
                                ],
                                [
                                    'title' => 'Керамоблоки Porotherm (Wienerberger)',
                                    'uri' => '/keramobloki/?proizvoditel=Porotherm%20(Wienerberger)',
                                ],
                                [
                                    'title' => 'Керамоблоки ВКЗ',
                                    'uri' => '/keramobloki/?proizvoditel=ВКЗ',
                                ],
                                [
                                    'title' => 'Керамоблоки BRAER',
                                    'uri' => '/keramobloki/?proizvoditel=BRAER',
                                ],
                                [
                                    'title' => 'Керамоблоки Гжельск',
                                    'uri' => '/keramobloki/?proizvoditel=Гжельский%20кирпичный%20завод',
                                ],
                            ]
                        ]
                    ],
                ],
                [
                    'id' => 'assort-plitka',
                    'items' => [
                        [
                            'category' => [
                                'title' => 'Плитка под кирпич',
                                'uri' => '/plitka-pod-kirpich/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Клинкерная плитка',
                                    'uri' => '/klinkernaya-plitka/',
                                ],
                                [
                                    'title' => 'Керамическая плитка',
                                    'uri' => '/keramicheskaya-plitka/',
                                ],
                                [
                                    'title' => 'Декоративный кирпич',
                                    'uri' => '/dekorativnyj-kirpich/',
                                ],
                            ]
                        ],
                        [
                            'category' => [
                                'title' => 'Плитка для печей и каминов',
                                'uri' => '/plitka-dlya-pechej-i-kaminov/',
                            ]
                        ],
                        [
                            'category' => [
                                'title' => 'Искусственный камень для фасада',
                                'uri' => '/iskusstvennyj-kamen-dlya-fasada/',
                            ]
                        ],
                        [
                            'category' => [
                                'title' => 'Декоративный камень для внутренней отделки',
                                'uri' => '/dekorativnyij-kamen-dlya-vnutrennej-otdelki/',
                            ]
                        ],
                        [
                            'category' => [
                                'title' => 'Плитка для навесных фасадов',
                                'uri' => '/plitka-dlya-navesnyh-fasadov/',
                            ]
                        ],
                        [
                            'category' => [
                                'title' => 'Фасадный декор',
                                'uri' => '/fasadnyj-dekor/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Архитектурные элементы фасада',
                                    'uri' => '/arhitekturnye-elementy-fasada/',
                                ],
                                [
                                    'title' => 'Клинкерные подоконники и водоотливы',
                                    'uri' => '/klinkernye-podokonniki-i-vodootlivy/',
                                ]
                            ]
                        ],
                    ]
                ],
                [
                    'id' => 'assort-stoneoven',
                    'items' => [
                        [
                            'category' => [
                                'title' => 'Шамотный кирпич',
                                'uri' => '/shamotnye/',
                            ]
                        ],
                        [
                            'category' => [
                                'title' => 'Керамический кирпич для печей',
                                'uri' => '/pechnoj-kirpich-keramicheskiy/',
                            ]
                        ],
                    ]
                ],
                [
                    'id' => 'assort-paving',
                    'items' => [
                        [
                            'category' => [
                                'title' => 'Брусчатка',
                                'uri' => '/bruschatka-i-plitka-dlya-mosheniya/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Клинкерная брусчатка',
                                    'uri' => '/klinkernaya-bruschatka/',
                                ],
                                [
                                    'title' => 'Бетонная тротуарная плитка',
                                    'uri' => '/betonnaya-trotuarnaya-plitka/',
                                ],
                            ]
                        ],


                        [
                            'category' => [
                                'title' => 'Бордюры',
                                'uri' => '/bordury/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Дорожные',
                                    'uri' => '/bordury-dorozhnyie/',
                                ],
                                [
                                    'title' => 'Тротуарные',
                                    'uri' => '/bordury-trotuarnyie/',
                                ],
                                [
                                    'title' => 'Садовые',
                                    'uri' => '/bordury-sadovyie/',
                                ],
                            ]
                        ],

                    ]
                ],
                [
                    'title' =>  'Кладочные смеси',
                    'id' => 'assort-smesi',
                    'items' => [
                        [
                            'category' => [
                                'title' => 'Кладочные смеси',
                                'uri' => '/kladochnye-smesi/',
                            ],
                            'products' => [
                                [
                                    'title' => 'Клей для газобетона',
                                    'uri' => '/klej-dlya-gazobetona/',
                                ],
                                [
                                    'title' => 'Цветные кладочные растворы',
                                    'uri' => '/cvetnye-kladochnye-rastvory/',
                                ],
                                [
                                    'title' => 'Легкие, теплые растворы',
                                    'uri' => '/legkie-teplye-rastvory/',
                                ],
                                [
                                    'title' => 'Огнеупорные смеси',
                                    'uri' => '/ogneupornye-smesi/',
                                ],
                                [
                                    'title' => 'Нецветные смеси',
                                    'uri' => '/necvetnye-smesi/',
                                ],
                            ]
                        ],

                    ]
                ],
            ]
        ];
        break;

        // rockwool
    case 'rockwool':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'Продуктовые линейки',
                        //     'uri' => '',
                        // ],
                        'products' => [
                            [
                                'uri' => '/light-batts/',
                                'title' => 'Лайт Баттс',
                            ],
                            [
                                'uri' => '/light-batts-scandic/',
                                'title' => 'Скандик Лайт Баттс',
                            ],
                            [
                                'uri' => '/light-batts-optima/',
                                'title' => 'Лайт Баттс Оптима',
                            ],
                            [
                                'uri' => '/acoustic-batts/',
                                'title' => 'Акустик Баттс',
                            ],
                            [
                                'uri' => '/acoustic-standart/',
                                'title' => 'Акустик Стандарт',
                            ],
                            [
                                'uri' => '/standart/',
                                'title' => 'Роквул Стандарт',
                            ],
                            [
                                'uri' => '/rokvul-tekh-batts/',
                                'title' => 'Роквул Тех Баттс',
                            ],
                            [
                                'uri' => '/teh-mat/',
                                'title' => 'ТЕХ МАТ',
                            ],
                            [
                                'uri' => '/fasad-batts/',
                                'title' => 'Фасад Баттс',
                            ],
                            [
                                'uri' => '/rockfacade/',
                                'title' => 'Рокфасад',
                            ],
                            [
                                'uri' => '/venti-batts/',
                                'title' => 'Венти Баттс',
                            ],
                            [
                                'uri' => '/kaviti-batts/',
                                'title' => 'Кавити Баттс',
                            ],
                            [
                                'uri' => '/sendvich-batts/',
                                'title' => 'Сэндвич Баттс',
                            ],
                            [
                                'uri' => '/karkas-batts/',
                                'title' => 'Каркас Баттс',
                            ],
                            [
                                'uri' => '/floor-batts/',
                                'title' => 'Флор Баттс',
                            ],
                            [
                                'uri' => '/roof-batts/',
                                'title' => 'Руф Баттс',
                            ],
                            [
                                'uri' => '/plaster-batts/',
                                'title' => 'Пластер Баттс',
                            ],
                            [
                                'uri' => '/beton-element-batts/',
                                'title' => 'Бетон Элемент Баттс',
                            ],
                            [
                                'uri' => '/cilindry-navivnye/',
                                'title' => 'Цилиндры навивные',
                            ],
                            [
                                'uri' => '/sauna-batts/',
                                'title' => 'Сауна Баттс',
                            ],
                            [
                                'uri' => '/kamin-batts/',
                                'title' => 'Камин Баттс',
                            ],
                            [
                                'uri' => '/arktic/',
                                'title' => 'Арктик',
                            ],
                            [
                                'uri' => '/wired-mat/',
                                'title' => 'WIRED MAT',
                            ],
                            [
                                'uri' => '/lamella-mat-l/',
                                'title' => 'Lamella Mat',
                            ],
                            [
                                'uri' => '/fire-batts/',
                                'title' => 'Fire Batts',
                            ],
                            [
                                'uri' => '/ft-barrier/',
                                'title' => 'FT BARRIER',
                            ],
                            [
                                'uri' => '/industrial-batts-80/',
                                'title' => 'Industrial Batts 80',
                            ],
                            [
                                'uri' => '/conlit-sl-150/',
                                'title' => 'CONLIT SL 150',
                            ],
                            [
                                'uri' => '/klimafix/',
                                'title' => 'Klimafix',
                            ],
                            [
                                'uri' => '/searox/',
                                'title' => 'SeaRox',
                            ],
                            [
                                'uri' => '/prorox/',
                                'title' => 'ProRox',
                            ],
                            [
                                'uri' => '/econom/',
                                'title' => 'Эконом',
                            ],
                            [
                                'uri' => '/soput-tovary/',
                                'title' => 'Сопутствующие товары',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'По применению',
                        //     'uri' => '',
                        // ],
                        'products' => [
                            [
                            "uri" => "/dlya-trub/",
                            "title" => "Для труб",
                            ],
                            [
                            "uri" => "/dlya-krovli/",
                            "title" => "Для кровли",
                            ],
                            [
                            "uri" => "/dlya-pola/",
                            "title" => "Для пола",
                            ],
                            [
                            "uri" => "/dlya-sten/",
                            "title" => "Для стен",
                            ],
                            [
                            "uri" => "/dlya-fasada/",
                            "title" => "Для фасада",
                            ],
                            [
                            "uri" => "/pod-shtukaturku-fasada/",
                            "title" => "Под штукатурку",
                            ],
                            [
                            "uri" => "/dlya-potolka/",
                            "title" => "Для потолка",
                            ],
                            [
                            "uri" => "/dlya-perekrytij/",
                            "title" => "Для перекрытий",
                            ],
                            [
                            "uri" => "/dlya-peregorodok/",
                            "title" => "Для перегородок",
                            ],
                            [
                            "uri" => "/dlya-balkona/",
                            "title" => "Для балкона/лоджии",
                            ],
                            [
                            "uri" => "/dlya-bani-i-sauny/",
                            "title" => "Для бани",
                            ],
                            [
                            "uri" => "/dlya-kaminov/",
                            "title" => "Для печи/камина",
                            ],
                            [
                            "uri" => "/catalog/?primenenie=Для%20вентиляции",
                            "title" => "Для вентиляции",
                            ],
                            [
                            "uri" => "/dlya-mansardy/",
                            "title" => "Для мансарды",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        // 'category' =>[
                        //     "title" => "По толщине",
                        //     "uri" => "",
                        // ],
                        'products' => [
                            [
                                "uri" => "/20-mm/",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/25-mm/",
                                "title" => "25",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=27",
                                "title" => "27",
                            ],
                            [
                                "uri" => "/30-mm/",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=35",
                                "title" => "35",
                            ],
                            [
                                "uri" => "/40-mm/",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/50-mm/",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/60-mm/",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/70-mm/",
                                "title" => "70",
                            ],
                            [
                                "uri" => "/75-mm/",
                                "title" => "75",
                            ],
                            [
                                "uri" => "/80-mm/",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=90",
                                "title" => "90",
                            ],
                            [
                                "uri" => "/100-mm/",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=102",
                                "title" => "102",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=105",
                                "title" => "105",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=110",
                                "title" => "110",
                            ],
                            [
                                "uri" => "/120-mm/",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=122",
                                "title" => "122",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=130",
                                "title" => "130",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=140",
                                "title" => "140",
                            ],
                            [
                                "uri" => "/150-mm/",
                                "title" => "150",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=152",
                                "title" => "152",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=160",
                                "title" => "160",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=170",
                                "title" => "170",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=180",
                                "title" => "180",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=190",
                                "title" => "190",
                            ],
                            [
                                "uri" => "/200-mm/",
                                "title" => "200",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=210",
                                "title" => "210",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=220",
                                "title" => "220",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=230",
                                "title" => "230",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=240",
                                "title" => "240",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=250",
                                "title" => "250",
                            ],
                        ]
                    ]
                ],
            ];
        break;

        // paroc
    case 'paroc':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'Продуктовые линейки',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                'uri' => '/yumateks-termo/',
                                'title' => 'Утеплитель Юматекс Термо',
                            ],
                            [
                                'uri' => '/oem-plityi/',
                                'title' => 'OEM плиты',
                            ],
                            [
                                'uri' => '/zvukozashhitnaya-stroitelnaya-izolyacziya/',
                                'title' => 'Звукозащитная строительная изоляция',
                            ],
                            [
                                'uri' => '/lamelnyie-matyi/',
                                'title' => 'Ламельные маты',
                            ],
                            [
                                'uri' => '/matyi-dlya-ovk-i-promyishlennosti/',
                                'title' => 'Маты для овк и промышленности',
                            ],
                            [
                                'uri' => '/obshhestroitelnaya-teploizolyacziya/',
                                'title' => 'Общестроительная теплоизоляция',
                            ],
                            [
                                'uri' => '/ovk-matyi/',
                                'title' => 'Овк маты',
                            ],
                            [
                                'uri' => '/ovk-plityi/',
                                'title' => 'Овк плиты',
                            ],
                            [
                                'uri' => '/ognezashhitnaya-stroitelnaya-izolyacziya/',
                                'title' => 'Огнезащитная строительная изоляция',
                            ],
                            [
                                'uri' => '/plityi/',
                                'title' => 'Плиты',
                            ],
                            [
                                'uri' => '/proshivnyie-matyi/',
                                'title' => 'Прошивные маты',
                            ],
                            [
                                'uri' => '/teploizolyacziya-dlya-sendvich-panelej/',
                                'title' => 'Теплоизоляция для сэндвич-панелей',
                            ],
                            [
                                'uri' => '/teploizolyacziya-ploskix-krovel/',
                                'title' => 'Теплоизоляция плоских кровель',
                            ],
                            [
                                'uri' => '/teploizolyacziya-sten/',
                                'title' => 'Теплоизоляция стен',
                            ],
                            [
                                'uri' => '/teploizolyacziya-fundamenta-i-polov-na-grunte/',
                                'title' => 'Теплоизоляция фундамента и полов на грунте',
                            ],
                            [
                                'uri' => '/teploizolyacziya-shtukaturnyix-fasadov/',
                                'title' => 'Теплоизоляция штукатурных фасадов',
                            ],
                            [
                                'uri' => '/texnicheskie-otvodyi-i-segmentyi/',
                                'title' => 'Технические отводы и сегменты',
                            ],
                            [
                                'uri' => '/uteplenie-i-ognezashhita-potolkov-i-perekryitij/',
                                'title' => 'Утепление и огнезащита потолков и перекрытий',
                            ],
                            [
                                'uri' => '/cilindry/',
                                'title' => 'Цилиндры',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'По применению',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/dlya-krovli/",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                                "title" => "Для мансарды",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9",
                                "title" => "Для перекрытий",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D0%BB%D0%B0",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/dlya-fasada/",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2F%D1%86%D0%BE%D0%BA%D0%BE%D0%BB%D1%8F",
                                "title" => "Для фундамента/цоколя",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        // 'category' =>[
                        //     "uri" => "",
                        //     "title" => "По толщине",
                        // ],
                        'products' => [
                            [
                                "uri" => "/30-mm/",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/50-mm/",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=90",
                                "title" => "90",
                            ],
                            [
                                "uri" => "/100-mm/",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=117",
                                "title" => "117",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=122",
                                "title" => "122",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=126",
                                "title" => "126",
                            ],
                            [
                                "uri" => "/150-mm/",
                                "title" => "150",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=151",
                                "title" => "151",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=350",
                                "title" => "350",
                            ],
                        ]
                    ]
                ],
            ];
        break;

        // pro-fanera
    case 'pro-fanera':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
                [
                    'title' => 'По сорту',
                    'id' => 'assort-sort',
                    'id-svg' => 'assort-kompozitnaya',
                    'uri' => ''
                ],
                [
                    'title' => 'По размеру',
                    'id' => 'assort-size',
                    'id-svg' => 'assort-plitka',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'Продуктовые линейки',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                'title' => 'Фанера ФК',
                                'uri' => '/fanera-fk/',
                            ],
                            [
                                'title' => 'Фанера ФСФ',
                                'uri' => '/fanera-fsf/',
                            ],
                            [
                                'title' => 'Ламинированная фанера',
                                'uri' => '/laminirovannaya-fanera/',
                            ],
                            [
                                'title' => 'Транспортная фанера',
                                'uri' => '/transportnaya-fanera/',
                            ],
                            [
                                'title' => 'Бакелитовая фанера ФБВ',
                                'uri' => '/bakelitovaya-fanera/',
                            ],
                            [
                                'title' => 'Бакелитовая фанера ФБС',
                                'uri' => '/bakelitovaya-fanera/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'По применению',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                "title" => "Для пола",
                                "uri" => "/fanera-dlya-pola/",
                            ],
                            [
                                "title" => "Для лодки",
                                "uri" => "/fanera-dlya-lodok/",
                            ],
                            [
                                "title" => "Для опалубки",
                                "uri" => "/fanera-dlya-opalubki/",
                            ],
                            [
                                "title" => "Для лазерной резки",
                                "uri" => "/fanera-dlya-lazernoj-rezki/",
                            ],
                            [
                                "title" => "Для мебели",
                                "uri" => "/fanera-dlya-mebeli/",
                            ],
                            [
                                "title" => "Для игрушек",
                                "uri" => "/fanera-dlya-igrushek/",
                            ],
                            [
                                "title" => "Для потолка",
                                "uri" => "/fanera-dlya-potolka/",
                            ],
                            [
                                "title" => "Для стен",
                                "uri" => "/fanera-dlya-sten/",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        // 'category' =>[
                        //     "uri" => "",
                        //     "title" => "По толщине",
                        // ],
                        'products' => [
                            [
                                "title" => "3 мм",
                                "uri" => "/fanera-3-mm/",
                            ],
                            [
                                "title" => "4 мм",
                                "uri" => "/fanera-4-mm/",
                            ],
                            [
                                "title" => "5 мм",
                                "uri" => "/fanera-5-mm/",
                            ],
                            [
                                "title" => "6 мм",
                                "uri" => "/fanera-6-mm/",
                            ],
                            [
                                "title" => "6.5 мм",
                                "uri" => "/fanera-6.5-mm/",
                            ],
                            [
                                "title" => "7 мм",
                                "uri" => "/fanera-7-mm/",
                            ],
                            [
                                "title" => "8 мм",
                                "uri" => "/fanera-8-mm/",
                            ],
                            [
                                "title" => "9 мм",
                                "uri" => "/fanera-9-mm/",
                            ],
                            [
                                "title" => "10 мм",
                                "uri" => "/fanera-10-mm/",
                            ],
                            [
                                "title" => "12 мм",
                                "uri" => "/fanera-12-mm/",
                            ],
                            [
                                "title" => "15 мм",
                                "uri" => "/fanera-15-mm/",
                            ],
                            [
                                "title" => "18 мм",
                                "uri" => "/fanera-18-mm/",
                            ],
                            [
                                "title" => "20 мм",
                                "uri" => "/fanera-20-mm/",
                            ],
                            [
                                "title" => "21 мм",
                                "uri" => "/fanera-21-mm/",
                            ],
                            [
                                "title" => "24 мм",
                                "uri" => "/fanera-24-mm/",
                            ],
                            [
                                "title" => "27 мм",
                                "uri" => "/fanera-27-mm/",
                            ],
                            [
                                "title" => "30 мм",
                                "uri" => "/fanera-30-mm/",
                            ],
                            [
                                "title" => "35 мм",
                                "uri" => "/fanera-35-mm/",
                            ],
                            [
                                "title" => "40 мм",
                                "uri" => "/fanera-40-mm/",
                            ],
                        ]
                    ]
                ],
            ];
        $result['contents'][] =
            [
                'id' => 'assort-sort',
                'items' => [
                    [
                        // 'category' =>[
                        //     "uri" => "",
                        //     "title" => "По толщине",
                        // ],
                        'products' => [
                            [
                                "title" => "Сорт 1/1",
                                "uri" => "/fanera-sort-11/"
                            ],
                            [
                                "title" => "Сорт 1/2",
                                "uri" => "/fanera-sort-12/"
                            ],
                            [
                                "title" => "Сорт 1/3",
                                "uri" => "/fanera-sort-13/"
                            ],
                            [
                                "title" => "Сорт 2/2",
                                "uri" => "/fanera-sort-22/"
                            ],
                            [
                                "title" => "Сорт 2/3",
                                "uri" => "/fanera-sort-23/"
                            ],
                            [
                                "title" => "Сорт 2/4",
                                "uri" => "/fanera-sort-24/"
                            ],
                            [
                                "title" => "Сорт 3/3",
                                "uri" => "/fanera-sort-33/"
                            ],
                            [
                                "title" => "Сорт 3/4",
                                "uri" => "/fanera-sort-34/"
                            ],
                            [
                                "title" => "Сорт 4/4",
                                "uri" => "/fanera-sort-44/"
                            ],
                            [
                                "title" => "Строительная",
                                "uri" => "/fanera-stroitelnaya/"
                            ],
                            [
                                "title" => "ФБВ",
                                "uri" => "/fanera-fbv/"
                            ],
                            [
                                "title" => "ФБС",
                                "uri" => "/fanera-fbs/"
                            ],
                        ]
                    ]
                ],
            ];
        $result['contents'][] =
            [
                'id' => 'assort-size',
                'items' => [
                    [
                        // 'category' =>[
                        //     "uri" => "",
                        //     "title" => "По толщине",
                        // ],
                        'products' => [
                            [
                                "title" => "1525х1525 мм",
                                "uri" => "/fanera-1525-1525-mm/"
                            ],
                            [
                                "title" => "1220х2440 мм",
                                "uri" => "/fanera-1220-2440-mm/"
                            ],
                            [
                                "title" => "1250х2500 мм",
                                "uri" => "/fanera-1250-2500-mm/"
                            ],
                            [
                                "title" => "1270х1525 мм",
                                "uri" => "/fanera-1270-1525-mm/"
                            ],
                            [
                                "title" => "1500х3000 мм",
                                "uri" => "/fanera-1500-3000-mm/"
                            ],
                            [
                                "title" => "1525х3050 мм",
                                "uri" => "/fanera-1525-3050-mm/"
                            ],
                        ]
                    ]
                ],
            ];
        break;

        // tn
    case 'tn':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
                [
                    'title' => 'Мягкая кровля Технониколь',
                    'id' => 'soft-roof-technonikol',
                    //'id-svg' => '',
                    'img' => 'assets/template/img/svg-sprite/roof.svg',
                    'uri' => '/myagkaya-krovlya-texnonikol/'
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'Продуктовые линейки',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                'title' => 'XPS Техноплекс',
                                'uri' => '/tekhnonikol-tekhnopleks/',
                            ],
                            [
                                'title' => 'Мат Техно',
                                'uri' => '/mat-tekhno/',
                            ],
                            [
                                'title' => 'Плита Техно ОЗБ',
                                'uri' => '/plita-tekhno-ozb/',
                            ],
                            [
                                'title' => 'Плита Техно ОЗД',
                                'uri' => '/plita-tekhno-ozd/',
                            ],
                            [
                                'title' => 'Плита Техно ОЗМ',
                                'uri' => '/plita-tekhno-ozm/',
                            ],
                            [
                                'title' => 'Плита Техно Т',
                                'uri' => '/plita-tekhno-t/',
                            ],
                            [
                                'title' => 'Полимерные гидроизоляционные мембраны',
                                'uri' => '/polimernye-gidroizolyacionnye-membrany/',
                            ],
                            [
                                'title' => 'Рулонная звукоизоляция',
                                'uri' => '/rulonnaya-zvukoizolyaciya/',
                            ],
                            [
                                'title' => 'Сопутствующие товары Технониколь',
                                'uri' => '/soputstvuyushchie-tovary/',
                            ],
                            [
                                'title' => 'Технониколь Carbon',
                                'uri' => '/carbon/',
                            ],
                            [
                                'title' => 'Технониколь GreenGuard',
                                'uri' => '/tekhnonikol-greenguard/',
                            ],
                            [
                                'title' => 'Технониколь LOGICPIR',
                                'uri' => '/tekhnonikol-logicpir/',
                            ],
                            [
                                'title' => 'Технониколь Базалит',
                                'uri' => '/bazalit/',
                            ],
                            [
                                'title' => 'Технониколь Изобокс',
                                'uri' => '/tekhnonikol-izoboks/',
                            ],
                            [
                                'title' => 'Технониколь Плиты PIR',
                                'uri' => '/plity-pir/',
                            ],
                            [
                                'title' => 'Технониколь Роклайт',
                                'uri' => '/tekhnonikol-roklajt/',
                            ],
                            [
                                'title' => 'Технониколь Сегменты и Полуцилиндры XPS',
                                'uri' => '/tekhnonikol-segmenty-i-polucilindry-xps/',
                            ],
                            [
                                'title' => 'Технониколь Сэндвич Ц-XPS',
                                'uri' => '/tekhnonikol-sendvich-tekhnonikol-c-xps/',
                            ],
                            [
                                'title' => 'Технониколь Теплоролл',
                                'uri' => '/tekhnonikol-teploroll/',
                            ],
                            [
                                'title' => 'Технониколь Техноакустик',
                                'uri' => '/zvukoizolyaciya-tekhnonikol-tekhnoakustik/',
                            ],
                            [
                                'title' => 'Технониколь Техноблок',
                                'uri' => '/tekhnoblok/',
                            ],
                            [
                                'title' => 'Технониколь Техновент',
                                'uri' => '/tekhnovent/',
                            ],
                            [
                                'title' => 'Технониколь Технолайт',
                                'uri' => '/tekhnolajt/',
                            ],
                            [
                                'title' => 'Технониколь Техноруф',
                                'uri' => '/tekhnoruf/',
                            ],
                            [
                                'title' => 'Технониколь Техносэндвич',
                                'uri' => '/tekhnosendvich/',
                            ],
                            [
                                'title' => 'Технониколь Технофас',
                                'uri' => '/tekhnofas/',
                            ],
                            [
                                'title' => 'Технониколь Технофлор',
                                'uri' => '/uteplitel-tekhnonikol-tekhnoflor/',
                            ],
                            [
                                'title' => 'Технониколь Штукатурный фасад',
                                'uri' => '/tekhnonikol-shtukaturnyj-fasad/',
                            ],
                            [
                                'title' => 'Технониколь Шумоизоляция',
                                'uri' => '/tekhnonikol-master-zvukozashchita/',
                            ],
                            [
                                'title' => 'Цилиндр Техно',
                                'uri' => '/cilindr-tekhno/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'По применению',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                "uri" => "/dlya-krovli/",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                                "title" => "Для мансарды",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/dlya-perekrytij/",
                                "title" => "Для перекрытий",
                            ],
                            [
                                "uri" => "/dlya-pola/",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/dlya-fasada/",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/dlya-sten/",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BE%D0%BA%D0%BE%D0%BD",
                                "title" => "Для окон",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%9F%D0%BE%D0%B4+%D1%88%D1%82%D1%83%D0%BA%D0%B0%D1%82%D1%83%D1%80%D0%BA%D1%83",
                                "title" => "Под штукатурку",
                            ],
                            [
                                "uri" => "/dlya-balkona/",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/dlya-fundamenta/",
                                "title" => "Для фундамента/цоколя",
                            ],
                            [
                                "uri" => "/dlya-potolka/",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/dlya-ventfasada/",
                                "title" => "Для вентиляции",
                            ],
                            [
                                "uri" => "/dlya-trub/",
                                "title" => "Для труб",
                            ],
                            [
                                "uri" => "/dlya-bani-i-sauny/",
                                "title" => "Для бани",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B9+%D0%BA%D0%BE%D0%BC%D0%BD%D0%B0%D1%82%D1%8B",
                                "title" => "Для ванной комнаты",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B4%D0%B2%D0%B5%D1%80%D0%B5%D0%B9+%D0%B8+%D0%B2%D0%BE%D1%80%D0%BE%D1%82",
                                "title" => "Для дверей и ворот",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        // 'category' =>[
                        //     "uri" => "",
                        //     "title" => "По толщине",
                        // ],
                        'products' => [
                            [
                                "uri" => "/5-mm/",
                                "title" => "5",
                            ],
                            [
                                "uri" => "/10-mm/",
                                "title" => "10",
                            ],
                            [
                                "uri" => "/20-mm/",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=22",
                                "title" => "22",
                            ],
                            [
                                "uri" => "/30-mm/",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/40-mm/",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/50-mm/",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=55",
                                "title" => "55",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=60",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/70-mm/",
                                "title" => "70",
                            ],
                            [
                                "uri" => "/80-mm/",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=90",
                                "title" => "90",
                            ],
                            [
                                "uri" => "/100-mm/",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=110",
                                "title" => "110",
                            ],
                            [
                                "uri" => "/120-mm/",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=130",
                                "title" => "130",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=140",
                                "title" => "140",
                            ],
                            [
                                "uri" => "/150-mm/",
                                "title" => "150",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=160",
                                "title" => "160",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=170",
                                "title" => "170",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=180",
                                "title" => "180",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=190",
                                "title" => "190",
                            ],
                            [
                                "uri" => "/200-mm/",
                                "title" => "200",
                            ],
                        ]
                    ]
                ],
            ];

            $result['contents'][] =
            [
                'id' => 'soft-roof-technonikol',
                'items' => [
                    [
                        // 'category' => [
                        //     'title' => 'Продуктовые линейки',
                        //     'uri' => '/keramicheskie-oblicovochnye/',
                        // ],
                        'products' => [
                            [
                                'title' => 'Технониколь Шинглас Фокстрот',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-fokstrot/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Джаз',
                                'uri' => '/myagkaya-krovlya-texnonikol/gibkaya-cherepica-tekhnonikol-shinglas-dzhaz/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Атлантика',
                                'uri' => '/myagkaya-krovlya-texnonikol/gibkaya-cherepicza-texnonikol-atlantika/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Вестерн',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-vestern/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Кантри',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-kantri/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Фазенда',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-fazenda/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Ранчо',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-rancho/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Фламенко',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-flamenko/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Финская',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-finskaya/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Ультра',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-ultra/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Классик',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-klassik/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Континент',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-kontinent/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Комфорт',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-komfort/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Оптима',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepica-tekhnonikol-shinglas-optima/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Соната',
                                'uri' => '/myagkaya-krovlya-texnonikol/tekhnonikol-shinglas-sonata/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Кадриль',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepicza-texnonikol-shinglas-kadril/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Аккорд',
                                'uri' => '/myagkaya-krovlya-texnonikol/texnonikol-shinglas-akkord/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Болеро',
                                'uri' => '/myagkaya-krovlya-texnonikol/bolero/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Сальса',
                                'uri' => '/myagkaya-krovlya-texnonikol/salsa/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Блюз',
                                'uri' => '/myagkaya-krovlya-texnonikol/texnonikol-shinglas-blyuz/',
                            ],
                            [
                                'title' => 'Технониколь Шинглас Модерн',
                                'uri' => '/myagkaya-krovlya-texnonikol/mnogoslojnaya-cherepicza-texnonikol-shinglas-modern/',
                            ]
                        ]
                    ]
                ]

            ];
            
        break;


        // [ursa] minvata-spb.ru
    case 'ursa':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/geo/',
                                'title' => 'Ursa GEO',
                            ],
                            [
                                'uri' => '/pureone/',
                                'title' => 'Ursa Pureone',
                            ],
                            [
                                'uri' => '/ursa-seco/',
                                'title' => 'Ursa Seco',
                            ],
                            [
                                'uri' => '/xps/',
                                'title' => 'Ursa XPS',
                            ],
                            [
                                'uri' => '/terra/',
                                'title' => 'Ursa Терра',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/dlya-bani-i-sauny/",
                                "title" => "Для бани",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                                "title" => "Для вентиляции",
                            ],
                            [
                                "uri" => "/dlya-kryshi/",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/dlya-perekrytij/",
                                "title" => "Для перекрытий",
                            ],
                            [
                                "uri" => "/dlya-pola/",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/dlya-potolka/",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/dlya-sten/",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/dlya-trub/",
                                "title" => "Для труб",
                            ],
                            [
                                "uri" => "/dlya-fasada/",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/dlya-fundamenta/",
                                "title" => "Для фундамента/цоколя",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/20-mm/",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=25",
                                "title" => "25",
                            ],
                            [
                                "uri" => "/30-mm/",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=40",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/50-mm/",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=60",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/80-mm/",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/100-mm/",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=130",
                                "title" => "130",
                            ],
                            [
                                "uri" => "/150-mm/",
                                "title" => "150",
                            ],
                            [
                                "uri" =>  "/catalog/?item_thickness=180",
                                "title" => "180",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=200",
                                "title" => "200",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=1200",
                                "title" => "1200",
                            ],
                        ]
                    ]
                ],
            ];
        break;



        // [penoplex] plity-epps.ru
    case 'penoplex':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/45/',
                                'title' => 'Пеноплэкс 45',
                            ],
                            [
                                'uri' => '/geo/',
                                'title' => 'Пеноплэкс ГЕО',
                            ],
                            [
                                'uri' => '/komfort/',
                                'title' => 'Пеноплэкс Комфорт',
                            ],
                            [
                                'uri' => '/krovlya/',
                                'title' => 'Пеноплэкс Кровля',
                            ],
                            [
                                'uri' => '/osnova/',
                                'title' => 'Пеноплэкс Основа',
                            ],
                            [
                                'uri' => '/segmenty/',
                                'title' => 'Пеноплэкс Сегменты',
                            ],
                            [
                                'uri' => '/stena/',
                                'title' => 'Пеноплэкс Стена',
                            ],
                            [
                                'uri' => '/uklon/',
                                'title' => 'Пеноплэкс Уклон',
                            ],
                            [
                                'uri' => '/fasad/',
                                'title' => 'Пеноплэкс Фасад',
                            ],
                            [
                                'uri' => '/fundament/',
                                'title' => 'Пеноплэкс Фундамент',
                            ],
                            [
                                'uri' => '/extream/',
                                'title' => 'Пеноплэкс Экстрим',
                            ],
                            [
                                'uri' => '/sop-tovary/',
                                'title' => 'Сопутствующие товары Penoplex',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/penoplex-dlya-balkona/",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/penoplex-dlya-pola/",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/penoplex-dlya-sten/",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/penoplex-dlya-fundamenta/",
                                "title" => "Для фундамента/цоколя",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/penoplex-dlya-krovli/",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                                "title" => "Для вентиляции",
                            ],
                            [
                                "uri" => "/penoplex-dlya-trub/",
                                "title" => "Для труб",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/penoplex-20-mm/",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/penoplex-30-mm/",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=30.4",
                                "title" => "30.4",
                            ],
                            [
                                "uri" => "/penoplex-40-mm/",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/penoplex-50-mm/",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/penoplex-60-mm/",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/penoplex-80-mm/",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/penoplex-100-mm/",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/penoplex-120-mm/",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/penoplex-150-mm/",
                                "title" => "150",
                            ],
                        ]
                    ]
                ],
            ];
        break;

        // [isover] minvata-178.ru
    case 'isover':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                                        [
                                            'uri' => '/karkas/',
                                            'title' => 'Изовер Каркас'
                                        ],
                                        [
                                            'uri' => '/teplye-steny/',
                                            'title' => 'Изовер Теплые Стены'
                                        ],
                                        [
                                            'uri' => '/optimal/',
                                            'title' => 'Изовер Оптимал'
                                        ],
                                        [
                                            'uri' => '/ventfasad/',
                                            'title' => 'Изовер ВентФасад'
                                        ],
                                        [
                                            'uri' => '/kv-050/',
                                            'title' => 'Изовер KV-050'
                                        ],
                                        [
                                            'uri' => '/izover-poly-i-perekrytiya/',
                                            'title' => 'Изовер Полы и Перекрытия'
                                        ],
                                        [
                                            'uri' => '/plavayuschii-pol/',
                                            'title' => 'Изовер Плавающий пол'
                                        ],
                                        [
                                            'uri' => '/ol/',
                                            'title' => 'Изовер OL'
                                        ],
                                        [
                                            'uri' => '/skatnaya-krovlya/',
                                            'title' => 'Изовер Скатная Кровля'
                                        ],
                                        [
                                            'uri' => '/karkasnyi-dom/',
                                            'title' => 'Изовер Каркасный дом'
                                        ],
                                        [
                                            'uri' => '/izover-klassik/',
                                            'title' => 'Изовер Классик'
                                        ],

                                        [
                                            'uri' => '/teplyj-dom/',
                                            'title' => 'Изовер Теплый Дом'
                                        ],
                                        [
                                            'uri' => '/sauna/',
                                            'title' => 'Изовер Сауна'
                                        ],
                                        [
                                            'uri' => '/ruf/',
                                            'title' => 'Изовер Руф'
                                        ],
                                        [
                                            'uri' => '/uteplitel-zvukozaschita/',
                                            'title' => 'Изовер Звукозащита'
                                        ],
                                        [
                                            'uri' => '/teplaya-krysha/',
                                            'title' => 'Изовер Теплая Крыша'
                                        ],
                                        [
                                            'uri' => '/profi/',
                                            'title' => 'Изовер Профи'
                                        ],
                                        [
                                            'uri' => '/izover-special-tvin/',
                                            'title' => 'Изовер Специал Твин'
                                        ],
                                        [
                                            'uri' => '/shtukaturnyi-fasad/',
                                            'title' => 'Изовер Штукатурный фасад'
                                        ],
                                        [
                                            'uri' => '/kt-special/',
                                            'title' => 'Изовер КТ-Специал'
                                        ],
                                        [
                                            'uri' => '/master-teplyh-sten/',
                                            'title' => 'Изовер Мастер Теплых Стен'
                                        ],
                                        [
                                            'uri' => '/master-akustiki/',
                                            'title' => 'Изовер Мастер Акустики'
                                        ],

                                        [
                                            'uri' => '/fasad/',
                                            'title' => 'Изовер Фасад'
                                        ],
                                        [
                                            'uri' => '/venti/',
                                            'title' => 'Изовер Венти'
                                        ],
                                        [
                                            'uri' => '/kim-al/',
                                            'title' => 'Изовер KIM-AL'
                                        ],
                                        [
                                            'uri' => '/standart/',
                                            'title' => 'Изовер Стандарт'
                                        ],
                                        [
                                            'uri' => '/sendvich-life/',
                                            'title' => 'Изовер Сэндвич Лайф'
                                        ],
                                        [
                                            'uri' => '/teplo-i-tiho/',
                                            'title' => 'Изовер Тепло и Тихо'
                                        ],
                                        [
                                            'uri' => '/tihiy-dom/',
                                            'title' => 'Изовер Тихий Дом'
                                        ],
                                        [
                                            'uri' => '/flor/',
                                            'title' => 'Изовер Флор'
                                        ],
                                        [
                                            'uri' => '/akustik/',
                                            'title' => 'Изовер Акустик'
                                        ],
                                        [
                                            'uri' => '/lait/',
                                            'title' => 'Изовер Лайт'
                                        ],
                                        [
                                            'uri' => '/master-teplyh-kryh/',
                                            'title' => 'Изовер Мастер Теплых Крыш'
                                        ],
                                        [
                                            'uri' => '/sop-tovary/',
                                            'title' => 'Сопутствующие товары Изовер'
                                        ],
                                    ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/dlya-bani/",
                                "title" => "Для бани",
                            ],
                            [
                                "uri" => "/dlya-krovli/",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                                "title" => "Для мансарды",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/dlya-perekrytij/",
                                "title" => "Для перекрытий",
                            ],
                            [
                                "uri" => "/dlya-pola/",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/dlya-trub/",
                                "title" => "Для труб",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2F%D1%86%D0%BE%D0%BA%D0%BE%D0%BB%D1%8F",
                                "title" => "Для фундамента/цоколя",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/20-mm/",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=25",
                                "title" => "25",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=30",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=40",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/50-mm/",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=60",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=65",
                                "title" => "65",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=75",
                                "title" => "75",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=80",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/100-mm/",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=120",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/150-mm/",
                                "title" => "150",
                            ],
                        ]
                    ]
                ],
            ];
        break;

        // [web] minvata-78.ru KNAUF
    case 'knauf':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/greenterm/',
                                'title' => 'GreenTERM',
                            ],
                            [
                                'uri' => '/professionalniy-segment-knauf-insuleyshn/',
                                'title' => 'Knauf Insulation',
                            ],
                            [
                                'uri' => '/knauf-ekoroll/',
                                'title' => 'Knauf Экоролл',
                            ],
                            [
                                'uri' => '/akustiknauf/',
                                'title' => 'АкустиКНАУФ',
                            ],
                            [
                                'uri' => '/knauf-membrany/',
                                'title' => 'Кнауф мембраны',
                            ],
                            [
                                'uri' => '/therm/',
                                'title' => 'Кнауф Терм',
                            ],
                            [
                                'uri' => '/knauf-tisma/',
                                'title' => 'Кнауф Тисма',
                            ],
                            [
                                'uri' => '/teploknauf/',
                                'title' => 'ТеплоКНАУФ',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BD%D0%B8",
                                "title" => "Для бани",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                                "title" => "Для вентиляции",
                            ],
                            [
                                "uri" => "/dlya-kryshi/",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                                "title" => "Для мансарды",
                            ],
                            [
                                "uri" => "/dlya-peregorodok/",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/dlya-perekrytij/",
                                "title" => "Для перекрытий",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%87%D0%B8%2F%D0%BA%D0%B0%D0%BC%D0%B8%D0%BD%D0%B0",
                                "title" => "Для печи/камина",
                            ],
                            [
                                "uri" => "/dlya-pola/",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%82%D1%80%D1%83%D0%B1",
                                "title" => "Для труб",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2F%D1%86%D0%BE%D0%BA%D0%BE%D0%BB%D1%8F",
                                "title" => "Для фундамента/цоколя",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%9F%D0%BE%D0%B4+%D1%88%D1%82%D1%83%D0%BA%D0%B0%D1%82%D1%83%D1%80%D0%BA%D1%83",
                                "title" => "Под штукатурку",
                            ]
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?item_thickness=20",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=27",
                                "title" => "27",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=30",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=40",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=45",
                                "title" => "45",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=47",
                                "title" => "47",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=50",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=60",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=70",
                                "title" => "70",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=75",
                                "title" => "75",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=80",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=90",
                                "title" => "90",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=100",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=110",
                                "title" => "110",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=120",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=150",
                                "title" => "150",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=180",
                                "title" => "180",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=200",
                                "title" => "200",
                            ],
                        ]
                    ]
                ],
            ];
        break;

        // [isorok] minvataspb78.ru
    case 'isorok':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            ["uri" => "izolait", "title" => "Изолайт"],
                            ["uri" => "izovent", "title" => "Изовент"],
                            ["uri" => "izokor-s", "title" => "Изокор-С"],
                            ["uri" => "izoruf", "title" => "Изоруф"],
                            ["uri" => "izofas", "title" => "Изофас"],
                            ["uri" => "izoflor", "title" => "Изофлор"],
                            ["uri" => "p-125", "title" => "П-125"],
                            ["uri" => "p-75", "title" => "П-75"],
                            ["uri" => "pp-60", "title" => "ПП-60"],
                            ["uri" => "pp-75", "title" => "ПП-75"],
                            ["uri" => "pp-80", "title" => "ПП-80"],
                            ["uri" => "ultralajt", "title" => "УльтраЛайт"],
                            ["uri" => "super-tepliy", "title" => "Супер Теплый"],
                            ["uri" => "plita-po-gostu", "title" => "Плита по ГОСТу "],
                            ["uri" => "termozashhita", "title" => "Термозащита"],
                            ["uri" => "klin", "title" => "Клин"],
                            ["uri" => "komplektuyushhie-tovary", "title" => "Комплектующие товары"],
                            ["uri" => "polimernyie-gidroizolyaczionnyie-membranyi", "title" => "Полимерные гидроизоляционные мембраны"]
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                                "title" => "Для балкона/лоджии",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                                "title" => "Для вентиляции",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8",
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                                "title" => "Для мансарды",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                                "title" => "Для перегородок",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9",
                                "title" => "Для перекрытий",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%87%D0%B8%2F%D0%BA%D0%B0%D0%BC%D0%B8%D0%BD%D0%B0",
                                "title" => "Для печи/камина",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%BB%D0%B0",
                                "title" => "Для пола",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                                "title" => "Для потолка",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D0%B0%D0%B9%D0%B4%D0%B8%D0%BD%D0%B3%D0%B0",
                                "title" => "Для сайдинга",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                                "title" => "Для стен",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%82%D1%80%D1%83%D0%B1",
                                "title" => "Для труб",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                                "title" => "Для фасада",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%9A%D1%80%D1%8B%D1%88%D0%B8",
                                "title" => "Крыши",
                            ]
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?item_thickness=1.2",
                                "title" => "1.2",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=1.5",
                                "title" => "1.5",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=27",
                                "title" => "27",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=30",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=40",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=50",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=60",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=70",
                                "title" => "70",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=80",
                                "title" => "80",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=90",
                                "title" => "90",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=100",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=110",
                                "title" => "110",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=120",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=130",
                                "title" => "130",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=140",
                                "title" => "140",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=150",
                                "title" => "150",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=160",
                                "title" => "160",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=170",
                                "title" => "170",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=180",
                                "title" => "180",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=190",
                                "title" => "190",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=200",
                                "title" => "200",
                            ],
                        ]
                    ]
                ],
            ];
        break;

    case 'onduline1':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ],
            'contents' => [
                [
                    'id' => 'assort-groups',
                    'items' => [
                        [
                            'products' => [
                                ["uri" => "cherepica-ondulin", "title" => "Черепица Ондулин"],
                                ["uri" => "cherepica-ondulin-diy", "title" => "Черепица Ондулин DIY"],
                                ["uri" => "cherepica-ondulin-smart", "title" => "Ондулин Смарт"],
                                ["uri" => "cherepica-ondulin-smart-diy", "title" => "Ондулин Смарт DIY"],
                                ["uri" => "onduvilla", "title" => "Ондувилла"],
                                ["uri" => "cherepica-ondalux", "title" => "Ондалюкс"],
                                ["uri" => "ondutiss", "title" => "Пленки и мембраны Ондутисс"],
                                ["uri" => "komplektuyushhie-dlya-ondulina", "title" => "Сопутствующие товары"],
                            ]
                        ]
                    ]

                ],
                [
                    'id' => 'assort-application',
                    'items' => [
                        [
                            'products' => [
                                ["uri" => "catalog/?primenenie=Для вентилируемых фасадов", "title" => "Для вентилируемых фасадов"],
                                ["uri" => "catalog/?primenenie=Для дома", "title" => "Для дома"],
                                ["uri" => "catalog/?primenenie=Для кровли", "title" => "Для кровли"],
                                ["uri" => "catalog/?primenenie=Для мансарды", "title" => "Для мансарды"],
                                ["uri" => "catalog/?primenenie=Для перекрытий", "title" => "Для перекрытий"],
                                ["uri" => "catalog/?primenenie=Для подкровельного пространства", "title" => "Для подкровельного пространства"],
                                ["uri" => "catalog/?primenenie=Для стен", "title" => "Для стен"],
                                ["uri" => "catalog/?primenenie=Для чердака", "title" => "Для чердака"],
                            ]
                        ]
                    ]

                ],
                [
                    'id' => 'assort-thickness',
                    'items' => [
                        [
                            'products' => [
                                ["uri" => "catalog/?item_thickness=1.5", "title" => "1.5"],
                                ["uri" => "catalog/?item_thickness=1.9", "title" => "1.9"],
                                ["uri" => "catalog/?item_thickness=2.2", "title" => "2.2"],
                                ["uri" => "catalog/?item_thickness=3", "title" => "3"],
                                ["uri" => "catalog/?item_thickness=3.1", "title" => "3.1"],
                                ["uri" => "catalog/?item_thickness=3.3", "title" => "3.3"],
                                ["uri" => "catalog/?item_thickness=19", "title" => "19"],
                            ]
                        ]
                    ]

                ]
            ]
        ];

        break;

        // [umatex] minvataspb.ru
    case 'umatex':
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'title' => 'Юматекс Термо WAS 50',
                                'uri' => '/umatex-termo-was-50/',
                            ],
                            [
                                'title' => 'Юматекс Термо WAS 120',
                                'uri' => '/umatex-termo-was-120/',
                            ],
                            [
                                'title' => 'Юматекс Термо CGL 20',
                                'uri' => '/umatex-termo-cgl-20/',
                            ],
                            [
                                'title' => 'Юматекс Термо Fatio',
                                'uri' => '/umatex-termo-fatio/',
                            ],
                            [
                                'title' => 'Юматекс Термо FPS 14',
                                'uri' => '/umatex-termo-fps-14/',
                            ],
                            [
                                'title' => 'Юматекс Термо FPS 17',
                                'uri' => '/umatex-termo-fps-17/',
                            ],
                            [
                                'title' => 'Юматекс Термо GRS 20',
                                'uri' => '/umatex-termo-grs-20/',
                            ],
                            [
                                'title' => 'Юматекс Термо InWall',
                                'uri' => '/umatex-termo-inwall/',
                            ],
                            [
                                'title' => 'Юматекс Термо Light',
                                'uri' => '/umatex-termo-light/',
                            ],
                            [
                                'title' => 'Юматекс Термо Plus',
                                'uri' => '/umatex-termo-plus/',
                            ],
                            [
                                'title' => 'Юматекс Термо Smart',
                                'uri' => '/umatex-termo-smart-xl/',
                            ],
                            [
                                'title' => 'Юматекс Термо Linio 10',
                                'uri' => '/umatex-termo-linio-10/',
                            ],
                            [
                                'title' => 'Юматекс Термо Linio 15',
                                'uri' => '/umatex-termo-linio-15/',
                            ],
                            [
                                'title' => 'Юматекс Термо Linio 18',
                                'uri' => '/umatex-termo-linio-18/',
                            ],
                            [
                                'title' => 'Юматекс Термо Linio 20',
                                'uri' => '/umatex-termo-linio-20/',
                            ],
                            [
                                'title' => 'Юматекс Термо Linio 80',
                                'uri' => '/umatex-termo-linio-80/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROB 60',
                                'uri' => '/umatex-termo-rob-60/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROB 80',
                                'uri' => '/umatex-termo-rob-80/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROL 40',
                                'uri' => '/umatex-termo-rol-40/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROL 60',
                                'uri' => '/umatex-termo-rol-60/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROS 30',
                                'uri' => '/umatex-termo-ros-30/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROS 40',
                                'uri' => '/umatex-termo-ros-40/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROS 50',
                                'uri' => '/umatex-termo-ros-50/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROS 60',
                                'uri' => '/umatex-termo-ros-60/',
                            ],
                            [
                                'title' => 'Юматекс Термо ROS 80t',
                                'uri' => '/umatex-termo-ros-80t/',
                            ],
                            [
                                'title' => 'Юматекс Термо SSB 1',
                                'uri' => '/umatex-termo-ssb-1/',
                            ],
                            [
                                'title' => 'Юматекс Термо SSB 4',
                                'uri' => '/umatex-termo-ssb-4/',
                            ],
                            [
                                'title' => 'Юматекс Термо WAS 25',
                                'uri' => '/umatex-termo-was-25/',
                            ],
                            [
                                'title' => 'Юматекс Термо WAS 35',
                                'uri' => '/umatex-termo-was-35/',
                            ]
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "title" => "Вентилируемые фасады",
                                "uri" => "/catalog/?primenenie=%D0%92%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D0%B5%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D1%8B"
                            ],
                            [
                                "title" => "Для дверей",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B4%D0%B2%D0%B5%D1%80%D0%B5%D0%B9"
                            ],
                            [
                                "title" => "Для кровли",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8"
                            ],
                            [
                                "title" => "Для перегородок",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA"
                            ],
                            [
                                "title" => "Для перекрытий",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9"
                            ],
                            [
                                "title" => "Для подвалов",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%B2%D0%B0%D0%BB%D0%BE%D0%B2"
                            ],
                            [
                                "title" => "Для пола",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%BB%D0%B0"
                            ],
                            [
                                "title" => "Для потолка",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0"
                            ],
                            [
                                "title" => "Для стен",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D1%82%D0%B5%D0%BD"
                            ],
                            [
                                "title" => "Для труб",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%82%D1%80%D1%83%D0%B1"
                            ],
                            [
                                "title" => "Для фасада",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0"
                            ],
                            [
                                "title" => "Для фундамента",
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0"
                            ],
                            [
                                "title" => "Звукоизоляция",
                                "uri" => "/catalog/?primenenie=%D0%97%D0%B2%D1%83%D0%BA%D0%BE%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D1%8F"
                            ],
                            [
                                "title" => "Камины и печи",
                                "uri" => "/catalog/?primenenie=%D0%9A%D0%B0%D0%BC%D0%B8%D0%BD%D1%8B%20%D0%B8%20%D0%BF%D0%B5%D1%87%D0%B8"
                            ],
                            [
                                "title" => "Каркасные конструкции",
                                "uri" => "/catalog/?primenenie=%D0%9A%D0%B0%D1%80%D0%BA%D0%B0%D1%81%D0%BD%D1%8B%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8"
                            ],
                            [
                                "title" => "Мансарды",
                                "uri" => "/catalog/?primenenie=%D0%9C%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B"
                            ],
                            [
                                "title" => "Ненагружаемые конструкции",
                                "uri" => "/catalog/?primenenie=%D0%9D%D0%B5%D0%BD%D0%B0%D0%B3%D1%80%D1%83%D0%B6%D0%B0%D0%B5%D0%BC%D1%8B%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8"
                            ],
                            [
                                "title" => "Средний слой в кирпичной кладке",
                                "uri" => "/catalog/?primenenie=%D0%A1%D1%80%D0%B5%D0%B4%D0%BD%D0%B8%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B9%20%D0%B2%20%D0%BA%D0%B8%D1%80%D0%BF%D0%B8%D1%87%D0%BD%D0%BE%D0%B9%20%D0%BA%D0%BB%D0%B0%D0%B4%D0%BA%D0%B5"
                            ],
                            [
                                "title" => "Техническая изоляция",
                                "uri" => "/catalog/?primenenie=%D0%A2%D0%B5%D1%85%D0%BD%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D1%8F"
                            ],
                            [
                                "title" => "Универсальный",
                                "uri" => "/catalog/?primenenie=%D0%A3%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D1%81%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9"
                            ]
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?item_thickness=20",
                                "title" => "20",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=25",
                                "title" => "25",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=30",
                                "title" => "30",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=40",
                                "title" => "40",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=50",
                                "title" => "50",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=60",
                                "title" => "60",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=70",
                                "title" => "70",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=75",
                                "title" => "75",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=100",
                                "title" => "100",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=120",
                                "title" => "120",
                            ],
                            [
                                "uri" => "/catalog/?item_thickness=150",
                                "title" => "150",
                            ],
                        ]
                    ]
                ],
            ];
        break;


    case 'ceresit':
        $result = [
            'navigations' => [
                [
                    'title' => 'Утепление фасадов Ceresit',
                    'id' => 'uteplenie_fasadov',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/001.webp',
                    'uri' => '/uteplenie-fasadov/'
                ],
                [
                    'title' => 'Плиточная облицовка Ceresit',
                    'id' => 'plitochnie_oblicovka',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/005.webp',
                    'uri' => '/plitochnaya-oblicovka/'
                ],
                [
                    'title' => 'Устройство полов Ceresit',
                    'id' => 'ustroystvo_polov',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/002.webp',
                    'uri' => '/ustroystvo-polov/'
                ],
                [
                    'title' => 'Устройство гидроизоляции Ceresit',
                    'id' => 'ustroystvo_gidroisolacii',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/006.webp',
                    'uri' => '/ustroystvo-gidroizolyacii/'
                ],
                [
                    'title' => 'Отделка стен Ceresit',
                    'id' => 'otdelka_sten',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/004.webp',
                    'uri' => '/otdelka-sten/'
                ],
                [
                    'title' => 'Кладочные и ремонтные смеси Ceresit',
                    'id' => 'kladochnie_smesi',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/003.webp',
                    'uri' => '/kladochnye-i-remontnye-smesi/'
                ],
                [
                    'title' => 'Герметики и клеи Ceresit',
                    'id' => 'germetiki_i_klei',
                    'id-svg' => '',
                    'img'=>'assets/template/img/menu_ico/ceresit/007.webp',
                    'uri' => '/germetiki-i-klei/'
                ],
            ],
           
        ];
        $result['contents'][] = [
            'id' => 'uteplenie_fasadov',
            'items' => [
                [
                    'products' => [
                        [
                            "title" => "Грунтовки Ceresit",
                            "uri" => "/gruntovki/",
                        ],
                        [
                            "title" => "Декоративные штукатурки Ceresit ",
                            "uri" => "/dekorativnye-shtukaturki/",
                        ],
    
                        [
                            "title" => "Дюбеля для крепления утеплителя Ceresit ",
                            "uri" => "/dyubelya-dlya-krepleniya-uteplitelya/",
                        ],
                        [
                            "title" => "Коллекция Visage Ceresit",
                            "uri" => "/kollekciya-visage/",
                        ],
                        [
                            "title" => "Краски Ceresit",
                            "uri" => "/kraski/",
                        ],
                        [
                            "title" => "Профили для мокрого фасада Ceresit",
                            "uri" => "/profili-dlya-mokrogo-fasada/",
                        ],
                        [
                            "title" => "Фасадные сетки Ceresit",
                            "uri" => "/fasadnye-setki/",
                        ],
                        [
                            "title" => "Штукатурно-клеевые составы Ceresit",
                            "uri" => "/shtukaturno-kleevye-sostavy/",
                        ],
                    ]
                ]
                
            ]
        ];
        $result['contents'][] = [
            'id' => 'plitochnie_oblicovka',
            'items' => [
                
                [
                    'products' => [
                        [
                            "title" => "Гидроизоляция под плитку Ceresit",
                            "uri" => "/gidroizolyaciya-pod-plitku/",
                        ],
                        [
                            "title" => "Затирки Ceresit",
                            "uri" => "/zatirki/",
                        ],
    
                        [
                            "title" => "Клеи для плитки Ceresit",
                            "uri" => "/klei-dlya-plitki/",
                        ],
                        [
                            "title" => "Сопутствующие материалы Ceresit",
                            "uri" => "/soputstvuyushhie-materialyi/",
                        ],
                        
                    ]
                ]
            ]
        ];
        $result['contents'][] = [
            'id' => 'ustroystvo_polov',
            'items' => [
                
                [
                    'products' => [
                        [
                            "title" => "Ровнители для пола Ceresit",
                            "uri" => "/rovniteli-dlya-pola/",
                        ],
                        [
                            "title" => "Топпинги - упрочнители для бетонных полов Ceresit",
                            "uri" => "/toppingi-uprochniteli-dlya-betonnyh-polov/",
                        ],
    
                        [
                            "title" => "Клеи для напольных покрытий Ceresit",
                            "uri" => "/klei-dlya-napolnyix-pokryitij/",
                        ],
                        
                    ]
                ]
            ]
        ];
        $result['contents'][] = [
            'id' => 'ustroystvo_gidroisolacii',
            'items' => [
                
                [
                    'products' => [
                        [
                            "title" => "Водоостанавливающие и монтажные смеси Ceresit",
                            "uri" => "/vodoostanavlivayushchie-i-montazhnye-smesi/",
                        ],
                        [
                            "title" => "Обмазочная гидроизоляция Ceresit",
                            "uri" => "/obmazochnaya-gidroizolyaciya/",
                        ],
    
                        [
                            "title" => "Санирующие материалы Ceresit",
                            "uri" => "/saniruyushchie-materialy/",
                        ],
                        
                    ]
                ]
            ]
        ];
        $result['contents'][] = [
            'id' => 'otdelka_sten',
            'items' => [
                
                [
                    'products' => [
                        [
                            "title" => "Шпаклевка Ceresit",
                            "uri" => "/shpaklevka/",
                        ],
                        [
                            "title" => "Штукатурка Ceresit",
                            "uri" => "/shtukaturka/",
                        ],
                        
                    ]
                ]
            ]
        ];
        $result['contents'][] = [
            'id' => 'kladochnie_smesi',
            'items' => [
                
                [
                    'products' => [
                        [
                            "title" => "Гидрофобизаторы Ceresit",
                            "uri" => "/gidrofobizatory/",
                        ],
                        [
                            "title" => "Кладочные смеси Ceresit",
                            "uri" => "/kladochnye-smesi/",
                        ],
                        [
                            "title" => "Ремонт бетона Ceresit",
                            "uri" => "/remont-betona/",
                        ],
                    ]
                ]
            ]
        ];
        $result['contents'][] = [
            'id' => 'germetiki_i_klei',
            'items' => [
                
                [
                    'products' => [
                        [
                            "title" => "Герметики Ceresit",
                            "uri" => "/germetiki/",
                        ],
                        [
                            "title" => "Монтажные клеи Ceresit",
                            "uri" => "/montazhnyie-klei/",
                        ],
                    ]
                ]
            ]
        ];
        break;
        // pilomat
    case 'pilomat':
        $result = [
            'navigations' => [
                [
                    'title' => 'Доска',
                    'id' => 'pilomat-doska',
                    'id-svg' => 'pilomat-doska',
                    'uri' => ''
                ],
                [
                    'title' => 'Брус',
                    'id' => 'pilomat-brus',
                    'id-svg' => 'pilomat-brus',
                    'uri' => ''
                ],
                [
                    'title' => 'Брусок',
                    'id' => 'pilomat-brusok',
                    'id-svg' => 'pilomat-brusok',
                    'uri' => ''
                ],
                [
                    'title' => 'Рейка',
                    'id' => 'pilomat-lath',
                    'id-svg' => 'pilomat-reika',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'pilomat-doska',
                'items' => [
                    [
                        'category' => [
                            'title' => 'Доска',
                            'uri' => '/prodazha-dosok/',
                        ],
                        'products' => [
                            [
                                "title" => "Доска ест. влаж.",
                                "uri" => "/doska-obreznaya/",

                            ], [
                                "title" => "Доска сухая",
                                "uri" => "/doska-obreznaya-suhaya/",

                            ], [
                                "title" => "Доска строганная",
                                "uri" => "/doska-strogannaya-suhaya/",

                            ], [
                                "title" => "Доска антисеп.",
                                "uri" => "/prodazha-dosok/?anticeptirovannaya=%D0%94%D0%B0",

                            ], [
                                "title" => "Доска из осины",
                                "uri" => "/doska-iz-osinyi/",

                            ]
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'pilomat-brus',
                'items' => [
                    [
                        'category' => [
                            'title' => 'Брус',
                            'uri' => '/brus/',
                        ],
                        'products' => [
                            [
                                "uri" => "/brus-obreznoy/",
                                "title" => "Брус ест. влаж.",
                            ],
                            [
                                "uri" => "/brus-suhoj-obreznoj/",
                                "title" => "Брус сухой",
                            ],
                            [
                                "uri" => "/brus/?vid-obrabotki=%D0%A1%D1%82%D1%80%D0%BE%D0%B3%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F",
                                "title" => "Брус строганный",
                            ],
                            [
                                "uri" => "/brus-obreznoy/?anticeptirovannaya=%D0%94%D0%B0",
                                "title" => "Брус антисеп.",
                            ]
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'pilomat-brusok',
                'items' => [
                    [
                        'category' => [
                            'title' => 'Брусок',
                            'uri' => '/brusok-reika/',
                        ],
                        'products' => [
                            [
                                "title" => "Брусок ест. влаж.",
                                "uri" => "/brusok-reika/?vlazhnost=%D0%95%D1%81%D1%82%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B2%D0%BB%D0%B0%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8",
                            ],
                            [
                                "title" => "Брусок сухой",
                                "uri" => "/brusok-reika/?vlazhnost=%D0%A1%D1%83%D1%85%D0%B0%D1%8F",
                            ],
                            [
                                "title" => "Брусок строганный",
                                "uri" => "/brusok-reika/?vid-obrabotki=%D0%A1%D1%82%D1%80%D0%BE%D0%B3%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F",
                            ],
                            [
                                "title" => "Брусок антисеп.",
                                "uri" => "/brusok-reika/?anticeptirovannaya=%D0%94%D0%B0",
                            ]
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'pilomat-lath',
                'items' => [
                    [
                        'category' => [
                            "uri" => "/rejka/",
                            "title" => "Рейка",
                        ],
                        'products' => [
                            [
                                "title" => "Рейка ест. влаж.",
                                "uri" => "/rejka/?vlazhnost=%D0%95%D1%81%D1%82%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B2%D0%BB%D0%B0%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8",
                            ],
                            [
                                "title" => "Рейка сухая",
                                "uri" => "/rejka/?vlazhnost=%D0%A1%D1%83%D1%85%D0%B0%D1%8F",
                            ],
                            [
                                "title" => "Рейка строганная",
                                "uri" => "/rejka/?vid-obrabotki=%D0%A1%D1%82%D1%80%D0%BE%D0%B3%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F",
                            ],
                            [
                                "title" => "Рейка антисеп.",
                                "uri" => "/rejka/?anticeptirovannaya=%D0%94%D0%B0",
                            ]
                        ]
                    ]
                ],
            ];
        break;


        // plitaosb
    case 'plitaosb':
        $result = [
            'navigations' => [
                [
                    'title' => 'OSB плиты',
                    'id' => 'plita-osb',
                    'id-svg' => 'plita-osb',
                    'uri' => ''
                ],
                [
                    'title' => 'Гипрок (гипсокартон)',
                    'id' => 'gipsokarton',
                    'id-svg' => 'gipsokarton',
                    'uri' => ''
                ],
                [
                    'title' => 'ГВЛ (гипсоволокнистые плиты)',
                    'id' => 'gvl',
                    'id-svg' => 'plita-gipsovoloknistaya',
                    'uri' => ''
                ],
                [
                    'title' => 'ДСП плиты',
                    'id' => 'dsp',
                    'id-svg' => 'plita-dsp',
                    'uri' => ''
                ],
                [
                    'title' => 'ЦСП плиты',
                    'id' => 'csp',
                    'id-svg' => 'plita-csp',
                    'uri' => ''
                ],
                [
                    'title' => 'Фибролитовые плиты',
                    'id' => 'plita-fibrolit',
                    'id-svg' => 'plita-fibrolit',
                    'uri' => ''
                ],

            ]
        ];

        $result['contents'][] =
            [
                'id' => 'plita-osb',
                'items' => [
                    [
                        'category' => [
                            'title' => 'OSB плиты',
                            'uri' => '/osb/',
                        ],
                        'products' => [
                            [
                                'title' => 'Калевала ЭкоДом',
                                'uri' => '/osb-plity-kalevala-ehkodom/',
                            ],
                            [
                                'title' => 'Кроношпан',
                                'uri' => '/osb-plity-kronoshpan/',
                            ],
                            [
                                'title' => 'Муром',
                                'uri' => '/osb-plity-murom/',
                            ],
                            [
                                'title' => 'Талион (Ультралам)',
                                'uri' => '/osb-plity-talion-ultralam/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'gipsokarton',
                'items' => [
                    [
                        'category' => [
                            'title' => 'Гипрок (гипсокартон)',
                            'uri' => '/giprok-gipsokarton/',
                        ],
                        'products' => [
                            [
                                'title' => 'Knauf',
                                'uri' => '/giprok-knauf/',
                            ],
                            [
                                'title' => 'Volma',
                                'uri' => '/giprok-gipsokarton-volma/',
                            ],
                            [
                                'title' => 'Gyproc',
                                'uri' => '/gipsokarton-giprok/',
                            ],
                            [
                                'title' => 'Профиль для гипсокартона',
                                'uri' => '/profil-dlya-gipsokartona/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'gvl',
                'items' => [
                    [
                        'category' => [
                            'title' => 'ГВЛ (гипсоволокнистые плиты)',
                            'uri' => '/gvl/',
                        ],
                        'products' => [
                            [
                                'title' => 'Knauf',
                                'uri' => '/gvl-knauf/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'dsp',
                'items' => [
                    [
                        'category' => [
                            'title' => 'ДСП плиты',
                            'uri' => '/dsp/',
                        ],
                        'products' => [
                            [
                                'title' => 'QuickDeck',
                                'uri' => '/dsp-plity-quickdeck/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'csp',
                'items' => [
                    [
                        'category' => [
                            'title' => 'ЦСП плиты',
                            'uri' => '/csp-plity/',
                        ],
                        'products' => [
                            [
                                'title' => 'под кирпич',
                                'uri' => '/csp-pod-kirpich/',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'plita-fibrolit',
                'items' => [
                    [
                        'category' => [
                            'title' => 'Фибролитовые плиты',
                            'uri' => '/fibrolitovye-plity/',
                        ],
                        'products' => [
                            [
                                'title' => 'Nordeco',
                                'uri' => '/fibrolitovye-plity-nordeco/',
                            ],
                            [
                                'title' => 'Green Board',
                                'uri' => '/fibrolitovye-plity-green-board/',
                            ],
                        ]
                    ]
                ]

            ];

        break;

    // tizol
    case 'tizol':  // www-tizol.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];
        $result['contents'][] = [
            'id' => 'assort-groups',
            'items' => [
                [
                    'products' => [
                        [
                            'title' => 'Руф',
                            'uri' => '/tizol-roof/',
                        ],
                        [
                            'title' => 'Euro-РУФ',
                            'uri' => '/euro-roof/',
                        ],
                        [
                            'title' => 'ФАСАД',
                            'uri' => '/tizol-fasad/',
                        ],
                        [
                            'title' => 'Euro-ФАСАД',
                            'uri' => '/euro-fasad/',
                        ],
                        [
                            'title' => 'Euro-ЛАЙТ',
                            'uri' => '/tizol-euro-light/',
                        ],
                        [
                            'title' => 'ВЕНТ В 90',
                            'uri' => '/tizol-vent-v-90/',
                        ],
                        [
                            'title' => 'ВЕНТ Н 40',
                            'uri' => '/tizol-vent-n-40/',
                        ],
                        [
                            'title' => 'ВЕНТ 70',
                            'uri' => '/tizol-vent-70/',
                        ],
                        [
                            'title' => 'Euro-ВЕНТ',
                            'uri' => '/tizol-euro-vent/',
                        ],
                        [
                            'title' => 'БЛОК 50',
                            'uri' => '/tizol-blok-50/',
                        ],
                        [
                            'title' => 'Euro-БЛОК',
                            'uri' => '/tizol-euro-blok/',
                        ],
                        [
                            'title' => 'Плита мягкая',
                            'uri' => '/tizol-plita-myagkaya/',
                        ],
                        [
                            'title' => 'Плита полужесткая',
                            'uri' => '/tizol-plita-poluzhestkaya/',
                        ],
                        [
                            'title' => 'Плита жесткая',
                            'uri' => '/tizol-plita-zhestkaya/',
                        ],
                        [
                            'title' => 'Плита повышенной жесткости',
                            'uri' => '/tizol-plita-povyishennoj-zhestkosti/',
                        ],
                    ]
                ]
            ]

        ];
        $result['contents'][] = [
            'id' => 'assort-application',
            'items' => [
                [
                    'products' => [
                        [
                            'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D1%85%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%BE%D0%B2',
                            'title' => 'Для вентилируемых фасадов'
                        ],
                        [
                            'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B7%D0%B2%D1%83%D0%BA%D0%BE%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D0%B8',
                            'title' => 'Для звукоизоляции'
                        ],
                        [
                            'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8',
                            'title' => 'Для кровли'
                        ],
                        [
                            'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0',
                            'title' => 'Для фасада'
                        ]
                    ]
                ],
            ]
        ];
        $result['contents'][] = [
            'id' => 'assort-thickness',
            'items' => [
                [
                    'products' => [
                        [
                            'uri' => '/catalog/?item_thickness=20',
                            'title' => '20'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=30',
                            'title' => '30'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=40',
                            'title' => '40'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=50',
                            'title' => '50'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=60',
                            'title' => '60'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=70',
                            'title' => '70'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=80',
                            'title' => '80'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=90',
                            'title' => '90'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=100',
                            'title' => '100'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=110',
                            'title' => '110'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=120',
                            'title' => '120'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=130',
                            'title' => '130'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=140',
                            'title' => '140'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=150',
                            'title' => '150'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=160',
                            'title' => '160'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=170',
                            'title' => '170'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=180',
                            'title' => '180'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=190',
                            'title' => '190'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=200',
                            'title' => '200'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=210',
                            'title' => '210'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=220',
                            'title' => '220'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=230',
                            'title' => '230'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=240',
                            'title' => '240'
                        ],
                        [
                            'uri' => '/catalog/?item_thickness=250',
                            'title' => '250'
                        ]
                    ]
                ]
            ],
        ];
        break;

    // isotecti
    case 'isotecti': // www-isotecti.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/cilindry/',
                                'title' => 'Цилиндры Isotec',
                            ],
                            [
                                'uri' => '/isotec-tank-slab/',
                                'title' => 'Isotec Industrial Slab',
                            ],
                            [
                                'uri' => '/wired-mat/',
                                'title' => 'Isotec Wired Mat',
                            ],
                            [
                                'uri' => '/tank-slab/',
                                'title' => 'Isotec Tank Slab',
                            ],
                            [
                                'uri' => '/mp/',
                                'title' => 'Isotec МП',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%82%D0%B5%D1%85%D0%BD%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9%20%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                                "title" => "Для технической изоляции",
                            ],
                            [
                                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%82%D1%80%D1%83%D0%B1",
                                "title" => "Для труб",
                            ],

                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?item_thickness=20',
                                'title' => '20'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=30',
                                'title' => '30'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=40',
                                'title' => '40'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=60',
                                'title' => '60'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=70',
                                'title' => '70'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=80',
                                'title' => '80'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=90',
                                'title' => '90'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=110',
                                'title' => '110'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=120',
                                'title' => '120'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=200',
                                'title' => '200'
                            ],
                        ]
                    ]
                ],
            ];
        break;
    case 'izomin': // www-izomin.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/izomin-fasad/',
                                'title' => 'Изомин ФАСАД',
                            ],
                            [
                                'uri' => '/izomin-roof/',
                                'title' => 'Изомин РУФ',
                            ],
                            [
                                'uri' => '/izomin-roof-v/',
                                'title' => 'Изомин РУФ-В',
                            ],
                            [
                                'uri' => '/izomin-roof-n/',
                                'title' => 'Изомин РУФ-Н',
                            ],
                            [
                                'uri' => '/izomin-floor/',
                                'title' => 'Изомин ФЛОР',
                            ],
                            [
                                'uri' => '/izomin-light/',
                                'title' => 'Изомин ЛАЙТ',
                            ],
                            [
                                'uri' => '/izomin-kaviti/',
                                'title' => 'Изомин КАВИТИ',
                            ],
                            [
                                'uri' => '/izomin-venti/',
                                'title' => 'Изомин ВЕНТИ',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D1%85%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%BE%D0%B2',
                                'title' => 'Для вентилируемых фасадов'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B7%D0%B2%D1%83%D0%BA%D0%BE%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D0%B8',
                                'title' => 'Для звукоизоляции'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0',
                                'title' => 'Для фасада'
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?item_thickness=30',
                                'title' => '30'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=40',
                                'title' => '40'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],

                        ]
                    ]
                ],
            ];
        break;
        //
    case 'baswool': // www-baswool.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/baswool-roof/',
                                'title' => 'Baswool Руф',
                            ],
                            [
                                'uri' => '/baswool-light/',
                                'title' => 'Baswool Лайт',
                            ],
                            [
                                'uri' => '/baswool-fasad/',
                                'title' => 'Baswool Фасад',
                            ],
                            [
                                'uri' => '/baswool-ruf-n/',
                                'title' => 'Baswool Руф Н',
                            ],
                            [
                                'uri' => '/baswool-vent-fasad/',
                                'title' => 'Baswool Вент Фасад',
                            ],
                            [
                                'uri' => '/baswool-standart/',
                                'title' => 'Baswool Стандарт',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D1%85%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%BE%D0%B2',
                                "title" => "Для вентилируемых фасадов",
                            ],
                            [
                                "uri" => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8',
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D1%82%D0%B5%D0%BD',
                                "title" => "Для стен",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?item_thickness=35',
                                'title' => '35'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=45',
                                'title' => '45'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=60',
                                'title' => '60'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=70',
                                'title' => '70'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=80',
                                'title' => '80'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=90',
                                'title' => '90'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=110',
                                'title' => '110'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=120',
                                'title' => '120'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=140',
                                'title' => '140'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=160',
                                'title' => '160'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=170',
                                'title' => '170'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=180',
                                'title' => '180'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=190',
                                'title' => '190'
                            ],

                        ]
                    ]
                ],
            ];
        break;
        // end baswool
    case 'xotpipe': // www-xotpipe.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/mat-proshivnoj-xotpipe-mp-100-me-tr/',
                                'title' => 'Мат прошивной Xotpipe МП-100 ME-TR',
                            ],
                            [
                                'uri' => '/mat-tekhnicheskij-xotpipe-tr-80/',
                                'title' => 'Мат технический Xotpipe TR-80',
                            ],
                            [
                                'uri' => '/mat-proshivnoj-xotpipe-wm-tr-80/',
                                'title' => 'Мат прошивной Xotpipe WM-TR-80',
                            ],
                            [
                                'uri' => '/mat-proshivnoj-xotpipe-mp-100-me-tr-alu1/',
                                'title' => 'Мат прошивной Xotpipe МП-100 ME-TR Alu1',
                            ],
                            [
                                'uri' => '/mat-proshivnoj-xotpipe-mp-100-wm-tr/',
                                'title' => 'Мат прошивной Xotpipe МП-100 WM-TR',
                            ],
                            [
                                'uri' => '/mat-proshivnoj-xotpipe-mp-100-me-tr-st/',
                                'title' => 'Мат прошивной Xotpipe МП-100 ME-TR ST',
                            ],
                            [
                                'uri' => '/mat-vyisokotemperaturnyij-xotpipe-me-tr-80/',
                                'title' => 'Мат высокотемпературный Xotpipe ME-TR 80',
                            ],
                            [
                                'uri' => '/mat-vyisokotemperaturnyij-xotpipe-wm-tr-80-combi/',
                                'title' => 'Мат высокотемпературный Xotpipe WM-TR-80 Combi',
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                "uri" => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D1%85%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%BE%D0%B2',
                                "title" => "Для вентилируемых фасадов",
                            ],
                            [
                                "uri" => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8',
                                "title" => "Для кровли",
                            ],
                            [
                                "uri" => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D1%82%D0%B5%D0%BD',
                                "title" => "Для стен",
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?item_thickness=35',
                                'title' => '35'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=45',
                                'title' => '45'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=60',
                                'title' => '60'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=70',
                                'title' => '70'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=80',
                                'title' => '80'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=90',
                                'title' => '90'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=110',
                                'title' => '110'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=120',
                                'title' => '120'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=140',
                                'title' => '140'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=160',
                                'title' => '160'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=170',
                                'title' => '170'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=180',
                                'title' => '180'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=190',
                                'title' => '190'
                            ],

                        ]
                    ]
                ],
            ];
        break;
        // [izovol] www-izovol.ru
    case 'izovol': // www-izovol.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                    'products' => [
                        [
                            'uri' => '/izovol-l-35/',
                            'title' => 'Изовол Л-35',
                        ],
                        [
                            'uri' => '/izobel-l-25/',
                            'title' => 'Изобел Л-25',
                        ],
                        [
                            'uri' => '/izovol-f-100120150/',
                            'title' => 'Изовол Ф-100/120/150',
                        ],
                        [
                            'uri' => '/izovol-v-7590/',
                            'title' => 'Изовол В-75/90',
                        ],
                        [
                            'uri' => '/izovol-st-50/',
                            'title' => 'Изовол СТ-50',
                        ],
                    ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8',
                                'title' => 'Для кровли'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D1%82%D0%B5%D0%BD',
                                'title' => 'Для стен'
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [

                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],
                        ]
                    ]
                ],
            ];
        break;
        // [beltep] www-beltep.ru
    case 'beltep': // www-beltep.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                    'products' => [
                        [
                            'uri' => '/beltep-fasad/',
                            'title' => 'Белтеп Фасад',
                        ],
                        [
                            'uri' => '/beltep-roof/',
                            'title' => 'Белтеп Руф',
                        ],
                        [
                            'uri' => '/beltep-floor/',
                            'title' => 'Белтеп Флор',
                        ],
                        [
                            'uri' => '/beltep-vent/',
                            'title' => 'Белтеп Вент',
                        ],
                        [
                            'uri' => '/beltep-light/',
                            'title' => 'Белтеп Лайт',
                        ],
                        [
                            'uri' => '/beltep-universalnyij/',
                            'title' => 'Белтеп Универсальный',
                        ],
                        [
                            'uri' => '/beltep-light-extra/',
                            'title' => 'Белтеп Лайт Экстра',
                        ],
                        [
                            'uri' => '/beltep-sendvich/',
                            'title' => 'Белтеп Сэндвич',
                        ],
                    ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                        'products' => [

                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D1%85%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%BE%D0%B2',
                                'title' => 'Для вентилируемых фасадов'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B7%D0%B2%D1%83%D0%BA%D0%BE%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D0%B8',
                                'title' => 'Для звукоизоляции'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8',
                                'title' => 'Для кровли'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9',
                                'title' => 'Для перекрытий'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%BB%D0%B0',
                                'title' => 'Для пола'
                            ],
                            [
                                'uri' => '/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D1%82%D0%B5%D0%BD',
                                'title' => 'Для стен'
                            ],
                        ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?item_thickness=30',
                                'title' => '30'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=40',
                                'title' => '40'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=60',
                                'title' => '60'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=70',
                                'title' => '70'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=80',
                                'title' => '80'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=90',
                                'title' => '90'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=110',
                                'title' => '110'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=120',
                                'title' => '120'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=130',
                                'title' => '130'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=140',
                                'title' => '140'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=150',
                                'title' => '150'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=160',
                                'title' => '160'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=170',
                                'title' => '170'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=180',
                                'title' => '180'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=190',
                                'title' => '190'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=200',
                                'title' => '200'
                            ],
                        ]
                    ]
                ],
            ];
        break;
        // [ruspanel] www-ruspanel.ru
    case 'ruspanel': // www-ruspanel.ru
        $result = [
            'navigations' => [
                [
                    'title' => 'Продуктовые линейки',
                    'id' => 'assort-groups',
                    'id-svg' => 'assort-product-lines',
                    'uri' => ''
                ],
                [
                    'title' => 'По применению',
                    'id' => 'assort-application',
                    'id-svg' => 'assort-application',
                    'uri' => ''
                ],
                [
                    'title' => 'По толщине, мм',
                    'id' => 'assort-thickness',
                    'id-svg' => 'assort-thickness',
                    'uri' => ''
                ],
            ]
        ];

        $result['contents'][] =
            [
                'id' => 'assort-groups',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?produktovaya-lineyka=L%20%D0%9A%D1%80%D0%BE%D0%BC%D0%BA%D0%B0',
                                'title' => 'L Кромка'
                            ],
                            [
                                'uri' => '/catalog/?produktovaya-lineyka=RPG%20Basic',
                                'title' => 'RPG Basic'
                            ],
                            [
                                'uri' => '/catalog/?produktovaya-lineyka=RPG%20Optima',
                                'title' => 'RPG Optima'
                            ],
                            [
                                'uri' => '/catalog/?produktovaya-lineyka=RPG%20Real',
                                'title' => 'RPG Real'
                            ],
                            [
                                'uri' => '/catalog/?produktovaya-lineyka=RPG%20%D0%93%D1%80%D0%B0%D0%B4%D0%B8%D0%B5%D0%BD%D1%82',
                                'title' => 'RPG Градиент'
                            ],
                            [
                                'uri' => '/catalog/?produktovaya-lineyka=%D0%A8%D0%B8%D0%BF-%D0%BF%D0%B0%D0%B7',
                                'title' => 'Шип-паз'
                            ],
                        ]
                    ]
                ]

            ];
        $result['contents'][] =
            [
                'id' => 'assort-application',
                'items' => [
                    [
                    'products' => [
                        [
                            'uri' => '/ruspanel-rpg-basic/',
                            'title' => 'Ruspanel RPG Basic',
                        ],
                        [
                            'uri' => '/ruspanel-rpg-optima/',
                            'title' => 'Ruspanel RPG Optima',
                        ],
                        [
                            'uri' => '/ruspanel-rpg-gradient/',
                            'title' => 'Ruspanel RPG Градиент',
                        ],
                        [
                            'uri' => '/ruspanel-ship-paz/',
                            'title' => 'Ruspanel шип-паз',
                        ],
                        [
                            'uri' => '/ruspanel-rpg-real/',
                            'title' => 'Ruspanel RPG Real',
                        ],
                        [
                            'uri' => '/ruspanel-l-kromka/',
                            'title' => 'Ruspanel L Кромка',
                        ],
                    ]
                    ],
                ]
            ];
        $result['contents'][] =
            [
                'id' => 'assort-thickness',
                'items' => [
                    [
                        'products' => [
                            [
                                'uri' => '/catalog/?item_thickness=6',
                                'title' => '6'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=10',
                                'title' => '10'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=12',
                                'title' => '12'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=15',
                                'title' => '15'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=20',
                                'title' => '20'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=30',
                                'title' => '30'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=40',
                                'title' => '40'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=50',
                                'title' => '50'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=60',
                                'title' => '60'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=80',
                                'title' => '80'
                            ],
                            [
                                'uri' => '/catalog/?item_thickness=100',
                                'title' => '100'
                            ],
                        ]
                    ]
                ],
            ];
        break;
}

return $result;
