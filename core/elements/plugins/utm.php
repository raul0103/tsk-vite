<?php
$eventName = $modx->event->name;

if (!function_exists('utmLog')) {
    function utmLog($source, $old, $new, $host)
    {
        global $modx;
        $modx->log(MODX_LOG_LEVEL_ERROR, print_r([
            'source' => $source,
            'old' => $old,
            'new' => $new,
            'host' => $host
        ], 1));
    }
}

switch ($eventName) {
    case 'OnMODXInit':
    case 'OnHandleRequest':
    case 'pdoToolsOnFenomInit':
        // Массив всех плейсхолдеров, участвующих в замене, нужен для корректной работы сохранения в сессии
        $REPLACEMENTS = ['+phone', '+email', '+bx24source', '+city_icase', '+city_pcase', '+city_dcase', '+city_rcase', '+city_address', '+source'];

        // Массив ключей и заменённых значений
        $UTM = [
            'mltyandex' => [
                '+phone' => '+7 (812) 200-48-39',
                '+email' => 'zakaz@[[++http_host]]',
                '+bx24source' => '9052038859'
            ],
            'mltgoogle' => [
                '+phone' => '+7 (812) 209-13-38',
                '+email' => 'sale@[[++http_host]]',
                '+bx24source' => '9052038860'
            ],
            'mltrsya' => [
                '+phone' => '+7 (812) 209-52-89',
                '+email' => 'zakazy@[[++http_host]]',
                '+bx24source' => '9052038865'
            ],
            'yandexRT' => [
                '+phone' => '+7 (812) 209-52-92',
                '+email' => 'sales@[[++http_host]]',
                '+bx24source' => '9052038866'
            ],
            'mltvk' => [
                '+phone' => '+7 (812) 336-43-64',
                '+email' => 'inform@[[++http_host]]',
                '+bx24source' => '9052038869'
            ],
            'yandex-dinamicheskie' => [
                '+phone' => '+7 (812) 309-18-34',
                '+email' => 'inform@[[++http_host]]',
                '+bx24source' => '9052038889'
            ],
            'stroyportal' => [
                '+phone' => '+7 (812) 309-17-52',
                '+email' => 'manager@[[++http_host]]',
                '+bx24source' => '9052038891'
            ],
            'googlepokupki' => [
                '+phone' => '+7 (812) 309-25-31',
                '+email' => 'sale@[[++http_host]]',
                '+bx24source' => '9052038894'
            ],
            'regmarkets.ru' => [
                '+phone' => '+7 (812) 309 25-38',
                '+email' => 'postavki@[[++http_host]]',
                '+bx24source' => '9052038940'
            ],
            'yandex-sm-banner' => [
                '+phone' => '+7 (812) 309 18-26',
                '+email' => 'zayavka@[[++http_host]]',
                '+bx24source' => '9052038901'
            ],
            'yandex-master' => [
                '+phone' => '+7 (812) 309 41-76',
                '+email' => 'zakupki@[[++http_host]]',
                '+bx24source' => '9052038943'
            ],

            // ---------------------------------
            // Города для пиломата
            // ---------------------------------
            'mltvolhov' => [
                '+city_address' => 'Волхов, Мурманское шоссе 8 стр. 12',
                '+city_icase' => 'Волхов',
                '+city_pcase' => 'Волхове',
                '+city_dcase' => 'Волхову',
                '+city_rcase' => 'Волхова',
            ],
            'mltvsevolozhsk' => [
                '+city_address' => 'Всеволожск, Южное шоссе 134с7',
                '+city_icase' => 'Всеволожск',
                '+city_pcase' => 'Всеволожске',
                '+city_dcase' => 'Всеволожску',
                '+city_rcase' => 'Всеволожска',
            ],
            'mltvyborg' => [
                '+city_address' => 'Выборг, Приморское шоссе 2 стр 24',
                '+city_icase' => 'Выборг',
                '+city_pcase' => 'Выборге',
                '+city_dcase' => 'Выборгу',
                '+city_rcase' => 'Выборга',
            ],
            'mltgatchina' => [
                '+city_address' => 'Гатчина, Промзона-1, корп. 2',
                '+city_icase' => 'Гатчина',
                '+city_pcase' => 'Гатчине',
                '+city_dcase' => 'Гатчине',
                '+city_rcase' => 'Гатчины',
            ],
            'mltkingisepp' => [
                '+city_address' => 'Кингисепп, промплощадка "Фосфорит", стр 19',
                '+city_icase' => 'Кингисепп',
                '+city_pcase' => 'Кингисеппе',
                '+city_dcase' => 'Кингисеппу',
                '+city_rcase' => 'Кингисеппа',
            ],
            'mlttosno' => [
                '+city_address' => 'Тосно, Промышленная д3 стр 5',
                '+city_icase' => 'Тосно',
                '+city_pcase' => 'Тосно',
                '+city_dcase' => 'Тосно',
                '+city_rcase' => 'Тосно',
            ],
            'priozersk' => [
                '+city_address' => 'Приозерск, промзона',
                '+city_icase' => 'Приозерск',
                '+city_pcase' => 'Приозерске',
                '+city_dcase' => 'Приозерску',
                '+city_rcase' => 'Приозерска',
            ],
        ];

        // Добавляем ключ UTM в ее значения, чтобы в каком-либо другом коде проще было понять, какая UTM сейчас действует
        foreach ($UTM as $source => $nevermind) {
            $UTM[$source]['+source'] = $source;
        }

        // Поле, в котором указывается источник
        $source = $_GET['utm_source'];
        $host = $modx->config['http_host'];

        if ($source) {
            $_SESSION["utm_source"] = $source;
        } else {
            $source = $_SESSION["utm_source"];
        }

        // Проверка на контекст значений для пиломата. Установка телефона и Email'а для регионов пиломата
        if (in_array($source, ['mltvolhov', 'mltvsevolozhsk', 'mltvyborg', 'mltgatchina', 'mltkingisepp', 'mlttosno', 'priozersk'])) {
            if ($modx->context->key !== 'pilomat') {
                unset($source);
            } else {
                $UTM[$source]['+phone'] = '+7 (812) 200-48-39';
                $UTM[$source]['+email'] = 'zakaz@[[++http_host]]';
            }
        }

        // Если есть источник - пишем в сессию, если нет - читаем
        if (!empty($source) && isset($UTM[$source])) {
            $log_old = [];
            $log_new = [];

            // Устанавливаем недостающие ключи в пустую строку, чтобы сбросить значения от предыдущего utm_source
            foreach ($REPLACEMENTS as $placeholder) {
                if (empty($UTM[$source][$placeholder])) {
                    $UTM[$source][$placeholder] = '';
                }
            }

            // Проставляем плейсхолдеры + пишем их в сессию
            foreach ($UTM[$source] as $placeholder => $value) {
                $log_old[$placeholder] = $modx->getPlaceholder($placeholder);
                $_SESSION[$placeholder . "_utm"] = $value;
                $modx->setPlaceholder($placeholder, $value);
                $log_new[$placeholder] = $modx->getPlaceholder($placeholder);
            }
            // utmLog($source, $log_old, $log_new, $host);
        } else {
            // Достаём плейсходеры из сессии
            foreach ($REPLACEMENTS as $placeholder) {
                if (isset($_SESSION[$placeholder . "_utm"])) {
                    $modx->setPlaceholder($placeholder, $_SESSION[$placeholder . "_utm"]);
                }
            }
        }

        // Хак для очистки сессии
        if ($_GET['utm_clear'] == 1) {
            foreach ($REPLACEMENTS as $placeholder) {
                unset($_SESSION[$placeholder . "_utm"]);
            }
        }

        break;
}
return;
