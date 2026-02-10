<?php
$context = $modx->resource->get('context_key');
$primenenieResult = [];
// $vid_prod_result = [];
$thicknessResult = [];
$categories = [];

// --------------------------------------
// Установка категорий для меню
// --------------------------------------
// $catalog = $modx->getObject('modResource', [
// 'alias' => 'catalog',
// 'context_key' => $context
// ]);

$catalog_id = $modx->getPlaceholder('catalog_id');

if (!empty($catalog_id)) {
    switch ($context) {
        // -------------------------------------
        // knauf
        // -------------------------------------
        case 'knauf':
            $categories = [
                [
                    'uri' => '/greenterm/',
                    'name' => 'GreenTERM',
                ],
                [
                    'uri' => '/professionalniy-segment-knauf-insuleyshn/',
                    'name' => 'Knauf Insulation',
                ],
                [
                    'uri' => '/knauf-ekoroll/',
                    'name' => 'Knauf Экоролл',
                ],
                [
                    'uri' => '/akustiknauf/',
                    'name' => 'АкустиКНАУФ',
                ],
                [
                    'uri' => '/knauf-membrany/',
                    'name' => 'Кнауф мембраны',
                ],
                [
                    'uri' => '/therm/',
                    'name' => 'Кнауф Терм',
                ],
                [
                    'uri' => '/knauf-tisma/',
                    'name' => 'Кнауф Тисма',
                ],
                [
                    'uri' => '/teploknauf/',
                    'name' => 'ТеплоКНАУФ',
                ],
            ];
            break;


        // -------------------------------------
        // ursa
        // -------------------------------------
        case 'ursa':
            $categories = [
                [
                    'uri' => '/geo/',
                    'name' => 'Ursa GEO',
                ],
                [
                    'uri' => '/pureone/',
                    'name' => 'Ursa Pureone',
                ],
                [
                    'uri' => '/ursa-seco/',
                    'name' => 'Ursa Seco',
                ],
                [
                    'uri' => '/xps/',
                    'name' => 'Ursa XPS',
                ],
                [
                    'uri' => '/terra/',
                    'name' => 'Ursa Терра',
                ],
            ];
            break;


        // -------------------------------------
        // penoplex
        // -------------------------------------
        case 'penoplex':
            $categories = [
                [
                    'uri' => '/45/',
                    'name' => 'Пеноплэкс 45',
                ],
                [
                    'uri' => '/geo/',
                    'name' => 'Пеноплэкс ГЕО',
                ],
                [
                    'uri' => '/komfort/',
                    'name' => 'Пеноплэкс Комфорт',
                ],
                [
                    'uri' => '/krovlya/',
                    'name' => 'Пеноплэкс Кровля',
                ],
                [
                    'uri' => '/osnova/',
                    'name' => 'Пеноплэкс Основа',
                ],
                [
                    'uri' => '/segmenty/',
                    'name' => 'Пеноплэкс Сегменты',
                ],
                [
                    'uri' => '/stena/',
                    'name' => 'Пеноплэкс Стена',
                ],
                [
                    'uri' => '/uklon/',
                    'name' => 'Пеноплэкс Уклон',
                ],
                [
                    'uri' => '/fasad/',
                    'name' => 'Пеноплэкс Фасад',
                ],
                [
                    'uri' => '/fundament/',
                    'name' => 'Пеноплэкс Фундамент',
                ],
                [
                    'uri' => '/extream/',
                    'name' => 'Пеноплэкс Экстрим',
                ],
                [
                    'uri' => '/sop-tovary/',
                    'name' => 'Сопутствующие товары Penoplex',
                ],
            ];
            break;


        // -------------------------------------
        // paroc
        // -------------------------------------
        case 'paroc':
            $categories = [
                [
                    'uri' => '/yumateks-termo/',
                    'name' => 'Утеплитель Юматекс Термо',
                ],
                [
                    'uri' => '/oem-plityi/',
                    'name' => 'OEM плиты',
                ],
                [
                    'uri' => '/zvukozashhitnaya-stroitelnaya-izolyacziya/',
                    'name' => 'Звукозащитная строительная изоляция',
                ],
                [
                    'uri' => '/lamelnyie-matyi/',
                    'name' => 'Ламельные маты',
                ],
                [
                    'uri' => '/matyi-dlya-ovk-i-promyishlennosti/',
                    'name' => 'Маты для овк и промышленности',
                ],
                [
                    'uri' => '/obshhestroitelnaya-teploizolyacziya/',
                    'name' => 'Общестроительная теплоизоляция',
                ],
                [
                    'uri' => '/ovk-matyi/',
                    'name' => 'Овк маты',
                ],
                [
                    'uri' => '/ovk-plityi/',
                    'name' => 'Овк плиты',
                ],
                [
                    'uri' => '/ognezashhitnaya-stroitelnaya-izolyacziya/',
                    'name' => 'Огнезащитная строительная изоляция',
                ],
                [
                    'uri' => '/plityi/',
                    'name' => 'Плиты',
                ],
                [
                    'uri' => '/proshivnyie-matyi/',
                    'name' => 'Прошивные маты',
                ],
                [
                    'uri' => '/teploizolyacziya-dlya-sendvich-panelej/',
                    'name' => 'Теплоизоляция для сэндвич-панелей',
                ],
                [
                    'uri' => '/teploizolyacziya-ploskix-krovel/',
                    'name' => 'Теплоизоляция плоских кровель',
                ],
                [
                    'uri' => '/teploizolyacziya-sten/',
                    'name' => 'Теплоизоляция стен',
                ],
                [
                    'uri' => '/teploizolyacziya-fundamenta-i-polov-na-grunte/',
                    'name' => 'Теплоизоляция фундамента и полов на грунте',
                ],
                [
                    'uri' => '/teploizolyacziya-shtukaturnyix-fasadov/',
                    'name' => 'Теплоизоляция штукатурных фасадов',
                ],
                [
                    'uri' => '/texnicheskie-otvodyi-i-segmentyi/',
                    'name' => 'Технические отводы и сегменты',
                ],
                [
                    'uri' => '/uteplenie-i-ognezashhita-potolkov-i-perekryitij/',
                    'name' => 'Утепление и огнезащита потолков и перекрытий',
                ],
                [
                    'uri' => '/cilindry/',
                    'name' => 'Цилиндры',
                ],
            ];
            break;


        // -------------------------------------
        // rockwool
        // -------------------------------------
        case 'rockwool':
            $categories = [
                [
                    'uri' => '/light-batts-scandic/',
                    'name' => 'Скандик Лайт Баттс',
                ],
                [
                    'uri' => '/light-batts-optima/',
                    'name' => 'Лайт Баттс Оптима',
                ],
                [
                    'uri' => '/acoustic-batts/',
                    'name' => 'Акустик Баттс',
                ],
                [
                    'uri' => '/acoustic-standart/',
                    'name' => 'Акустик Стандарт',
                ],
                [
                    'uri' => '/arktic/',
                    'name' => 'Арктик',
                ],
                [
                    'uri' => '/beton-element-batts/',
                    'name' => 'Бетон Элемент Баттс',
                ],
                [
                    'uri' => '/venti-batts/',
                    'name' => 'Венти Баттс',
                ],
                [
                    'uri' => '/kaviti-batts/',
                    'name' => 'Кавити Баттс',
                ],
                [
                    'uri' => '/kamin-batts/',
                    'name' => 'Камин Баттс',
                ],
                [
                    'uri' => '/karkas-batts/',
                    'name' => 'Каркас Баттс',
                ],
                [
                    'uri' => '/light-batts/',
                    'name' => 'Лайт Баттс',
                ],
                [
                    'uri' => '/plaster-batts/',
                    'name' => 'Пластер Баттс',
                ],
                [
                    'uri' => '/standart/',
                    'name' => 'Роквул Стандарт',
                ],
                [
                    'uri' => '/rokvul-tekh-batts/',
                    'name' => 'Роквул Тех Баттс',
                ],
                [
                    'uri' => '/rockfacade/',
                    'name' => 'Рокфасад',
                ],
                [
                    'uri' => '/roof-batts/',
                    'name' => 'Руф Баттс',
                ],
                [
                    'uri' => '/sauna-batts/',
                    'name' => 'Сауна Баттс',
                ],
                [
                    'uri' => '/soput-tovary/',
                    'name' => 'Сопутствующие товары',
                ],
                [
                    'uri' => '/sendvich-batts/',
                    'name' => 'Сэндвич Баттс',
                ],
                [
                    'uri' => '/teh-mat/',
                    'name' => 'ТЕХ МАТ',
                ],
                [
                    'uri' => '/fasad-batts/',
                    'name' => 'Фасад Баттс',
                ],
                [
                    'uri' => '/floor-batts/',
                    'name' => 'Флор Баттс',
                ],
                [
                    'uri' => '/cilindry-navivnye/',
                    'name' => 'Цилиндры навивные',
                ],
                [
                    'uri' => '/econom/',
                    'name' => 'Эконом',
                ],
                [
                    'uri' => '/conlit-sl-150/',
                    'name' => 'CONLIT SL 150',
                ],
                [
                    'uri' => '/fire-batts/',
                    'name' => 'Fire Batts',
                ],
                [
                    'uri' => '/ft-barrier/',
                    'name' => 'FT BARRIER',
                ],
                [
                    'uri' => '/industrial-batts-80/',
                    'name' => 'Industrial Batts 80',
                ],
                [
                    'uri' => '/klimafix/',
                    'name' => 'Klimafix',

                ],
                [
                    'uri' => '/lamella-mat-l/',
                    'name' => 'Lamella Mat',
                ],
                [
                    'uri' => '/prorox/',
                    'name' => 'ProRox',
                ],
                [
                    'uri' => '/searox/',
                    'name' => 'SeaRox',
                ],
                [
                    'uri' => '/wired-mat/',
                    'name' => 'WIRED MAT',
                ],
            ];
            break;


        // -------------------------------------
        // tn
        // -------------------------------------
        case 'tn':
            $categories = [
                [
                    'uri' => '/tekhnonikol-tekhnopleks/',
                    'name' => 'XPS Техноплекс'
                ],
                [
                    'uri' => '/mat-tekhno/',
                    'name' => 'Мат Техно'
                ],
                [
                    'uri' => '/plita-tekhno-ozb/',
                    'name' => 'Плита Техно ОЗБ'
                ],
                [
                    'uri' => '/plita-tekhno-ozd/',
                    'name' => 'Плита Техно ОЗД'
                ],
                [
                    'uri' => '/plita-tekhno-ozm/',
                    'name' => 'Плита Техно ОЗМ'
                ],
                [
                    'uri' => '/plita-tekhno-t/',
                    'name' => 'Плита Техно Т'
                ],
                [
                    'uri' => '/polimernye-gidroizolyacionnye-membrany/',
                    'name' => 'Полимерные гидроизоляционные мембраны'
                ],
                [
                    'uri' => '/rulonnaya-zvukoizolyaciya/',
                    'name' => 'Рулонная звукоизоляция'
                ],
                [
                    'uri' => '/soputstvuyushchie-tovary/',
                    'name' => 'Сопутствующие товары Технониколь'
                ],
                [
                    'uri' => '/carbon/',
                    'name' => 'Технониколь Carbon'
                ],
                [
                    'uri' => '/tekhnonikol-greenguard/',
                    'name' => 'Технониколь GreenGuard'
                ],
                [
                    'uri' => '/tekhnonikol-logicpir/',
                    'name' => 'Технониколь LOGICPIR'
                ],
                [
                    'uri' => '/bazalit/',
                    'name' => 'Технониколь Базалит'
                ],
                [
                    'uri' => '/tekhnonikol-izoboks/',
                    'name' => 'Технониколь Изобокс'
                ],
                [
                    'uri' => '/plity-pir/',
                    'name' => 'Технониколь Плиты PIR'
                ],
                [
                    'uri' => '/tekhnonikol-roklajt/',
                    'name' => 'Технониколь Роклайт'
                ],
                [
                    'uri' => '/tekhnonikol-segmenty-i-polucilindry-xps/',
                    'name' => 'Технониколь Сегменты и Полуцилиндры XPS'
                ],
                [
                    'uri' => '/tekhnonikol-sendvich-tekhnonikol-c-xps/',
                    'name' => 'Технониколь Сэндвич Ц-XPS'
                ],
                [
                    'uri' => '/tekhnonikol-teploroll/',
                    'name' => 'Технониколь Теплоролл'
                ],
                [
                    'uri' => '/zvukoizolyaciya-tekhnonikol-tekhnoakustik/',
                    'name' => 'Технониколь Техноакустик'
                ],
                [
                    'uri' => '/tekhnoblok/',
                    'name' => 'Технониколь Техноблок'
                ],
                [
                    'uri' => '/tekhnovent/',
                    'name' => 'Технониколь Техновент'
                ],
                [
                    'uri' => '/tekhnolajt/',
                    'name' => 'Технониколь Технолайт'
                ],
                [
                    'uri' => '/tekhnoruf/',
                    'name' => 'Технониколь Техноруф'
                ],
                [
                    'uri' => '/tekhnosendvich/',
                    'name' => 'Технониколь Техносэндвич'
                ],
                [
                    'uri' => '/tekhnofas/',
                    'name' => 'Технониколь Технофас'
                ],
                [
                    'uri' => '/uteplitel-tekhnonikol-tekhnoflor/',
                    'name' => 'Технониколь Технофлор'
                ],
                [
                    'uri' => '/tekhnonikol-shtukaturnyj-fasad/',
                    'name' => 'Технониколь Штукатурный фасад'
                ],
                [
                    'uri' => '/tekhnonikol-master-zvukozashchita/',
                    'name' => 'Технониколь Шумоизоляция'
                ],
                [
                    'uri' => '/cilindr-tekhno/',
                    'name' => 'Цилиндр Техно'
                ],
            ];
            break;


        // -------------------------------------
        // isover
        // -------------------------------------
        case 'isover':
            $categories = [
                [
                    'uri' => '/kim-al/',
                    'name' => 'Изовер KIM-AL'
                ],
                [
                    'uri' => '/kv-050/',
                    'name' => 'Изовер KV-050'
                ],
                [
                    'uri' => '/ol/',
                    'name' => 'Изовер OL'
                ],
                [
                    'uri' => '/akustik/',
                    'name' => 'Изовер Акустик'
                ],
                [
                    'uri' => '/venti/',
                    'name' => 'Изовер Венти'
                ],
                [
                    'uri' => '/ventfasad/',
                    'name' => 'Изовер ВентФасад'
                ],
                [
                    'uri' => '/uteplitel-zvukozaschita/',
                    'name' => 'Изовер Звукозащита'
                ],
                [
                    'uri' => '/karkas/',
                    'name' => 'Изовер Каркас'
                ],
                [
                    'uri' => '/karkasnyi-dom/',
                    'name' => 'Изовер Каркасный дом'
                ],
                [
                    'uri' => '/izover-klassik/',
                    'name' => 'Изовер Классик'
                ],
                [
                    'uri' => '/kt-special/',
                    'name' => 'Изовер КТ-Специал'
                ],
                [
                    'uri' => '/lait/',
                    'name' => 'Изовер Лайт'
                ],
                [
                    'uri' => '/master-akustiki/',
                    'name' => 'Изовер Мастер Акустики'
                ],
                [
                    'uri' => '/master-teplyh-kryh/',
                    'name' => 'Изовер Мастер Теплых Крыш'
                ],
                [
                    'uri' => '/master-teplyh-sten/',
                    'name' => 'Изовер Мастер Теплых Стен'
                ],
                [
                    'uri' => '/optimal/',
                    'name' => 'Изовер Оптимал'
                ],
                [
                    'uri' => '/plavayuschii-pol/',
                    'name' => 'Изовер Плавающий пол'
                ],
                [
                    'uri' => '/izover-poly-i-perekrytiya/',
                    'name' => 'Изовер Полы и Перекрытия'
                ],
                [
                    'uri' => '/profi/',
                    'name' => 'Изовер Профи'
                ],
                [
                    'uri' => '/ruf/',
                    'name' => 'Изовер Руф'
                ],
                [
                    'uri' => '/sauna/',
                    'name' => 'Изовер Сауна'
                ],
                [
                    'uri' => '/skatnaya-krovlya/',
                    'name' => 'Изовер Скатная Кровля'
                ],
                [
                    'uri' => '/izover-special-tvin/',
                    'name' => 'Изовер Специал Твин'
                ],
                [
                    'uri' => '/standart/',
                    'name' => 'Изовер Стандарт'
                ],
                [
                    'uri' => '/sendvich-life/',
                    'name' => 'Изовер Сэндвич Лайф'
                ],
                [
                    'uri' => '/teplaya-krysha/',
                    'name' => 'Изовер Теплая Крыша'
                ],
                [
                    'uri' => '/teplo-i-tiho/',
                    'name' => 'Изовер Тепло и Тихо'
                ],
                [
                    'uri' => '/teplye-steny/',
                    'name' => 'Изовер Теплые Стены'
                ],
                [
                    'uri' => '/teplyj-dom/',
                    'name' => 'Изовер Теплый Дом'
                ],
                [
                    'uri' => '/tihiy-dom/',
                    'name' => 'Изовер Тихий Дом'
                ],
                [
                    'uri' => '/fasad/',
                    'name' => 'Изовер Фасад'
                ],
                [
                    'uri' => '/flor/',
                    'name' => 'Изовер Флор'
                ],
                [
                    'uri' => '/shtukaturnyi-fasad/',
                    'name' => 'Изовер Штукатурный фасад'
                ],
                [
                    'uri' => '/sop-tovary/',
                    'name' => 'Сопутствующие товары Изовер'
                ]
            ];
            break;


        // -------------------------------------
        // Асфальтобетон
        // -------------------------------------
        case 'asconcrete':
            $categories = [
                [
                    'uri' => '/krupnozernistye-asfaltobetonnye-smesi/',
                    'name' => 'Крупнозернистый асфальт',
                ],
                [
                    'uri' => '/melkozernistye-asfaltobetonnye-smesi/',
                    'name' => 'Мелкозернистый асфальт',
                ],
                [
                    'uri' => '/peschanye-asfaltobetonnye-smesi/',
                    'name' => 'Песчаный асфальт',
                ],
                [
                    'uri' => '/shchebenochno-mastichnye-smesi/',
                    'name' => 'Щебеночно-мастичные смеси',
                ],
            ];
            break;


        // -------------------------------------
        // Фасады
        // -------------------------------------
        case 'fasady-pro':
            $categories = [
                [
                    'uri' => '/vagonka/',
                    'name' => 'Вагонка',
                ],
                [
                    'uri' => '/imitaciya-brevna-block-house/',
                    'name' => 'Имитация бревна (блок-хаус)',
                ],
                [
                    'uri' => '/imitaciya-brusa/',
                    'name' => 'Имитация бруса',
                ],
                [
                    'uri' => '/krashenaya-doska/',
                    'name' => 'Крашеная доска',
                ],
                [
                    'uri' => '/planken/',
                    'name' => 'Планкен',
                ],
                [
                    'uri' => '/polovaya-doska/',
                    'name' => 'Половая (Шпунтованная) доска',
                ],
                [
                    'uri' => '/termoobrabotannaya-drevesina/',
                    'name' => 'Термообработанная древесина',
                ],
                [
                    'uri' => '/terrasnaya-doska/',
                    'name' => 'Террасная доска',
                ],
            ];
            break;


        // -------------------------------------
        // Пиломатериалы
        // -------------------------------------
        case 'pilomat':
            $categories = [
                [
                    "name" => "Доска",
                    "uri" => "/prodazha-dosok/",
                    "children" => [
                        [
                            "uri" => "/doska-obreznaya/",
                            "name" => "Доска ест. влаж.",
                            "children" => []
                        ],
                        [
                            "uri" => "/doska-obreznaya-suhaya/",
                            "name" => "Доска сухая",
                            "children" => []
                        ],
                        [
                            "uri" => "/doska-strogannaya-suhaya/",
                            "name" => "Доска строганная",
                            "children" => []
                        ],
                        [
                            "uri" => "/prodazha-dosok/?anticeptirovannaya=%D0%94%D0%B0",
                            "name" => "Доска антисеп.",
                            "children" => []
                        ],
                        [
                            "uri" => "/doska-iz-osinyi/",
                            "name" => "Доска из осины",
                            "children" => []
                        ]
                    ]
                ],
                [
                    "name" => "Брус",
                    "uri" => "/brus/",
                    "children" => [
                        [
                            "uri" => "/brus-obreznoy/",
                            "name" => "Брус ест. влаж.",
                            "children" => []
                        ],
                        [
                            "uri" => "/brus-suhoj-obreznoj/",
                            "name" => "Брус сухой",
                            "children" => []
                        ],
                        [
                            "uri" => "/brus/?vid-obrabotki=%D0%A1%D1%82%D1%80%D0%BE%D0%B3%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F",
                            "name" => "Брус строганный",
                            "children" => []
                        ],
                        [
                            "uri" => "/brus-obreznoy/?anticeptirovannaya=%D0%94%D0%B0",
                            "name" => "Брус антисеп.",
                            "children" => []
                        ]
                    ]
                ],
                [
                    "name" => "Брусок",
                    "uri" => "/brusok-reika/",
                    "children" => [
                        [
                            "uri" => "/brusok-reika/?vlazhnost=%D0%95%D1%81%D1%82%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B2%D0%BB%D0%B0%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8",
                            "name" => "Брусок ест. влаж.",
                            "children" => []
                        ],
                        [
                            "uri" => "/brusok-reika/?vlazhnost=%D0%A1%D1%83%D1%85%D0%B0%D1%8F",
                            "name" => "Брусок сухой",
                            "children" => []
                        ],
                        [
                            "uri" => "/brusok-reika/?vid-obrabotki=%D0%A1%D1%82%D1%80%D0%BE%D0%B3%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F",
                            "name" => "Брусок строганный",
                            "children" => []
                        ],
                        [
                            "uri" => "/brusok-reika/?anticeptirovannaya=%D0%94%D0%B0",
                            "name" => "Брусок антисеп.",
                            "children" => []
                        ]
                    ]
                ],
                [
                    "name" => "Рейка",
                    "uri" => "/rejka/",
                    "children" => [
                        [
                            "uri" => "/rejka/?vlazhnost=%D0%95%D1%81%D1%82%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%D0%B9%20%D0%B2%D0%BB%D0%B0%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8",
                            "name" => "Рейка ест. влаж.",
                            "children" => []
                        ],
                        [
                            "uri" => "/rejka/?vlazhnost=%D0%A1%D1%83%D1%85%D0%B0%D1%8F",
                            "name" => "Рейка сухая",
                            "children" => []
                        ],
                        [
                            "uri" => "/rejka/?vid-obrabotki=%D0%A1%D1%82%D1%80%D0%BE%D0%B3%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F",
                            "name" => "Рейка строганная",
                            "children" => []
                        ],
                        [
                            "uri" => "/rejka/?anticeptirovannaya=%D0%94%D0%B0",
                            "name" => "Рейка антисеп.",
                            "children" => []
                        ]
                    ]
                ]
            ];
            break;


        // -------------------------------------
        // Плиты МДВП
        // -------------------------------------
        case 'plity-mdvp':
            $categories = [
                [
                    'uri' => '/isoplaat/',
                    'name' => 'ISOPLAAT',
                ],
                [
                    'uri' => '/steico/',
                    'name' => 'STEICO',
                ],
                [
                    'uri' => '/beltermo/',
                    'name' => 'Белтермо',
                ],
            ];
            break;


        // -------------------------------------
        // Кровля
        // -------------------------------------
        case 'krovlya':
            $categories = [
                [
                    'uri' => '/ondulin/',
                    'name' => 'Ондулин',
                    'children' => [
                        [
                            'uri' => '/cherepica-ondulin/',
                            'name' => 'Черепица Ондулин',
                        ],
                        [
                            'uri' => '/cherepica-ondulin-smart/',
                            'name' => 'Ондулин Смарт',
                        ],
                        [
                            'uri' => '/onduvilla/',
                            'name' => 'Ондувилла',
                        ],
                        [
                            'uri' => '/ondutiss/',
                            'name' => 'Ондутисс',
                        ],
                        [
                            'uri' => '/komplektuyushhie-dlya-ondulina/',
                            'name' => 'Комплектующие для Ондулина',
                        ],
                    ],
                ],
                [
                    'uri' => '/shifer/',
                    'name' => 'Шифер'
                ],
                [
                    'uri' => '/metallocherepica/',
                    'name' => 'Металлочерепица',
                    'children' => [
                        [
                            'uri' => '/metallocherepitsya-grand-line/',
                            'name' => 'Металлочерепица Grand Line',
                            'children' => [
                                ['name' => 'Classic', 'uri' => '/metallocherepitsya-grand-line-classic/'],
                                ['name' => 'Kamea', 'uri' => '/metallocherepitsya-grand-line-kamea/'],
                                ['name' => 'Kredo', 'uri' => '/metallocherepitsya-grand-line-kredo/'],
                                ['name' => 'Kvinta plus', 'uri' => '/metallocherepitsya-grand-line-kvinta-plus/'],
                                ['name' => 'Kvinta Uno', 'uri' => '/metallocherepitsya-grand-line-kvinta-uno/'],
                                ['name' => 'Modern', 'uri' => '/metallocherepitsya-grand-line-modern/'],
                                ['name' => 'Монтеррей', 'uri' => '/prodazha-metallocherepicy-monterrej-grand-line/']
                            ]
                        ],
                        [
                            'uri' => '/metallocherepica-metall-profil/',
                            'name' => 'Металлочерепица Металл-Профиль',
                        ],
                    ]
                ],
                [
                    'uri' => '/myagkaya-cherepica/',
                    'name' => 'Гибкая черепица',
                    'children' => [
                        [
                            'uri' => '/docke-pie-gibkaya-cherepica/',
                            'name' => 'Docke',
                        ],
                        [
                            'uri' => '/myagkaya-cherepica-tehnonikol-shinglas/',
                            'name' => 'Технониколь Шинглас',
                        ],
                        [
                            'uri' => '/myagkaya-cherepica-katepal/',
                            'name' => 'Катепал',
                        ],
                        [
                            'uri' => '/myagkaya-cherepica-tegola/',
                            'name' => 'Tegola',
                        ],
                        [
                            'uri' => '/myagkaya-cherepica-icopal/',
                            'name' => 'Икопал',
                        ],
                    ]
                ],
                [
                    'uri' => '/fibroczementnaya-cherepicza/',
                    'name' => 'Фиброцементная черепица',
                ],
                [
                    'uri' => '/slanczevaya-krovlya/',
                    'name' => 'Сланцевая кровля',
                    'children' => [
                        [
                            'uri' => '/slanczevaya-krovlya-cupa-pizarras/',
                            'name' => 'Cupa pizarras',
                        ],
                        [
                            'uri' => '/slanczevaya-krovlya-rathscheck/',
                            'name' => 'Rathscheck',
                        ],
                    ]
                ],
                [
                    'uri' => '/rulonnaya-krovlya/',
                    'name' => 'Рулонная кровля',
                    'children' => [
                        [
                            'uri' => '/rulonnaya-krovlya-tehnonikol/',
                            'name' => 'Наплавляемая кровля',
                        ],
                        [
                            'uri' => '/pvh-membrany/',
                            'name' => 'ПВХ мембраны',
                        ],
                        [
                            'uri' => '/slanczevaya-krovlya/',
                            'name' => 'Сланцевая кровля',
                        ],
                    ]
                ],
                [
                    'uri' => '/cementno-peschanaya-cherepica/',
                    'name' => 'Цементно-песчаная черепица',
                    'children' => [
                        [
                            'uri' => '/cementno-peschanaya-cherepica-kriastak/',
                            'name' => 'Цементно-песчаная черепица Kriastak',
                        ],
                        [
                            'uri' => '/cementno-peschanaya-cherepica-braas/',
                            'name' => 'Цементно-песчаная черепица Braas',
                        ],
                        [
                            'uri' => '/komplektuyushhie-dlya-cpch/',
                            'name' => 'Комплектующие для ЦПЧ',
                        ],
                        [
                            'uri' => '/fibroczementnaya-cherepicza/',
                            'name' => 'Фиброцементная черепица',
                        ],
                    ]
                ],
                [
                    'uri' => '/kompozitnaya-cherepicza/',
                    'name' => 'Композитная черепица',
                    'children' => [
                        [
                            'uri' => '/kompozitnaya-cherepicza-texnonikol/',
                            'name' => 'Технониколь',
                        ],
                        [
                            'uri' => '/kompozitnaya-cherepicza-metrotile/',
                            'name' => 'Metrotile',
                        ],
                        [
                            'uri' => '/kompozitnaya-cherepicza-gerard/',
                            'name' => 'Gerard',
                        ],
                        [
                            'uri' => '/kompozitnaya-cherepicza-grand-line/',
                            'name' => 'Grand Line',
                        ],
                        [
                            'uri' => '/kompozitnaya-cherepicza-aerodek/',
                            'name' => 'Aerodek',
                        ],
                    ]
                ],
                [
                    'uri' => '/keramicheskaya-cherepica/',
                    'name' => 'Керамическая черепица',
                    'children' => [
                        [
                            'uri' => '/keramicheskaya-cherepica-braas/',
                            'name' => 'Керамическая черепица Braas',
                        ],
                        [
                            'uri' => '/komplektuyushhie-dlya-keramicheskoj-cherepicy-braas/',
                            'name' => 'Комплектующие для керамической черепицы Braas',
                        ],
                    ]
                ],
                [
                    'uri' => '/falcevaya-krovlya/',
                    'name' => 'Фальцевая кровля',
                    'children' => [
                        [
                            'name' => 'Кликфальц',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86',
                        ],
                        [
                            'name' => 'Кликфальц Line',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Line',
                        ],
                        [
                            'name' => 'Кликфальц mini',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20mini',
                        ],
                        [
                            'name' => 'Кликфальц Pro',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Pro',
                        ],
                        [
                            'name' => 'Кликфальц Pro Gofr',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Pro%20Gofr',
                        ],
                        [
                            'name' => 'Кликфальц Pro Line',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%9A%D0%BB%D0%B8%D0%BA%D1%84%D0%B0%D0%BB%D1%8C%D1%86%20Pro%20Line',
                        ],
                        [
                            'name' => 'Фальц двойной стоячий',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%A4%D0%B0%D0%BB%D1%8C%D1%86%20%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D1%82%D0%BE%D1%8F%D1%87%D0%B8%D0%B9',
                        ],
                        [
                            'name' => 'Фальц двойной стоячий Line',
                            'uri' => '/falcevaya-krovlya/?collection=%D0%A4%D0%B0%D0%BB%D1%8C%D1%86%20%D0%B4%D0%B2%D0%BE%D0%B9%D0%BD%D0%BE%D0%B9%20%D1%81%D1%82%D0%BE%D1%8F%D1%87%D0%B8%D0%B9%20Line',
                        ],
                    ]
                ],
                [
                    'uri' => '/proflist/',
                    'name' => 'Профилированный лист',
                    'children' => [
                        [
                            'uri' => '/proflist-dlya-krovli/',
                            'name' => 'Профилированный лист для кровли',
                        ],
                        [
                            'uri' => '/profilirovannyy-list-dlya-zabora/',
                            'name' => 'Профилированный лист для забора',
                        ],
                    ]
                ],
                [
                    'uri' => '/shtaketnik/',
                    'name' => 'Штакетник',
                    'children' => [
                        [
                            'uri' => '/shtaketnik-metall-profil/',
                            'name' => 'Металл Профиль',
                        ],
                        [
                            'uri' => '/shtaketnik-grand-line/',
                            'name' => 'Grand Line',
                        ],
                    ]
                ],
                [
                    'uri' => '/vodostochnaya-sistema/',
                    'name' => 'Водосточная система',
                    'children' => [
                        [
                            'uri' => '/pvh-plastikovye-vodostochnye-sistemy/',
                            'name' => 'ПВХ водостоки',
                        ],
                        [
                            'uri' => '/metallicheskie-vodostoki//',
                            'name' => 'Металлические водостоки',
                        ],
                    ]
                ],
                [
                    'uri' => '/sofity/',
                    'name' => 'Софиты',
                    'children' => [
                        [
                            'uri' => '/pvh-sofity/',
                            'name' => 'ПВХ софиты',
                        ],
                        [
                            'uri' => '/metallicheskie-sofity/',
                            'name' => 'Металлические софиты',
                        ],
                    ]
                ],
                [
                    'uri' => '/dobornye-elementy/',
                    'name' => 'Доборные элементы для кровли',
                ],
                [
                    'uri' => '/komplektuyushhie/',
                    'name' => 'Комплектующие',
                ],
            ];
            break;


        // -------------------------------------
        // Кирпич
        // -------------------------------------
        // case 'kirpich-m':
        // $categories = [
        // [
        // 'uri' => '',
        // 'name' => 'Кирпич',
        // 'children' => [
        // [
        // 'uri' => '/oblicovochnye/',
        // 'name' => 'Облицовочный (лицевой) кирпич',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/stroitelnye/',
        // 'name' => 'Строительный (рядовой) кирпич',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/klinkernye/',
        // 'name' => 'Клинкерный кирпич',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/dlya-pechi/',
        // 'name' => 'Печной кирпич',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/silikatnyj/',
        // 'name' => 'Силикатный кирпич',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/lsr/',
        // 'name' => 'Кирпич ЛСР',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/keramobloki/',
        // 'name' => 'Керамический блок',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/porizovannye/',
        // 'name' => 'Поризованный кирпич',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/ruchnoj-formovki/',
        // 'name' => 'Кирпич ручной формовки',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/rigelnyj/',
        // 'name' => 'Кирпич ригельный',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/kirpich-s-klejmom/',
        // 'name' => 'Кирпич с клеймом',
        // 'children' => []
        // ],


        // ]
        // ],
        // [
        // 'uri' => '/fasadnyj-dekor/',
        // 'name' => 'Фасадный декор',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/kladochnye-smesi/',
        // 'name' => 'Кладочные смеси',
        // 'children' => []
        // ],
        // [
        // 'uri' => '',
        // 'name' => 'Фасадная плитка, отделка',
        // 'children' => [
        // [
        // 'uri' => '/fasadnaya-plitka/',
        // 'name' => 'Фасадная плитка',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/plitka-dlya-navesnyh-fasadov/',
        // 'name' => 'Плитка для навесных фасадов',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/plitka-dlya-pechej-i-kaminov/',
        // 'name' => 'Плитка для печей и каминов',
        // 'children' => []
        // ],
        // ]
        // ],
        // [
        // 'uri' => '/klinkernaya-bruschatka/',
        // 'name' => 'Клинкерная брусчатка',
        // 'children' => []
        // ],
        // [
        // 'uri' => '',
        // 'name' => 'Искусственный и натуральный камень',
        // 'children' => [
        // [
        // 'uri' => '/iskusstvennyj-kamen-dlya-fasada/',
        // 'name' => 'Искусственный камень для фасада',
        // 'children' => []
        // ],
        // [
        // 'uri' => '/dekorativnyij-kamen-dlya-vnutrennej-otdelki/',
        // 'name' => 'Декоративный камень для внутренней отделки',
        // 'children' => []
        // ]
        // ]
        // ],
        // ];
        // break;


        // -------------------------------------
        // Арматура
        // -------------------------------------
        case 'armatura-178':
            $categories = [
                [
                    'uri' => '',
                    'name' => 'Арматура',
                    'children' => [
                        [
                            'uri' => '/armatura-a1-gladkaya/',
                            'name' => 'Гладкая арматура',
                            'children' => []
                        ],
                        [
                            'uri' => '/armatura-a3-riflenaya/',
                            'name' => 'Рифленая арматура',
                            'children' => []
                        ],
                        [
                            'uri' => '/katanka/',
                            'name' => 'Катанка',
                            'children' => []
                        ],
                        [
                            'uri' => '/komplektuyushie/',
                            'name' => 'Комплектующие к арматуре',
                            'children' => []
                        ],
                    ]
                ],
                [
                    'uri' => '/stalnye-truby/',
                    'name' => 'Стальные трубы',
                    'children' => [
                        [
                            'uri' => '/kvadratnye-truby/',
                            'name' => 'Квадратные трубы',
                            'children' => []
                        ],
                        [
                            'uri' => '/kruglye-truby/',
                            'name' => 'Круглые трубы',
                            'children' => []
                        ],
                        [
                            'uri' => '/truby-profilnye/',
                            'name' => 'Профильные трубы',
                            'children' => []
                        ],
                    ]
                ],
                [
                    'uri' => '/ugolki/',
                    'name' => 'Уголки',
                    'children' => [
                        [
                            'uri' => '/ugolki-ravnopolochnye/',
                            'name' => 'Равнополочные уголки',
                            'children' => []
                        ],
                        [
                            'uri' => '/ugolki-neravnopolochnye/',
                            'name' => 'Неравнополочные уголки',
                            'children' => []
                        ],
                    ]
                ],
            ];
            break;


        // -------------------------------------
        // Плиты ОСБ
        // -------------------------------------
        case 'plitaosb':
            $categories = [
                [
                    'uri' => '/osb/',
                    'name' => 'OSB плиты',
                    'children' => [
                        [
                            'uri' => '/osb-plity-kalevala-ehkodom/',
                            'name' => 'Калевала ЭкоДом',
                            'children' => []
                        ],
                        [
                            'uri' => '/osb-plity-kronoshpan/',
                            'name' => 'Кроношпан',
                            'children' => []
                        ],
                        [
                            'uri' => '/osb-plity-murom/',
                            'name' => 'Муром',
                            'children' => []
                        ],
                        [
                            'uri' => '/osb-plity-talion-ultralam/',
                            'name' => 'Талион (Ультралам)',
                            'children' => []
                        ],
                    ],
                ],
                [
                    'uri' => '/giprok-gipsokarton/',
                    'name' => 'Гипрок (гипсокартон)',
                    'children' => [
                        [
                            'uri' => '/giprok-knauf/',
                            'name' => 'Knauf',
                            'children' => []
                        ],
                        [
                            'uri' => '/giprok-gipsokarton-volma/',
                            'name' => 'Volma',
                            'children' => []
                        ],
                        [
                            'uri' => '/gipsokarton-giprok/',
                            'name' => 'Gyproc',
                            'children' => []
                        ],
                        [
                            'uri' => '/profil-dlya-gipsokartona/',
                            'name' => 'Профиль для гипсокартона',
                            'children' => []
                        ],
                    ],
                ],
                [
                    'uri' => '/gvl/',
                    'name' => 'ГВЛ (гипсоволокнистые плиты)',
                    'children' => [
                        [
                            'uri' => '/gvl-knauf/',
                            'name' => 'Knauf',
                            'children' => []
                        ],
                    ],
                ],
                [
                    'uri' => '/dsp/',
                    'name' => 'ДСП плиты',
                    'children' => [
                        [
                            'uri' => '/dsp-plity-quickdeck/',
                            'name' => 'QuickDeck',
                            'children' => []
                        ],
                    ],
                ],
                [
                    'uri' => '/csp-plity/',
                    'name' => 'ЦСП плиты',
                    'children' => [
                        [
                            'uri' => '/csp-pod-kirpich/',
                            'name' => 'под кирпич',
                            'children' => []
                        ],
                    ],
                ],
                [
                    'uri' => '/fibrolitovye-plity/',
                    'name' => 'Фибролитовые плиты',
                    'children' => [
                        [
                            'uri' => '/fibrolitovye-plity-nordeco/',
                            'name' => 'Nordeco',
                            'children' => []
                        ],
                        [
                            'uri' => '/fibrolitovye-plity-green-board/',
                            'name' => 'Green Board',
                            'children' => []
                        ],
                    ],
                ],
            ];
            break;


        // -------------------------------------
        // Фасады
        // -------------------------------------
        case 'fasad':
            $categories = [
                [
                    "uri" => "/sajding/",
                    "name" => "Сайдинг"
                ],
                [
                    "uri" => "/vinilovyj-sajding/",
                    "name" => "Виниловый сайдинг",
                    "children" => [
                        [
                            "uri" => "/vinilovyj-sajding-docke/",
                            "name" => "Docke"
                        ],
                        [
                            "uri" => "/vinilovyj-sajding-alta-profil/",
                            "name" => "Альта-Профиль"
                        ],
                        [
                            "uri" => "/vinilovyj-sajding-grand-line/",
                            "name" => "Grand Line"
                        ],
                        [
                            "uri" => "/vinilovyy-sayding-yu-plast/",
                            "name" => "Ю-Пласт"
                        ],
                        [
                            "uri" => "/nordside/",
                            "name" => "NordSide"
                        ],
                        [
                            "uri" => "/vinilovyj-sajding-mitten/",
                            "name" => "Mitten"
                        ],
                        [
                            "uri" => "/prodazha-vinilovogo-sajdinga-vox-v-sankt-peterburge/",
                            "name" => "VOX"
                        ],
                        [
                            "uri" => "/vinilovyy-sayding-fineber/",
                            "name" => "FineBer"
                        ],
                        [
                            "uri" => "/vinylon/",
                            "name" => "VINYLON"
                        ],
                        [
                            "uri" => "/komplektuyushhie-dlya-vinilovogo-sajdinga/",
                            "name" => "Комплектующие для винилового сайдинга"
                        ],

                    ]
                ],
                [
                    "uri" => "/metallicheskij-sajding/",
                    "name" => "Металлический сайдинг",
                    "children" => [
                        [
                            "uri" => "/metallicheskij-sajding-aquasystem/",
                            "name" => "Аквасистем"
                        ],
                        [
                            "uri" => "/metallicheskij-sajding-grand-line/",
                            "name" => "Grand Line"
                        ],
                        [
                            "uri" => "/metallicheskij-sajding-metallprofil/",
                            "name" => "Металл-Профиль"
                        ],
                        [
                            "uri" => "https://www-fasad.ru/komplektuyushhie-dlya-metallicheskogo-sajdinga/",
                            "name" => "Комплектующие для металлического сайдинга"
                        ]
                    ]
                ],
                [
                    "uri" => "/vspenennyij-sajding/",
                    "name" => "Вспененный сайдинг"
                ],
                [
                    "uri" => "/fibrocementnyj-sajding/",
                    "name" => "Фиброцементный сайдинг",
                    "children" => [
                        [
                            "uri" => "/fibrocementnyj-sajding-cedral/",
                            "name" => "Кедрал"
                        ],

                        [
                            "uri" => "/fibrocementnyj-sajding-dekover/",
                            "name" => "Дековер"
                        ],
                        [
                            "uri" => "/kanion/",
                            "name" => "Каньон"
                        ],

                        [
                            "uri" => "/fibrocementnyj-sajding-beteko/",
                            "name" => "БЕТЭКО"
                        ],

                        [
                            "uri" => "/fcs-group/",
                            "name" => "FCS Group"
                        ],

                        [
                            "uri" => "/fibrocementnyj-sajding-fibratek/",
                            "name" => "Фибратек"
                        ],
                        [
                            "uri" => "/fibrocementnyj-sajding-sm-bord/",
                            "name" => "СМ Борд"
                        ],
                        [
                            "uri" => "/fibrocementnyj-sajding-latonit/",
                            "name" => "LATONIT"
                        ],
                        [
                            "uri" => "/asahi/",
                            "name" => "Asahi"
                        ],
                        [
                            "uri" => "/fibrocementnyj-sajding/",
                            "name" => "Комплектующие для фиброцементного сайдинга"
                        ],


                    ]
                ],
                [
                    "uri" => "/akrilovyij-sajding/",
                    "name" => "Акриловый сайдинг",
                    "children" => [
                        [
                            "uri" => "/akrilovyij-sajding-alta-profil/",
                            "name" => "Альта-Профиль"
                        ],
                        [
                            "uri" => "/akrilovyij-sajding-tecos/",
                            "name" => "Tecos"
                        ],
                        [
                            "uri" => "/akrilovyij-sajding-fineber/",
                            "name" => "FineBer"
                        ],
                        [
                            "uri" => "/akrilovyij-sajding-grand-line/",
                            "name" => "Grand-Line"
                        ]
                    ]
                ],
                [
                    "uri" => "/formovannyij-sajding/",
                    "name" => "Формованный сайдинг"
                ],
                [
                    "uri" => "/sofityi/",
                    "name" => "Софиты",
                    "children" => [
                        [
                            "uri" => "/alta-profil/",
                            "name" => "Альта-Профиль"
                        ],
                        [
                            "uri" => "/sofit-metall-profil/",
                            "name" => "Металл Профиль"
                        ],
                        [
                            "uri" => "/sofityi-deke/",
                            "name" => "Docke"
                        ],
                        [
                            "uri" => "/sofityi-grand-lajn/",
                            "name" => "Grand-Line"
                        ],
                        [
                            "uri" => "/sofityi-yu-plast/",
                            "name" => "Ю-Пласт"
                        ],
                        [
                            "uri" => "/sofityi-texnonikol/",
                            "name" => "ТехноНИКОЛЬ"
                        ],
                    ]
                ],
                [
                    "uri" => "/fasadnye-plastikovye-paneli/",
                    "name" => "Фасадные пластиковые панели",
                    "children" => [
                        [
                            "uri" => "/fasadnye-paneli-docke/",
                            "name" => "Docke"
                        ],
                        [
                            "uri" => "/fasadnye-paneli-alta-profil/",
                            "name" => "Альта-Профиль"
                        ],
                        [
                            "uri" => "/fasadnye-paneli-vox/",
                            "name" => "Vox"
                        ],
                        [
                            "uri" => "/fasadnye-paneli-u-plast/",
                            "name" => "Ю-пласт"
                        ],
                        [
                            "uri" => "/fasadnye-paneli-vilostone/",
                            "name" => "Vilostone (Вилостоун)"
                        ],
                        [
                            "uri" => "/fasadnye-paneli-fineber/",
                            "name" => "Fineber"
                        ],
                        [
                            "uri" => "/fasadnye-paneli-grand-line/",
                            "name" => "Grand Line"
                        ]
                    ]
                ],
                [
                    "uri" => "/fasadnaya-shtukaturka/",
                    "name" => "Фасадная штукатурка",
                    "children" => [
                        [
                            "uri" => "/fasadnaya-shtukaturka-baumit/",
                            "name" => "Baumit"
                        ]
                    ]
                ],
                [
                    "uri" => "/fasadnaya-plitka-hauberk/",
                    "name" => "Фасадная плитка Технониколь Hauberk"
                ],
                [
                    "uri" => "/fasadnye-termopaneli/",
                    "name" => "Фасадные термопанели"
                ]
            ];

            break;


        // -------------------------------------
        // Фанера
        // -------------------------------------
        case 'pro-fanera':
            $categories = [
                [
                    'uri' => '/fanera-fk/',
                    'name' => 'Фанера ФК',
                ],
                [
                    'uri' => '/fanera-fsf/',
                    'name' => 'Фанера ФСФ',
                ],
                [
                    'uri' => '/laminirovannaya-fanera/',
                    'name' => 'Ламинированная фанера',
                ],
                [
                    'uri' => '/transportnaya-fanera/',
                    'name' => 'Транспортная фанера',
                ],
                [
                    'uri' => '/bakelitovaya-fanera/',
                    'name' => 'Бакелитовая фанера ФБВ',
                ],
                [
                    'uri' => '/bakelitovaya-fanera/',
                    'name' => 'Бакелитовая фанера ФБС',
                ],
            ];

            break;


        // -------------------------------------
        // policarbonat
        // -------------------------------------
        case 'policarbonat':
            $categories = [
                [
                    'uri' => '/sotovyj-polikarbonat/',
                    'name' => 'Сотовый поликарбонат',
                ],
                [
                    'uri' => '/monolitnyj-polikarbonat/',
                    'name' => 'Монолитный поликарбонат',
                ],
                [
                    'uri' => '/profilirovannyj-polikarbonat/',
                    'name' => 'Профилированный поликарбонат',
                ],
                [
                    'uri' => '/komplektuyushhie/',
                    'name' => 'Комплектующие для поликарбоната',
                ],
            ];

            break;


        // -------------------------------------
        // isorok
        // -------------------------------------
        case 'isorok':
            $categories = [
                ["uri" => "izolait", "name" => "Изолайт"],
                ["uri" => "izovent", "name" => "Изовент"],
                ["uri" => "izokor-s", "name" => "Изокор-С"],
                ["uri" => "izoruf", "name" => "Изоруф"],
                ["uri" => "izofas", "name" => "Изофас"],
                ["uri" => "izoflor", "name" => "Изофлор"],
                ["uri" => "p-125", "name" => "П-125"],
                ["uri" => "p-75", "name" => "П-75"],
                ["uri" => "pp-60", "name" => "ПП-60"],
                ["uri" => "pp-75", "name" => "ПП-75"],
                ["uri" => "pp-80", "name" => "ПП-80"],
                ["uri" => "ultralajt", "name" => "УльтраЛайт"],
                ["uri" => "super-tepliy", "name" => "Супер Теплый"],
                ["uri" => "plita-po-gostu", "name" => "Плита по ГОСТу "],
                ["uri" => "termozashhita", "name" => "Термозащита"],
                ["uri" => "klin", "name" => "Клин"],
                ["uri" => "komplektuyushhie-tovary", "name" => "Комплектующие товары"],
                ["uri" => "polimernyie-gidroizolyaczionnyie-membranyi", "name" => "Полимерные гидроизоляционные мембраны"]
            ];

            break;


        // -------------------------------------
        // Юматекс
        // -------------------------------------
        case 'umatex':
            $categories = [
                [
                    'name' => 'Юматекс Термо WAS 50',
                    'uri' => '/umatex-termo-was-50/',
                ],
                [
                    'name' => 'Юматекс Термо WAS 120',
                    'uri' => '/umatex-termo-was-120/',
                ],
                [
                    'name' => 'Юматекс Термо CGL 20',
                    'uri' => '/umatex-termo-cgl-20/',
                ],
                [
                    'name' => 'Юматекс Термо Fatio',
                    'uri' => '/umatex-termo-fatio/',
                ],
                [
                    'name' => 'Юматекс Термо FPS 14',
                    'uri' => '/umatex-termo-fps-14/',
                ],
                [
                    'name' => 'Юматекс Термо FPS 17',
                    'uri' => '/umatex-termo-fps-17/',
                ],
                [
                    'name' => 'Юматекс Термо GRS 20',
                    'uri' => '/umatex-termo-grs-20/',
                ],
                [
                    'name' => 'Юматекс Термо InWall',
                    'uri' => '/umatex-termo-inwall/',
                ],
                [
                    'name' => 'Юматекс Термо Light',
                    'uri' => '/umatex-termo-light/',
                ],
                [
                    'name' => 'Юматекс Термо Plus',
                    'uri' => '/umatex-termo-plus/',
                ],
                [
                    'name' => 'Юматекс Термо Smart',
                    'uri' => '/umatex-termo-smart-xl/',
                ],
                [
                    'name' => 'Юматекс Термо Linio 10',
                    'uri' => '/umatex-termo-linio-10/',
                ],
                [
                    'name' => 'Юматекс Термо Linio 15',
                    'uri' => '/umatex-termo-linio-15/',
                ],
                [
                    'name' => 'Юматекс Термо Linio 18',
                    'uri' => '/umatex-termo-linio-18/',
                ],
                [
                    'name' => 'Юматекс Термо Linio 20',
                    'uri' => '/umatex-termo-linio-20/',
                ],
                [
                    'name' => 'Юматекс Термо Linio 80',
                    'uri' => '/umatex-termo-linio-80/',
                ],
                [
                    'name' => 'Юматекс Термо ROB 60',
                    'uri' => '/umatex-termo-rob-60/',
                ],
                [
                    'name' => 'Юматекс Термо ROB 80',
                    'uri' => '/umatex-termo-rob-80/',
                ],
                [
                    'name' => 'Юматекс Термо ROL 40',
                    'uri' => '/umatex-termo-rol-40/',
                ],
                [
                    'name' => 'Юматекс Термо ROL 60',
                    'uri' => '/umatex-termo-rol-60/',
                ],
                [
                    'name' => 'Юматекс Термо ROS 30',
                    'uri' => '/umatex-termo-ros-30/',
                ],
                [
                    'name' => 'Юматекс Термо ROS 40',
                    'uri' => '/umatex-termo-ros-40/',
                ],
                [
                    'name' => 'Юматекс Термо ROS 50',
                    'uri' => '/umatex-termo-ros-50/',
                ],
                [
                    'name' => 'Юматекс Термо ROS 60',
                    'uri' => '/umatex-termo-ros-60/',
                ],
                [
                    'name' => 'Юматекс Термо ROS 80t',
                    'uri' => '/umatex-termo-ros-80t/',
                ],
                [
                    'name' => 'Юматекс Термо SSB 1',
                    'uri' => '/umatex-termo-ssb-1/',
                ],
                [
                    'name' => 'Юматекс Термо SSB 4',
                    'uri' => '/umatex-termo-ssb-4/',
                ],
                [
                    'name' => 'Юматекс Термо WAS 25',
                    'uri' => '/umatex-termo-was-25/',
                ],
                [
                    'name' => 'Юматекс Термо WAS 35',
                    'uri' => '/umatex-termo-was-35/',
                ]
            ];

            break;


        // -------------------------------------
        // Ugol
        // -------------------------------------
        case 'ugol':
            $categories = [
                [
                    'name' => 'Каменный уголь',
                    'uri' => '/kamenniy-ugol/',
                    'children' => [
                        [
                            'name' => 'Длиннопламенный уголь',
                            'uri' => '/marki-d/'
                        ],
                        [
                            'name' => 'Уголь ДПК',
                            'uri' => '/dpk/'
                        ],
                        [
                            'name' => 'Уголь ДО',
                            'uri' => '/do/'
                        ],
                        [
                            'name' => 'Уголь ДОМ',
                            'uri' => '/dom/'
                        ],
                        [
                            'name' => 'Уголь антрацит',
                            'uri' => '/antracit/'
                        ],
                        [
                            'name' => 'Уголь бурый',
                            'uri' => '/buryj/'
                        ],
                        [
                            'name' => 'Уголь ССПК',
                            'uri' => '/sspk/'
                        ],
                        [
                            'name' => 'Уголь тощий',
                            'uri' => '/toshchij/'
                        ],
                    ]
                ],
                [
                    'name' => 'Древесный уголь',
                    'uri' => '/drevesniy-ugol'
                ]
            ];
            break;


        // -------------------------------------
        // brikety 
        // -------------------------------------
        case 'brikety':
            $categories = [
                [
                    "uri" => "/ruf/",
                    "name" => "Брикеты RUF"
                ],
                [
                    "uri" => "/pini-kay/",
                    "name" => "Брикеты PINI KAY"
                ],
                [
                    "uri" => "/nestro/",
                    "name" => "Брикеты NESTRO"
                ],
                [
                    "uri" => "/nielsen/",
                    "name" => "Брикеты NIELSEN"
                ],
                [
                    "uri" => "/berezovye/",
                    "name" => "Берёзовые брикеты"
                ],
                [
                    "uri" => "/ugolnye/",
                    "name" => "Угольные брикеты"
                ],
                [
                    "uri" => "/torfyanye/",
                    "name" => "Торфяные брикеты"
                ],
                [
                    "uri" => "/hvoya/",
                    "name" => "Брикеты из хвои"
                ],
                [
                    "uri" => "/dub/",
                    "name" => "Брикеты из дуба"
                ],
            ];
            break;

        // -------------------------------------
        // drova 
        // -------------------------------------
        case 'drova':
            $categories = [
                [
                    "uri" => "/kolotye/",
                    "name" => "Колотые дрова"
                ],
                [
                    "uri" => "/ne-kolotye/",
                    "name" => "Не колотые дрова"
                ],
                [
                    "uri" => "/kamernoj-sushki/",
                    "name" => "Дрова камерной сушки"
                ],
                [
                    "uri" => "/v-setke/",
                    "name" => "Дрова в сетке"
                ],
            ];
            break;

        // -------------------------------------
        // pellety 
        // -------------------------------------
        case 'pellety':
            $categories = [
                [
                    "uri" => "/belye/",
                    "name" => "Пеллеты белые"
                ],
                [
                    "uri" => "/serye/",
                    "name" => "Пеллеты серые"
                ]
            ];
            break;
    }
}

// Конвертация из JSON в массив
//if (!in_array($context, ['kirpich-m', 'armatura-178', 'plitaosb', 'fasad'])) {
//$categories = trim(preg_replace('/\s+/', ' ', $categories));
//$categories = preg_replace('/,\s*([\]\}])/m', '$1', $categories);
//// Без этой строчки не получится json_decode
//$categories = mb_convert_encoding($categories, 'utf-8', mb_detect_encoding($categories));
//$categories = json_decode($categories, 1);
//}

// Убираем детей в доборных элементах на кровле
//if ($context == 'krovlya') {
//$key = array_search('Доборные элементы для кровли', array_column($categories, 'name'));
//if ($key !== false) {
//$categories[$key]['children'] = [];
//}
//}

if (is_null($categories)) {
    $categories = [];
}

// --------------------------------------
// Товары
// --------------------------------------
switch ($context) {
    case "rockwool":
        $primenenieResult = [
            [
                "uri" => "/dlya-peregorodok/",
                "name" => "Для перегородок",
            ],
            [
                "uri" => "/dlya-sten/",
                "name" => "Для стен",
            ],
            [
                "uri" => "/dlya-potolka/",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" => "/dlya-perekrytij/",
                "name" => "Для перекрытий",
            ],
            [
                "uri" => "/dlya-fasada/",
                "name" => "Для фасада",
            ],
            [
                "uri" => "/dlya-mansardy/",
                "name" => "Для мансарды",
            ],
            [
                "uri" => "/dlya-krovli/",
                "name" => "Для кровли",
            ],
            [
                "uri" => "/dlya-balkona/",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/dlya-bani-i-sauny/",
                "name" => "Для бани",
            ],
            [
                "uri" => "/dlya-kaminov/",
                "name" => "Для печи/камина",
            ],
            [
                "uri" => "/dlya-trub/",
                "name" => "Для труб",
            ],
            [
                "uri" => "/pod-shtukaturku-fasada/",
                "name" => "Под штукатурку",
            ],
            [
                "uri" => "/catalog/?primenenie=Для%20вентиляции",
                "name" => "Для вентиляции",
            ],
        ];
        $thicknessResult = [
            [
                "uri" => "/20-mm/",
                "name" => "20",
            ],
            [
                "uri" => "/25-mm/",
                "name" => "25",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=27",
                "name" => "27",
            ],
            [
                "uri" => "/30-mm/",
                "name" => "30",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=35",
                "name" => "35",
            ],
            [
                "uri" => "/40-mm/",
                "name" => "40",
            ],
            [
                "uri" => "/50-mm/",
                "name" => "50",
            ],
            [
                "uri" => "/60-mm/",
                "name" => "60",
            ],
            [
                "uri" => "/70-mm/",
                "name" => "70",
            ],
            [
                "uri" => "/75-mm/",
                "name" => "75",
            ],
            [
                "uri" => "/80-mm/",
                "name" => "80",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=90",
                "name" => "90",
            ],
            [
                "uri" => "/100-mm/",
                "name" => "100",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=102",
                "name" => "102",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=105",
                "name" => "105",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=110",
                "name" => "110",
            ],
            [
                "uri" => "/120-mm/",
                "name" => "120",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=122",
                "name" => "122",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=130",
                "name" => "130",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=140",
                "name" => "140",
            ],
            [
                "uri" => "/150-mm/",
                "name" => "150",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=152",
                "name" => "152",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=160",
                "name" => "160",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=170",
                "name" => "170",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=180",
                "name" => "180",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=190",
                "name" => "190",
            ],
            [
                "uri" => "/200-mm/",
                "name" => "200",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=210",
                "name" => "210",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=220",
                "name" => "220",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=230",
                "name" => "230",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=240",
                "name" => "240",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=250",
                "name" => "250",
            ],
        ];
        break;
    case "penoplex":
        $primenenieResult = [
            [
                "uri" => "/penoplex-dlya-balkona/",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/penoplex-dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/penoplex-dlya-sten/",
                "name" => "Для стен",
            ],
            [
                "uri" => "/penoplex-dlya-fundamenta/",
                "name" => "Для фундамента/цоколя",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                "name" => "Для перегородок",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                "name" => "Для фасада",
            ],
            [
                "uri" => "/penoplex-dlya-krovli/",
                "name" => "Для кровли",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                "name" => "Для вентиляции",
            ],
            [
                "uri" => "/penoplex-dlya-trub/",
                "name" => "Для труб",
            ],
        ];
        $thicknessResult = [
            [
                "uri" => "/penoplex-20-mm/",
                "name" => "20",
            ],
            [
                "uri" => "/penoplex-30-mm/",
                "name" => "30",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=30.4",
                "name" => "30.4",
            ],
            [
                "uri" => "/penoplex-40-mm/",
                "name" => "40",
            ],
            [
                "uri" => "/penoplex-50-mm/",
                "name" => "50",
            ],
            [
                "uri" => "/penoplex-60-mm/",
                "name" => "60",
            ],
            [
                "uri" => "/penoplex-80-mm/",
                "name" => "80",
            ],
            [
                "uri" =>
                "/penoplex-100-mm/",
                "name" => "100",
            ],
            [
                "uri" =>
                "/penoplex-120-mm/",
                "name" => "120",
            ],
            [
                "uri" =>
                "/penoplex-150-mm/",
                "name" => "150",
            ],
        ];
        break;
    case "tn":
        $primenenieResult = [
            [
                "uri" =>
                "/dlya-krovli/",
                "name" => "Для кровли",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                "name" => "Для мансарды",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                "name" => "Для перегородок",
            ],
            [
                "uri" => "/dlya-perekrytij/",
                "name" => "Для перекрытий",
            ],
            [
                "uri" =>
                "/dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" =>
                "/dlya-fasada/",
                "name" => "Для фасада",
            ],
            [
                "uri" =>
                "/dlya-sten/",
                "name" => "Для стен",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BE%D0%BA%D0%BE%D0%BD",
                "name" => "Для окон",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%9F%D0%BE%D0%B4+%D1%88%D1%82%D1%83%D0%BA%D0%B0%D1%82%D1%83%D1%80%D0%BA%D1%83",
                "name" => "Под штукатурку",
            ],
            [
                "uri" => "/dlya-balkona/",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/dlya-fundamenta/",
                "name" => "Для фундамента/цоколя",
            ],
            [
                "uri" => "/dlya-potolka/",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/dlya-ventfasada/",
                "name" => "Для вентиляции",
            ],
            [
                "uri" => "/dlya-trub/",
                "name" => "Для труб",
            ],
            [
                "uri" => "/dlya-bani-i-sauny/",
                "name" => "Для бани",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B9+%D0%BA%D0%BE%D0%BC%D0%BD%D0%B0%D1%82%D1%8B",
                "name" => "Для ванной комнаты",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B4%D0%B2%D0%B5%D1%80%D0%B5%D0%B9+%D0%B8+%D0%B2%D0%BE%D1%80%D0%BE%D1%82",
                "name" => "Для дверей и ворот",
            ],
        ];
        $thicknessResult = [
            [
                "uri" => "/5-mm/",
                "name" => "5",
            ],
            [
                "uri" => "/10-mm/",
                "name" => "10",
            ],
            [
                "uri" => "/20-mm/",
                "name" => "20",
            ],
            [
                "uri" => "/catalog/?item_thickness=22",
                "name" => "22",
            ],
            [
                "uri" => "/30-mm/",
                "name" => "30",
            ],
            [
                "uri" => "/40-mm/",
                "name" => "40",
            ],
            [
                "uri" => "/50-mm/",
                "name" => "50",
            ],
            [
                "uri" => "/catalog/?item_thickness=55",
                "name" => "55",
            ],
            [
                "uri" => "/catalog/?item_thickness=60",
                "name" => "60",
            ],
            [
                "uri" => "/70-mm/",
                "name" => "70",
            ],
            [
                "uri" => "/80-mm/",
                "name" => "80",
            ],
            [
                "uri" => "/catalog/?item_thickness=90",
                "name" => "90",
            ],
            [
                "uri" => "/100-mm/",
                "name" => "100",
            ],
            [
                "uri" => "/catalog/?item_thickness=110",
                "name" => "110",
            ],
            [
                "uri" => "/120-mm/",
                "name" => "120",
            ],
            [
                "uri" => "/catalog/?item_thickness=130",
                "name" => "130",
            ],
            [
                "uri" => "/catalog/?item_thickness=140",
                "name" => "140",
            ],
            [
                "uri" => "/150-mm/",
                "name" => "150",
            ],
            [
                "uri" => "/catalog/?item_thickness=160",
                "name" => "160",
            ],
            [
                "uri" => "/catalog/?item_thickness=170",
                "name" => "170",
            ],
            [
                "uri" => "/catalog/?item_thickness=180",
                "name" => "180",
            ],
            [
                "uri" => "/catalog/?item_thickness=190",
                "name" => "190",
            ],
            [
                "uri" => "/200-mm/",
                "name" => "200",
            ],
        ];
        break;
    case "paroc":
        $primenenieResult = [
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/dlya-krovli/",
                "name" => "Для кровли",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                "name" => "Для мансарды",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                "name" => "Для перегородок",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9",
                "name" => "Для перекрытий",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D0%BB%D0%B0",
                "name" => "Для пола",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                "name" => "Для потолка",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                "name" => "Для стен",
            ],
            [
                "uri" => "/dlya-fasada/",
                "name" => "Для фасада",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2F%D1%86%D0%BE%D0%BA%D0%BE%D0%BB%D1%8F",
                "name" => "Для фундамента/цоколя",
            ],
        ];
        $thicknessResult = [
            [
                "uri" => "/30-mm/",
                "name" => "30",
            ],
            [
                "uri" => "/50-mm/",
                "name" => "50",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=90",
                "name" => "90",
            ],
            [
                "uri" => "/100-mm/",
                "name" => "100",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=117",
                "name" => "117",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=122",
                "name" => "122",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=126",
                "name" => "126",
            ],
            [
                "uri" => "/150-mm/",
                "name" => "150",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=151",
                "name" => "151",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=350",
                "name" => "350",
            ],
        ];
        break;
    case "ursa":
        $primenenieResult = [
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/dlya-bani-i-sauny/",
                "name" => "Для бани",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                "name" => "Для вентиляции",
            ],
            [
                "uri" => "/dlya-kryshi/",
                "name" => "Для кровли",
            ],
            [
                "uri" =>
                "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                "name" => "Для перегородок",
            ],
            [
                "uri" => "/dlya-perekrytij/",
                "name" => "Для перекрытий",
            ],
            [
                "uri" => "/dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" => "/dlya-potolka/",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/dlya-sten/",
                "name" => "Для стен",
            ],
            [
                "uri" => "/dlya-trub/",
                "name" => "Для труб",
            ],
            [
                "uri" => "/dlya-fasada/",
                "name" => "Для фасада",
            ],
            [
                "uri" => "/dlya-fundamenta/",
                "name" => "Для фундамента/цоколя",
            ],
        ];
        $thicknessResult = [
            [
                "uri" =>
                "/20-mm/",
                "name" => "20",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=25",
                "name" => "25",
            ],
            [
                "uri" =>
                "/30-mm/",
                "name" => "30",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=40",
                "name" => "40",
            ],
            [
                "uri" =>
                "/50-mm/",
                "name" => "50",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=60",
                "name" => "60",
            ],
            [
                "uri" =>
                "/80-mm/",
                "name" => "80",
            ],
            [
                "uri" =>
                "/100-mm/",
                "name" => "100",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=130",
                "name" => "130",
            ],
            [
                "uri" =>
                "/150-mm/",
                "name" => "150",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=180",
                "name" => "180",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=200",
                "name" => "200",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=1200",
                "name" => "1200",
            ],
        ];
        break;
    case "isover":
        $primenenieResult = [
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/dlya-bani/",
                "name" => "Для бани",
            ],
            [
                "uri" => "/dlya-krovli/",
                "name" => "Для кровли",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                "name" => "Для мансарды",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                "name" => "Для перегородок",
            ],
            [
                "uri" => "/dlya-perekrytij/",
                "name" => "Для перекрытий",
            ],
            [
                "uri" => "/dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                "name" => "Для стен",
            ],
            [
                "uri" => "/dlya-trub/",
                "name" => "Для труб",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                "name" => "Для фасада",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2F%D1%86%D0%BE%D0%BA%D0%BE%D0%BB%D1%8F",
                "name" => "Для фундамента/цоколя",
            ],
        ];
        $thicknessResult = [
            [
                "uri" => "/20-mm/",
                "name" => "20",
            ],
            [
                "uri" => "/catalog/?item_thickness=25",
                "name" => "25",
            ],
            [
                "uri" => "/catalog/?item_thickness=30",
                "name" => "30",
            ],
            [
                "uri" => "/catalog/?item_thickness=40",
                "name" => "40",
            ],
            [
                "uri" => "/50-mm/",
                "name" => "50",
            ],
            [
                "uri" => "/catalog/?item_thickness=60",
                "name" => "60",
            ],
            [
                "uri" => "/catalog/?item_thickness=65",
                "name" => "65",
            ],
            [
                "uri" => "/catalog/?item_thickness=75",
                "name" => "75",
            ],
            [
                "uri" => "/catalog/?item_thickness=80",
                "name" => "80",
            ],
            [
                "uri" => "/100-mm/",
                "name" => "100",
            ],
            [
                "uri" => "/catalog/?item_thickness=120",
                "name" => "120",
            ],
            [
                "uri" => "/150-mm/",
                "name" => "150",
            ],
        ];
        break;
    case "knauf":
        $primenenieResult = [
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BD%D0%B8",
                "name" => "Для бани",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                "name" => "Для вентиляции",
            ],
            [
                "uri" => "/dlya-kryshi/",
                "name" => "Для кровли",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                "name" => "Для мансарды",
            ],
            [
                "uri" => "/dlya-peregorodok/",
                "name" => "Для перегородок",
            ],
            [
                "uri" => "/dlya-perekrytij/",
                "name" => "Для перекрытий",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%87%D0%B8%2F%D0%BA%D0%B0%D0%BC%D0%B8%D0%BD%D0%B0",
                "name" => "Для печи/камина",
            ],
            [
                "uri" => "/dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                "name" => "Для стен",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%82%D1%80%D1%83%D0%B1",
                "name" => "Для труб",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                "name" => "Для фасада",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2F%D1%86%D0%BE%D0%BA%D0%BE%D0%BB%D1%8F",
                "name" => "Для фундамента/цоколя",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%9F%D0%BE%D0%B4+%D1%88%D1%82%D1%83%D0%BA%D0%B0%D1%82%D1%83%D1%80%D0%BA%D1%83",
                "name" => "Под штукатурку",
            ]
        ];
        // $vid_prod_result = [
        //     [
        //         "uri" => "/gruntovka/",
        //         "name" => "Грунтовка",
        //     ],
        //     [
        //         "uri" => "/klej-dlya-plitki/",
        //         "name" => "Клей для плитки",
        //     ],
        //     [
        //         "uri" => "/klej-dlya-uteplitelya/",
        //         "name" => "Клей для утеплителя",
        //     ],
        //     [
        //         "uri" => "/smesi-dlya-pola/",
        //         "name" => "Смеси для пола",
        //     ],
        //     [
        //         "uri" => "/smesi-dlya-fasadov/",
        //         "name" => "Смеси для фасадов",
        //     ],
        //     [
        //         "uri" => "/sypuchie-materialy/",
        //         "name" => "Сыпучие материалы",
        //     ],
        //     [
        //         "uri" => "/shpatlevka/",
        //         "name" => "Шпатлёвка",
        //     ],
        //     [
        //         "uri" => "/shtukaturka/",
        //         "name" => "Штукатурка",
        //     ]
        // ];
        $thicknessResult = [
            [
                "uri" =>
                "/catalog/?item_thickness=20",
                "name" => "20",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=27",
                "name" => "27",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=30",
                "name" => "30",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=40",
                "name" => "40",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=45",
                "name" => "45",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=47",
                "name" => "47",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=50",
                "name" => "50",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=60",
                "name" => "60",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=70",
                "name" => "70",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=75",
                "name" => "75",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=80",
                "name" => "80",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=90",
                "name" => "90",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=100",
                "name" => "100",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=110",
                "name" => "110",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=120",
                "name" => "120",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=150",
                "name" => "150",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=180",
                "name" => "180",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=200",
                "name" => "200",
            ],
        ];
        break;

    case "isorok":
        $primenenieResult = [
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B1%D0%B0%D0%BB%D0%BA%D0%BE%D0%BD%D0%B0%2F%D0%BB%D0%BE%D0%B4%D0%B6%D0%B8%D0%B8",
                "name" => "Для балкона/лоджии",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%B2%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D1%8F%D1%86%D0%B8%D0%B8",
                "name" => "Для вентиляции",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8",
                "name" => "Для кровли",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BC%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B",
                "name" => "Для мансарды",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA",
                "name" => "Для перегородок",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9",
                "name" => "Для перекрытий",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%B5%D1%87%D0%B8%2F%D0%BA%D0%B0%D0%BC%D0%B8%D0%BD%D0%B0",
                "name" => "Для печи/камина",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%BB%D0%B0",
                "name" => "Для пола",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D0%B0%D0%B9%D0%B4%D0%B8%D0%BD%D0%B3%D0%B0",
                "name" => "Для сайдинга",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%81%D1%82%D0%B5%D0%BD",
                "name" => "Для стен",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%82%D1%80%D1%83%D0%B1",
                "name" => "Для труб",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F+%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0",
                "name" => "Для фасада",
            ],
            [
                "uri" => "/catalog/?primenenie=%D0%9A%D1%80%D1%8B%D1%88%D0%B8",
                "name" => "Крыши",
            ]
        ];
        $thicknessResult = [
            [
                "uri" =>
                "/catalog/?item_thickness=1.2",
                "name" => "1.2",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=1.5",
                "name" => "1.5",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=27",
                "name" => "27",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=30",
                "name" => "30",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=40",
                "name" => "40",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=50",
                "name" => "50",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=60",
                "name" => "60",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=70",
                "name" => "70",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=80",
                "name" => "80",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=90",
                "name" => "90",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=100",
                "name" => "100",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=110",
                "name" => "110",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=120",
                "name" => "120",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=130",
                "name" => "130",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=140",
                "name" => "140",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=150",
                "name" => "150",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=160",
                "name" => "160",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=170",
                "name" => "170",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=180",
                "name" => "180",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=190",
                "name" => "190",
            ],
            [
                "uri" =>
                "/catalog/?item_thickness=200",
                "name" => "200",
            ],
        ];
        break;

    case 'pro-fanera':
        $primenenieResult = [
            [
                "uri" => "/fanera-dlya-pola/",
                "name" => "Для пола",
            ],
            [
                "uri" => "/fanera-dlya-lodok/",
                "name" => "Для лодки",
            ],
            [
                "uri" => "/fanera-dlya-opalubki/",
                "name" => "Для опалубки",
            ],
            [
                "uri" => "/fanera-dlya-lazernoj-rezki/",
                "name" => "Для лазерной резки",
            ],
            [
                "uri" => "/fanera-dlya-mebeli/",
                "name" => "Для мебели",
            ],
            [
                "uri" => "/fanera-dlya-igrushek/",
                "name" => "Для игрушек",
            ],
            [
                "uri" => "/fanera-dlya-potolka/",
                "name" => "Для потолка",
            ],
            [
                "uri" => "/fanera-dlya-sten/",
                "name" => "Для стен",
            ],
        ];
        $thicknessResult = [
            [
                "uri" => "/fanera-3-mm/",
                "name" => "3 мм",
            ],
            [
                "uri" => "/fanera-4-mm/",
                "name" => "4 мм",
            ],
            [
                "uri" => "/fanera-6-mm/",
                "name" => "6 мм",
            ],
            [
                "uri" => "/fanera-7-mm/",
                "name" => "7 мм",
            ],
            [
                "uri" => "/fanera-8-mm/",
                "name" => "8 мм",
            ],
            [
                "uri" => "/fanera-9-mm/",
                "name" => "9 мм",
            ],
            [
                "uri" => "/fanera-10-mm/",
                "name" => "10 мм",
            ],
            [
                "uri" => "/fanera-12-mm/",
                "name" => "12 мм",
            ],
            [
                "uri" => "/fanera-15-mm/",
                "name" => "15 мм",
            ],
            [
                "uri" => "/fanera-18-mm/",
                "name" => "18 мм",
            ],
            [
                "uri" => "/fanera-21-mm/",
                "name" => "21 мм",
            ],
            [
                "uri" => "/fanera-24-mm/",
                "name" => "24 мм",
            ],
            [
                "uri" => "/fanera-27-mm/",
                "name" => "27 мм",
            ],
            [
                "uri" => "/fanera-30-mm/",
                "name" => "30 мм",
            ],
            [
                "uri" => "/fanera-35-mm/",
                "name" => "35 мм",
            ],
            [
                "uri" => "/fanera-40-mm/",
                "name" => "40 мм",
            ],
        ];
        break;

    case 'umatex':
        $primenenieResult = [
            [
                "name" => "Вентилируемые фасады",
                "uri" => "/catalog/?primenenie=%D0%92%D0%B5%D0%BD%D1%82%D0%B8%D0%BB%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D1%8B%D0%B5%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D1%8B"
            ],
            [
                "name" => "Для дверей",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%B4%D0%B2%D0%B5%D1%80%D0%B5%D0%B9"
            ],
            [
                "name" => "Для кровли",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BA%D1%80%D0%BE%D0%B2%D0%BB%D0%B8"
            ],
            [
                "name" => "Для перегородок",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B3%D0%BE%D1%80%D0%BE%D0%B4%D0%BE%D0%BA"
            ],
            [
                "name" => "Для перекрытий",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B5%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D0%B9"
            ],
            [
                "name" => "Для подвалов",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%B4%D0%B2%D0%B0%D0%BB%D0%BE%D0%B2"
            ],
            [
                "name" => "Для пола",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D0%BB%D0%B0"
            ],
            [
                "name" => "Для потолка",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D0%BF%D0%BE%D1%82%D0%BE%D0%BB%D0%BA%D0%B0"
            ],
            [
                "name" => "Для стен",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%81%D1%82%D0%B5%D0%BD"
            ],
            [
                "name" => "Для труб",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%82%D1%80%D1%83%D0%B1"
            ],
            [
                "name" => "Для фасада",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%84%D0%B0%D1%81%D0%B0%D0%B4%D0%B0"
            ],
            [
                "name" => "Для фундамента",
                "uri" => "/catalog/?primenenie=%D0%94%D0%BB%D1%8F%20%D1%84%D1%83%D0%BD%D0%B4%D0%B0%D0%BC%D0%B5%D0%BD%D1%82%D0%B0"
            ],
            [
                "name" => "Звукоизоляция",
                "uri" => "/catalog/?primenenie=%D0%97%D0%B2%D1%83%D0%BA%D0%BE%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D1%8F"
            ],
            [
                "name" => "Камины и печи",
                "uri" => "/catalog/?primenenie=%D0%9A%D0%B0%D0%BC%D0%B8%D0%BD%D1%8B%20%D0%B8%20%D0%BF%D0%B5%D1%87%D0%B8"
            ],
            [
                "name" => "Каркасные конструкции",
                "uri" => "/catalog/?primenenie=%D0%9A%D0%B0%D1%80%D0%BA%D0%B0%D1%81%D0%BD%D1%8B%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8"
            ],
            [
                "name" => "Мансарды",
                "uri" => "/catalog/?primenenie=%D0%9C%D0%B0%D0%BD%D1%81%D0%B0%D1%80%D0%B4%D1%8B"
            ],
            [
                "name" => "Ненагружаемые конструкции",
                "uri" => "/catalog/?primenenie=%D0%9D%D0%B5%D0%BD%D0%B0%D0%B3%D1%80%D1%83%D0%B6%D0%B0%D0%B5%D0%BC%D1%8B%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8"
            ],
            [
                "name" => "Средний слой в кирпичной кладке",
                "uri" => "/catalog/?primenenie=%D0%A1%D1%80%D0%B5%D0%B4%D0%BD%D0%B8%D0%B9%20%D1%81%D0%BB%D0%BE%D0%B9%20%D0%B2%20%D0%BA%D0%B8%D1%80%D0%BF%D0%B8%D1%87%D0%BD%D0%BE%D0%B9%20%D0%BA%D0%BB%D0%B0%D0%B4%D0%BA%D0%B5"
            ],
            [
                "name" => "Техническая изоляция",
                "uri" => "/catalog/?primenenie=%D0%A2%D0%B5%D1%85%D0%BD%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F%20%D0%B8%D0%B7%D0%BE%D0%BB%D1%8F%D1%86%D0%B8%D1%8F"
            ],
            [
                "name" => "Универсальный",
                "uri" => "/catalog/?primenenie=%D0%A3%D0%BD%D0%B8%D0%B2%D0%B5%D1%80%D1%81%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9"
            ]
        ];
        $thicknessResult = [
            [
                "uri" => "/catalog/?item_thickness=20",
                "name" => "20",
            ],
            [
                "uri" => "/catalog/?item_thickness=25",
                "name" => "25",
            ],
            [
                "uri" => "/catalog/?item_thickness=30",
                "name" => "30",
            ],
            [
                "uri" => "/catalog/?item_thickness=40",
                "name" => "40",
            ],
            [
                "uri" => "/catalog/?item_thickness=50",
                "name" => "50",
            ],
            [
                "uri" => "/catalog/?item_thickness=60",
                "name" => "60",
            ],
            [
                "uri" => "/catalog/?item_thickness=70",
                "name" => "70",
            ],
            [
                "uri" => "/catalog/?item_thickness=75",
                "name" => "75",
            ],
            [
                "uri" => "/catalog/?item_thickness=100",
                "name" => "100",
            ],
            [
                "uri" => "/catalog/?item_thickness=120",
                "name" => "120",
            ],
            [
                "uri" => "/catalog/?item_thickness=150",
                "name" => "150",
            ],
        ];
        break;
}

$result = [];
if (!empty($categories)) {
    if (!in_array($context, (['krovlya', 'kirpich-m', 'armatura-178', 'plitaosb', 'fasad', 'ugol', 'pilomat']))) {
        $key = 'Продуктовые линейки';

        if ($context == 'knauf') {
            $key = 'Теплоизоляция';
        }

        // Сортировка продуктовых линеек для сайтов утеплителей
        if (in_array($context, ['web', 'knauf', 'tn', 'penoplex', 'isover', 'paroc', 'ursa'])) {
            usort($categories, function ($a, $b) {
                return strcmp(mb_strtolower($a['name']), mb_strtolower($b['name']));
            });

            if ($context == 'paroc') {
                $fstIndex = array_search('Утеплитель Юматекс Термо', array_column($categories, 'name'));
                if (!empty($fstIndex)) {
                    $fstData = $categories[$fstIndex];
                    unset($categories[$fstIndex]);
                    array_unshift($categories, $fstData);
                }
            }
        }

        $count = count($categories);
        switch (true) {
            case $count < 10:
                $result[$key][] = $categories;
                break;
            case $count >= 10 && $count <= 15:
                $amount = ceil($count / 2);
                $result[$key][] = array_slice($categories, 0, $amount);
                $result[$key][] = array_slice($categories, $amount, $count - 1);
                break;
            case $count > 15:
                $amount = ceil($count / 3);
                $twiceAmount = $amount + $amount;
                $result[$key][] = array_slice($categories, 0, $amount);
                $result[$key][] = array_slice($categories, $amount, $amount);
                $result[$key][] = array_slice($categories, $twiceAmount, $count - 1);
                break;
        }
        if (!empty($primenenieResult)) {
            if ($modx->resource->context_key !== 'krovlya') {
                $key = 'Применение';
            } else {
                $key = 'Цвет';
            }

            $count = count($primenenieResult);

            switch (true) {
                case $count < 10:
                    $result[$key][] = $primenenieResult;
                    break;
                case $count >= 10 && $count <= 15:
                    $amount = ceil($count / 2);
                    $result[$key][] = array_slice($primenenieResult, 0, $amount);
                    $result[$key][] = array_slice($primenenieResult, $amount, $count - 1);
                    break;
                case $count > 15:
                    $amount = ceil($count / 3);
                    $twiceAmount = $amount + $amount;
                    $result[$key][] = array_slice($primenenieResult, 0, $amount);
                    $result[$key][] = array_slice($primenenieResult, $amount, $amount);
                    $result[$key][] = array_slice($primenenieResult, $twiceAmount, $count - 1);
                    break;
            }
        }

        // if (!empty($vid_prod_result)) {
        //     $key = 'Вид продукции';

        //     $count = count($vid_prod_result);

        //     switch (true) {
        //         case $count < 10:
        //             $result[$key][] = $vid_prod_result;
        //             break;
        //         case $count >= 10 && $count <= 15:
        //             $amount = ceil($count / 2);
        //             $result[$key][] = array_slice($vid_prod_result, 0, $amount);
        //             $result[$key][] = array_slice($vid_prod_result, $amount, $count - 1);
        //             break;
        //         case $count > 15:
        //             $amount = ceil($count / 3);
        //             $twiceAmount = $amount + $amount;
        //             $result[$key][] = array_slice($vid_prod_result, 0, $amount);
        //             $result[$key][] = array_slice($vid_prod_result, $amount, $amount);
        //             $result[$key][] = array_slice($vid_prod_result, $twiceAmount, $count - 1);
        //             break;
        //     }
        // }

        if (!empty($thicknessResult)) {
            $key = 'Толщина, мм';
            $count = count($thicknessResult);

            switch (true) {
                case $count < 10:
                    $result[$key][] = $thicknessResult;
                    break;
                case $count >= 10 && $count <= 15:
                    $amount = ceil($count / 2);
                    $result[$key][] = array_slice($thicknessResult, 0, $amount);
                    $result[$key][] = array_slice($thicknessResult, $amount, $count - 1);
                    break;
                case $count > 15:
                    $amount = ceil($count / 3);
                    $twiceAmount = $amount + $amount;
                    $result[$key][] = array_slice($thicknessResult, 0, $amount);
                    $result[$key][] = array_slice($thicknessResult, $amount, $amount);
                    $result[$key][] = array_slice($thicknessResult, $twiceAmount, $count - 1);
                    break;
            }
        }
    } else {
        $count = count($categories);

        switch (true) {
            case ($modx->resource->context_key == 'fasad'):
                $result[] = array_slice($categories, 0, 1);
                $result[] = array_slice($categories, 1, 3);
                $result[] = array_slice($categories, 4, 3);
                $result[] = array_slice($categories, 7, $count);
                break;
            case ($modx->resource->context_key == 'plitaosb'):
                $result[] = array_slice($categories, 0, 1);
                $result[] = array_slice($categories, 1, 1);
                $result[] = array_slice($categories, 2, 2);
                $result[] = array_slice($categories, 4, $count);
                break;
            case ($modx->resource->context_key == 'krovlya'):
                $result[] = array_slice($categories, 0, 4);
                $result[] = array_slice($categories, 4, 4);
                $result[] = array_slice($categories, 8, $count);
                break;
            case ($modx->resource->context_key == 'ugol'):
                $amount = ceil($count / 3);
                $twiceAmount = $amount + $amount;
                $result[] = array_slice($categories, 0, $amount);
                $result[] = array_slice($categories, $amount, $amount);
                $result[] = array_slice($categories, $twiceAmount, $count - 1);
                break;
            case ($modx->resource->context_key == 'armatura-178'):
                $amount = ceil($count / 3);
                $twiceAmount = $amount + $amount;
                $result[] = array_slice($categories, 0, $amount);
                $result[] = array_slice($categories, $amount, $amount);
                $result[] = array_slice($categories, $twiceAmount, $count - 1);
                break;
            case ($modx->resource->context_key == 'kirpich-m'):
                $result[] = array_slice($categories, 0, 3);
                $result[] = array_slice($categories, 3, 2);
                $result[] = array_slice($categories, 5, $count - 1);
                break;
            case ($modx->resource->context_key == 'pilomat'):
                $result[] = array_slice($categories, 0, 1);
                $result[] = array_slice($categories, 1, 1);
                $result[] = array_slice($categories, 2, 1);
                $result[] = array_slice($categories, 3, $count);
        }
    }
}

return $result;
