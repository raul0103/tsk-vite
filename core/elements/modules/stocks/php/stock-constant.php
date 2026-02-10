<?php

const MIN_STOCKS = 50; // минимальное количество товаров в наличии на складе
const MAX_STOCKS = 100; // максимальное количество товаров в наличии на складе
const MIN_LIMIT_STOCKS = 1; // минимальное количество товаров в наличии на складе с лимитом
const MAX_LIMIT_STOCKS = 5; // максимальное количество товаров в наличии на складе с лимитом
const MIN_NOT_STOCKS = 0; // минимальное количество товаров в наличии на складе без остатков
const MAX_NOT_STOCKS = 0; // максимальное количество товаров в наличии на складе без остатков

const CACHE_TIME = 86400; // время кэширования
const CACHE_KEY = "/stockTemplate/"; // ключ кэширования

const STOCKS = [ // массив складов
    [
        "title" => "Склад Колпино",
        "url" => "sklad-kolpino/"
    ],
    [
        "title" => "Склад Шушары",
        "url" => "sklad-shushary/"
    ],
    [
        "title" => "Склад Пулково",
        "url" => "sklad-pulkovo/"
    ],
    [
        "title" => "Склад Парнас",
        "url" => "sklad-parnas/"
    ],
    [
        "title" => "Склад Янино",
        "url" => "sklad-yanino/"
    ],
];

const STOCKS_FASAD = [
    [
        "title" => "Склад Шушары",
        "url" => "sklad-shusharyi/"
    ],
    [
        "title" => "Склад Мурино",
        "url" => "sklad-murino/"
    ],
    [
        "title" => "Склад Ржевка",
        "url" => "sklad-rzhevka/"
    ],
];

const STOCKS_PLITAOSB = [
    [
        "title" => "Склад Парнас",
        "url" => "sklad-parnas/"
    ],
    [
        "title" => "Склад Красносельский район",
        "url" => "sklad-krasnoselskij-rajon/"
    ],
    [
        "title" => "Склад Шушары",
        "url" => "sklad-shusharyi/"
    ],
    [
        "title" => "Склад Мурино",
        "url" => "sklad-murino/"
    ],
    [
        "title" => "Склад Гатчина",
        "url" => "sklad-gatchina/"
    ],
];

if (!function_exists('getStocksNamesByContext')) {
    function getStocksNamesByContext($context)
    {
        $context = (string)$context;

        if ($context === 'fasad') {
            return STOCKS_FASAD;
        }

        if ($context === 'plitaosb') {
            return STOCKS_PLITAOSB;
        }

        return STOCKS;
    }
}

const TEMPLATE_1_COUNT_LIMIT_STOCKS = 2; // количество складов с лимитом для шаблона 1
const TEMPLATE_1_COUNT_NOT_STOCKS = 0; // количество складов без остатков для шаблона 1

const TEMPLATE_2_COUNT_LIMIT_STOCKS = 2; // количество складов с лимитом для шаблона 2
const TEMPLATE_2_COUNT_NOT_STOCKS = 3; // количество складов без остатков для шаблона 2

const TEMPLATE_3_COUNT_LIMIT_STOCKS = 0; // количество складов с лимитом для шаблона 3
const TEMPLATE_3_COUNT_NOT_STOCKS = 5; // количество складов без остатков для шаблона 3

const TEMPLATE_4_COUNT_LIMIT_STOCKS = 0; // количество складов с лимитом для шаблона 3
const TEMPLATE_4_COUNT_NOT_STOCKS = 0; // количество складов без остатков для шаблона 3
