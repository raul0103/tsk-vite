<?php

function getMenuData() {
    $lsr = 133205;
    $sk = 133206;
    $aeroc = 133207;
    $eab = 133208;
    $ytong = 133209;
    $zabudova = 133210;
    $hh = 133211;
    $bonolit = 133212;
    $mogilksi = 133213;
    $sls = 133214;
    $bck = 133215;
    $mogilgaz = 133216;
    $ublocks = 133223;
    $paz = 133224;
    $negazobeton = 133670;
    $klej = 133676;
    $utils = 133677;

    $data = [
        $lsr => [
            'column1' => [
                'uri' => '/gazobeton-lsr/',
                'name' => 'Газобетон ЛСР',
                'img' => '/_import/files/import_images/mainimage-gazobeton-lsr.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-lsr/?plotnost-ob=D200",
                    "name" => "D200",
                ],
                [
                    "uri" => "/gazobeton-lsr/?plotnost-ob=D300",
                    "name" => "D300",
                ],
                [
                    "uri" => "/gazobeton-lsr/?plotnost-ob=D400",
                    "name" => "D400",
                ],
                [
                    "uri" => "/gazobeton-lsr/?plotnost-ob=D500",
                    "name" => "D500",
                ],
                [
                    "uri" => "/gazobeton-lsr/?plotnost-ob=D600",
                    "name" => "D600",
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=100х250х625",
                    "name" => "100х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=150х250х625",
                    "name" => "150х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=200х250х625",
                    "name" => "200х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=250х250х625",
                    "name" => "250х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=300х250х625",
                    "name" => "300х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=375х250х625",
                    "name" => "375х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=400х250х625",
                    "name" => "400х250х625",
                ],
                [
                    "uri" => "/gazobeton-lsr/?razmer-mm=85х250х625",
                    "name" => "85х250х625",
                ],
            ]
        ],
        $sk => [
            'column1' => [
                'uri' => '/gazobeton-sk/',
                'name' => 'Газобетон СК',
                'img' => '/_import/files/import_images/mainimage-gazobeton-sk.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-sk/?plotnost-ob=D400",
                    "name" => "D400",
                ],
                [
                    "uri" => "/gazobeton-sk/?plotnost-ob=D500",
                    "name" => "D500",
                ],
                [
                    "uri" => "/gazobeton-sk/?plotnost-ob=D600",
                    "name" => "D600",
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=100х250х625",
                    "name" => "100х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=150х250х625",
                    "name" => "150х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=200х250х600",
                    "name" => "200х250х600",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=200х250х625",
                    "name" => "200х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=250х250х600",
                    "name" => "250х250х600",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=250х250х625",
                    "name" => "250х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=300х250х600",
                    "name" => "300х250х600",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=300х250х625",
                    "name" => "300х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=375х250х600",
                    "name" => "375х250х600",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=375х250х625",
                    "name" => "375х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=400х250х600",
                    "name" => "400х250х600",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=400х250х625",
                    "name" => "400х250х625",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=100х250х600",
                    "name" => "100х250х600",
                ],
                [
                    "uri" => "/gazobeton-sk/?razmer-mm=150х250х600",
                    "name" => "150х250х600",
                ],
            ]
        ],
        $aeroc => [
            'column1' => [
                'uri' => '/gazobeton-aerok/',
                'name' => 'Газобетон Аэрок',
                'img' => '/_import/files/import_images/mainimage-gazobeton-aerok.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-aerok/?plotnost-ob=D300",
                    "name" => "D300"
                ],
                [
                    "uri" => "/gazobeton-aerok/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/gazobeton-aerok/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/gazobeton-aerok/?plotnost-ob=D600",
                    "name" => "D600"
                ]
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/gazobeton-aerok/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
            ]
        ],
        $eab => [
            'column1' => [
                'uri' => '/gazobeton-eab/',
                'name' => 'Газобетон ЕвроАэроБетон (ЕАБ)',
                'img' => '/_import/files/import_images/mainimage-gazobeton-eab.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-eab/?plotnost-ob=D400",
                    "name" => "D400"
                ],

                [
                    "uri" => "/gazobeton-eab/?plotnost-ob=D500",
                    "name" => "D500"
                ],

                [
                    "uri" => "/gazobeton-eab/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/gazobeton-eab/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
            ]
        ],
        $ytong => [
            'column1' => [
                'uri' => '/gazobeton-ytong/',
                'name' => 'Газобетон Ytong (Ютонг)',
                'img' => '/_import/files/import_images/mainimage-gazobeton-ytong.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-ytong/?plotnost-ob=D300",
                    "name" => "D300"
                ],
                [
                    "uri" => "/gazobeton-ytong/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/gazobeton-ytong/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/gazobeton-ytong/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=500х250х625",
                    "name" => "500х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=50х250х625",
                    "name" => "50х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=75х250х625",
                    "name" => "75х250х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=100х750х625",
                    "name" => "100х750х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=75х750х625",
                    "name" => "75х750х625"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=300х250х500",
                    "name" => "300х250х500"
                ],
                [
                    "uri" => "/gazobeton-ytong/?razmer-mm=375х250х500",
                    "name" => "375х250х500"
                ],
            ]
        ],
        $zabudova => [
            'column1' => [
                'uri' => '/gazobeton-zabudova/',
                'name' => 'Газобетон Забудова',
                'img' => '/_import/files/import_images/mainimage-gazobeton-zabudova.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-zabudova/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/gazobeton-zabudova/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
            ]
        ],
        $hh => [
            'column1' => [
                'uri' => '/gazobeton-hh/',
                'name' => 'Газобетон H+H',
                'img' => '/_import/files/import_images/mainimage-gazobeton-hh.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-hh/?plotnost-ob=D300",
                    "name" => "D300"
                ],
                [
                    "uri" => "/gazobeton-hh/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/gazobeton-hh/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/gazobeton-hh/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/gazobeton-hh/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
            ]
        ],
        $bonolit => [
            'column1' => [
                'uri' => '/gazobeton-bonolit/',
                'name' => 'Газобетон Бонолит',
                'img' => '/_import/files/import_images/mainimage-gazobeton-bonolit.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/gazobeton-bonolit/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=200х250х600",
                    "name" => "200х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=250х250х600",
                    "name" => "250х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=300х200х600",
                    "name" => "300х200х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=300х250х600",
                    "name" => "300х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=350х250х600",
                    "name" => "350х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=375х250х600",
                    "name" => "375х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=400х200х600",
                    "name" => "400х200х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=400х250х600",
                    "name" => "400х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=500х250х600",
                    "name" => "500х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=100х250х600",
                    "name" => "100х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=500х200х600",
                    "name" => "500х200х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=50х250х600",
                    "name" => "50х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=75х250х600",
                    "name" => "75х250х600"
                ],
                [
                    "uri" => "/gazobeton-bonolit/?razmer-mm=200х200х600",
                    "name" => "200х200х600"
                ],
            ]
        ],
        $mogilksi => [
            'column1' => [
                'uri' => '/mogilevskiy-gazobeton-ksi/',
                'name' => 'Газобетон Могилевский КСИ',
                'img' => '/_import/files/import_images/mainimage-gazobeton-ksi.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?plotnost-ob=D300",
                    "name" => "D300"
                ],
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],

                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],

                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],

                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],

                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/mogilevskiy-gazobeton-ksi/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
            ],
        ],
        $sls => [
            'column1' => [
                'uri' => '/gazobeton-belorusskij-sls/',
                'name' => 'Газобетон Белорусский SLS',
                'img' => '/_import/files/import_images/mainimage-gazobeton-sls.jpg'
            ],
            'column2' => [
                [
                    'uri' => '/gazobeton-belorusskij-sls/?plotnost-ob=D400',
                    'name' => 'D400'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?plotnost-ob=D500',
                    'name' => 'D500'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?plotnost-ob=D600',
                    'name' => 'D600'
                ],
            ],
            'column3' => [
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=100х250х625',
                    'name' => '100х250х625'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=150х250х625',
                    'name' => '150х250х625'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=200х250х625',
                    'name' => '200х250х625'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=250х250х625',
                    'name' => '250х250х625'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=300х250х625',
                    'name' => '300х250х625'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=375х250х625',
                    'name' => '375х250х625'
                ],
                [
                    'uri' => '/gazobeton-belorusskij-sls/?razmer-mm=400х250х625',
                    'name' => '400х250х625'
                ],
            ],
        ],
        $bck => [
            'column1' => [
                'uri' => '/bck-belorusskiy/',
                'name' => 'Газобетон Белорусский (БЦК)',
                'img' => '/_import/files/import_images/mainimage-gazobeton-bck.jpg'
            ],
            'column2' => [
                [
                    "uri" => "/bck-belorusskiy/?plotnost-ob=D300",
                    "name" => "D300"
                ],
                [
                    "uri" => "/bck-belorusskiy/?plotnost-ob=D400",
                    "name" => "D400"
                ],
                [
                    "uri" => "/bck-belorusskiy/?plotnost-ob=D500",
                    "name" => "D500"
                ],
                [
                    "uri" => "/bck-belorusskiy/?plotnost-ob=D600",
                    "name" => "D600"
                ],
            ],
            'column3' => [
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=300х250х625",
                    "name" => "300х250х625"
                ],
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=100х250х625",
                    "name" => "100х250х625"
                ],
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=150х250х625",
                    "name" => "150х250х625"
                ],
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=200х250х625",
                    "name" => "200х250х625"
                ],
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=250х250х625",
                    "name" => "250х250х625"
                ],
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=375х250х625",
                    "name" => "375х250х625"
                ],
                [
                    "uri" => "/bck-belorusskiy/?razmer-mm=400х250х625",
                    "name" => "400х250х625"
                ],
            ]
        ],
        $mogilgaz => [
            'column1' => [
                'uri' => '/gazobeton-mogilevskij-gazosilikat/',
                'name' => 'Газобетон Могилевский Газосиликат',
                'img' => '/_import/files/import_images/mainimage-gazobeton-mogilev.jpg'
            ],
            'column2' => [
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?plotnost-ob=D400',
                    'name' => 'D400'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?plotnost-ob=D500',
                    'name' => 'D500'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?plotnost-ob=D600',
                    'name' => 'D600'
                ],
            ],
            'column3' => [
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=100х250х600',
                    'name' => '100х250х600'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=150х250х600',
                    'name' => '150х250х600'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=200х250х600',
                    'name' => '200х250х600'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=250х250х600',
                    'name' => '250х250х600'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=300х250х600',
                    'name' => '300х250х600'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=375х250х600',
                    'name' => '375х250х600'
                ],
                [
                    'uri' => '/gazobeton-mogilevskij-gazosilikat/?razmer-mm=400х250х600',
                    'name' => '400х250х600'
                ],
            ],
        ],
        $ublocks => [
            'column1' => [
                'uri' => '/u-bloki/',
                'name' => 'Газобетонные U-блоки',
                'img' => '/_import/files/import_images/mainimage-gazobeton-u-blok.jpg'
            ],
            'proizvoditeli' => [
                [
                    'uri' => '/u-bloki/?proizvoditel=AEROC',
                    'name' => 'AEROC'
                ],
                [
                    'uri' => '/u-bloki/?proizvoditel=ЕАБ%20(ЕвроАэроБетон)',
                    'name' => 'ЕАБ (ЕвроАэроБетон)'
                ],
                [
                    'uri' => '/u-bloki/?proizvoditel=ЛСР',
                    'name' => 'ЛСР'
                ],
                [
                    'uri' => '/u-bloki/?proizvoditel=Н%2BН',
                    'name' => 'Н+Н'
                ],
                [
                    'uri' => '/u-bloki/?proizvoditel=СК%20(СтройКомплект)',
                    'name' => 'СК (СтройКомплект)'
                ]
            ],
            'column3' => [
                [
                    'uri' => '/u-bloki/?razmer-mm=200х250х500',
                    'name' => '200х250х500'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=200х250х625',
                    'name' => '200х250х625'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=250х250х500',
                    'name' => '250х250х500'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=250х250х625',
                    'name' => '250х250х625'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=300х250х500',
                    'name' => '300х250х500'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=300х250х625',
                    'name' => '300х250х625'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=375х250х500',
                    'name' => '375х250х500'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=375х250х625',
                    'name' => '375х250х625'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=400х250х500',
                    'name' => '400х250х500'
                ],
                [
                    'uri' => '/u-bloki/?razmer-mm=400х250х625',
                    'name' => '400х250х625'
                ]
            ]
        ],
        $paz => [
            'column1' => [
                'uri' => '/paz-greben/',
                'name' => 'Газоблоки паз-гребень',
                'img' => '/_import/files/import_images/mainimage-gazobeton-paz-greben.jpg'
            ],
            'proizvoditeli' => [
                [
                    'uri' => '/paz-greben/?proizvoditel=AEROC',
                    'name' => 'AEROC'
                ],
                [
                    'uri' => '/paz-greben/?proizvoditel=СК%20(СтройКомплект)',
                    'name' => 'СК (СтройКомплект)'
                ]
            ],
            'column3' => [
                [
                    'uri' => '/paz-greben/?razmer-mm=200х250х625',
                    'name' => '200х250х625'
                ],
                [
                    'uri' => '/paz-greben/?razmer-mm=250х250х625',
                    'name' => '250х250х625'
                ],
                [
                    'uri' => '/paz-greben/?razmer-mm=300х250х625',
                    'name' => '300х250х625'
                ],
                [
                    'uri' => '/paz-greben/?razmer-mm=375х250х625',
                    'name' => '375х250х625'
                ],
                [
                    'uri' => '/paz-greben/?razmer-mm=400х250х625',
                    'name' => '400х250х625'
                ]
            ]
        ],
        $negazobeton => [
            'column1' => [
                'uri' => '/ne-gazobeton/',
                'name' => 'Аналоги газобетона',
                'img' => '/_import/files/import_images/mainimage-ne-gazobeton.jpg'
            ],
            'vidyblokov' => [
                [
                    'uri' => '/stenovye-bloki/penobetonnye-bloki/',
                    'name' => 'Пенобетонные блоки'
                ],
                [
                    'uri' => '/stenovye-bloki/keramzitobetonnye-bloki/',
                    'name' => 'Керамзитобетонные блоки'
                ],
                [
                    'uri' => '/stenovye-bloki/polistirolbetonnye-bloki/',
                    'name' => 'Полистиролбетонные блоки'
                ],
                [
                    'uri' => '/stenovye-bloki/arbolitovye-bloki/',
                    'name' => 'Арболитовые блоки'
                ]
            ]
        ],
        $klej => [
            'column1' => [
                'uri' => '/klej-i-instrumenty/klej-dlya-gazobetona',
                'name' => 'Клей для газобетона ',
                'img' => '/_import/files/import_images/mainimage-gazobeton-klej.jpg'
            ],
            'massa' => [
                [
                    'uri' => '/klej-i-instrumenty/klej-dlya-gazobetona/?massa=25',
                    'name' => '25 кг'
                ],
                [
                    'uri' => '/klej-i-instrumenty/klej-dlya-gazobetona/?massa=40',
                    'name' => '40 кг'
                ]
            ],
            'sezon' => [
                [
                    'uri' => '/klej-i-instrumenty/klej-dlya-gazobetona/?msoption|sezon-primeneniya=лето',
                    'name' => 'Лето'
                ],
                [
                    'uri' => '/klej-i-instrumenty/klej-dlya-gazobetona/?msoption|sezon-primeneniya=зима',
                    'name' => 'Зима'
                ]
            ]
        ],
        $utils => [
            'column1' => [
                'uri' => '/klej-i-instrumenty/instrumenty-dlya-gazobetona',
                'name' => 'Инструменты для газобетона ',
                'img' => '/_import/files/import_images/mainimage-gazobeton-utils.jpg'
            ],
            'column2' => [],
            'column3' => []
        ],
    ];

    foreach ($data as $key => $values) {
        $data[$key]['column3'] = array_chunk($values['column3'], 7);
    }

    return $data;
}
