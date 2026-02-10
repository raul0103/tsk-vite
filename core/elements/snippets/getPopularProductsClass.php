<?php

// TODO: Возможно, в алгоритме надо учитывать доп. категории ("Показывать в категориях"). Но пока никто не просил меня это реализовывать.

class getPopularProductsClass {

    protected static $debug = []; // Массив, в котором хранятся сообщения о поиске популярных (рекомендуемых) товаров

    // Текстовые переменные для заполнения $debug
    protected static $textStd = 'значение для стандартных случаев';
    protected static $textSpecial = 'значение для особых случаев';

    protected static $prod; // Товар, к которому подбираются популярные (рекомендуемые) товары

    protected static $resultStd = []; // Возвращаемое значение в стандартных случаях или в случае ошибки
    protected static $resultSpecial = []; // Возвращаемое значение в особых случаях (которые описаны в этом классе)

    protected static $specificCtxs = ['kirpich-m', 'krovlya'];

    protected static $tpl;

    public function __construct($tpl = null){
        self::$tpl = $tpl ?: '@FILE sections/popular/pop-slide.tpl';
    }

    /**
     * Установка основных полей класса.
     */
    protected static function init() {
        global $modx;
        global $scriptProperties;

        $prodId = null;
        $prodIdText = 'id товара, для которого будут выводиться популярные товары';

        if (empty($scriptProperties['prodId'])) {
            self::$debug[] = 'В $scriptProperties отсутствует параметр prodId (' . $prodIdText . '). Поэтому взят id текущего товара (' . $modx->resource->id . ').';
            $prodId = $modx->resource->id;
        } else {
            self::$debug[] = 'Получен параметр prodId (' . $prodIdText . ') из $scriptProperties (' . $scriptProperties['prodId'] . ').';
            $prodId = $scriptProperties['prodId'];
        }

        // TODO: здесь нужен exception - вдруг не получилось найти товар с таким id
        self::$prod = $modx->getObject('modResource', $prodId);

        $defaultParams = [
            'resources' => '-' . $prodId,
            'parents' => 0,
            'depth' => 50,
            'limit' => 42,
            'tpl' => self::$tpl,
            'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
            'context' => self::$prod->context_key,
            'tplWrapper' => '@FILE sections/popular/sect-pop-wrapper.tpl',
            'wrapIfEmpty' => 0
        ];
        self::$resultStd = self::$resultSpecial = $defaultParams;
    }


    /**
     * Попытка получить строку с id ресурсов извне (из $scriptProperties или из настроек контекста).
     */
    protected static function tryGetResourcesFromOutside() {
        global $scriptProperties;
        global $modx;

        if (in_array(self::$prod->context_key, self::$specificCtxs)) {
            self::$resultStd = [];
        }

        // Попробуем получить значение из $scriptProperties
        if (!empty($scriptProperties['resources'])) {
            self::$resultStd = self::addResourcesAndSort(self::$resultStd, $scriptProperties['resources']);
            self::$debug[] = 'Получен параметр resources из $scriptProperties: ' . $scriptProperties['resources'] . '.';
        } else {
            self::$debug[] = 'В $scriptProperties отсутствует параметр resources.';

            // Попробуем получить значение из настроек контекста
            $resources = $modx->context->getOption('popular_ids_2');
            if (empty($resources)) {
                self::$debug[] = 'Не удалось получить значение popular_ids_2 из настроек контекста (или оно пустое).';
            } else {
                self::$resultStd = self::addResourcesAndSort(self::$resultStd, $resources);
                self::$debug[] = "Получено значение popular_ids_2 из настроек контекста: $resources.";
            }
        }
    }


    /**
     * Удобная обертка для return.
     */
    protected static function rtn($params) {
        return [
            'params' => $params,
            'params_default' => self::$resultStd,
            'debug' => self::$debug
        ];
    }


    /**
     * Добавляет в массив $params ключи "resources" и "sortby" со значениями на основе параметра $resources.
     */
    protected static function addResourcesAndSort($params, $resources) {
        return array_merge($params, [
            'resources' => $resources,
            'sortby' => "FIELD(msProduct.id, $resources)"
        ]);
    }


    /**
     * Главная открытая функция класса.
     * @return array
     */
    public static function getPopularProductsParams() {
        // Устанавливаем основные поля класса
        self::init();

        // Возможно, популярные (рекомендуемые) товары есть у ресурса в tv и ничего вычислять не надо
        $recommendIds = self::$prod->getTVValue('recommendIds');
        if ($recommendIds) {
            self::$debug[] = 'Популярные (рекомендуемые) товары получены из tv recommendIds: ' . $recommendIds;
            self::$resultStd = self::addResourcesAndSort(self::$resultStd, $recommendIds);
            return self::rtn(self::$resultStd);
        }

        // Попробуем получить строку с id ресурсов извне и записать в $resultStd
        self::tryGetResourcesFromOutside();

        // Вывод для неспецифичных контекстов
        // Если для текущего контекста нет логики в этом скрипте, то возвращаем значение для стандартных случаев
        if (!in_array(self::$prod->context_key, self::$specificCtxs)) {
            self::$debug[] = "Контекст не является специфичным (специфичные: " . implode(', ', self::$specificCtxs) . "). Возвращено".self::$textStd;
            return self::rtn(self::$resultStd);
        }

        // Получение ресурсов для специфичных контекстов
        switch (self::$prod->context_key) {
            case 'kirpich-m':
                $resources = self::kirpich();
                break;

            case 'krovlya':
                $resources = self::krovlya();
                break;
        }

        if ($resources === false) {
            return self::rtn(self::$resultStd);
        }

        self::$resultSpecial = self::addResourcesAndSort(self::$resultSpecial, $resources);
        self::$resultSpecial['limit'] = 300;
        self::$debug[] = "Возвращено " . self::$textSpecial . ".";
        return self::rtn(self::$resultSpecial);
    }


    protected static function buildAndRunQuery($relatedOpts, $optValsToFind, $parents) {
        global $modx;

        $options = [];
        $selects = ['main.`product_id`'];
        $joins = [];

        // Заполняем selects и $joins
        foreach ($relatedOpts as $key) {
            $val = empty($optValsToFind[$key]) ? self::$prod->get($key) : $optValsToFind[$key];
            if (empty($val)) {
                continue;
            }

            $selects[] = "$key.`value` AS $key";
            $joins[] = "LEFT JOIN modx_ms2_product_options $key ON $key.`key` = '$key' AND $key.`product_id` = main.`product_id`";

            asort($val);
            foreach ($val as $k => $v) {
                $val[$k] = "$key=$v";
            }
            $val = implode('|', $val);
            $options[$key] = $val;
        }

        // Обрабатываем $selects и $joins
        $selects = implode(', ', $selects);
        $joins = implode("\n", $joins);

        // Составляем хеш для опций
        ksort($options);
        $options = implode('|', $options);
        $md5 = md5($options);

        // Получаем order и parents
        $order = implode(',', array_reverse($parents));
        $parents = implode(',', $parents);

        // Получаем опции для SQL-запроса
        $options = [];
        foreach ($relatedOpts as $key) {
            $options[] = "'$key'";
        }
        $options = implode(', ', $options);

        // Составляем SQL-запрос
        $query = "
                SELECT $selects
                FROM modx_ms2_product_options main
                $joins
                LEFT JOIN modx_site_content resources ON resources.`id` = main.`product_id`
                WHERE main.`product_id` IN (
                    -- Получаем все товары с таким же хешем
                    SELECT `product_id`
                    FROM modx_ms2_product_options
                    WHERE `key` IN ($options) AND `value` != ''
                    GROUP BY `product_id`
                    HAVING MD5(GROUP_CONCAT(CONCAT(`key`, '=', `value`) ORDER BY `key` ASC, `value` ASC SEPARATOR '|')) = '$md5'
                )
                AND resources.`parent` IN ($parents)
                AND main.`product_id` != " . self::$prod->id . "
                GROUP BY resources.`parent`
                ORDER BY FIELD(resources.`parent`, $order) DESC
            ";

        // Выполняем SQL-запрос
        $result = $modx->query($query);

        // Обрабатываем результат SQL-запроса
        if ($result === false) {
            self::$debug[] = "Во время SQL запроса произошла ошибка, возвращено " . self::$textStd . ".";
            return false;
        }

        // Получаем данные из результата SQL-запроса и выходим из функции
        $result = $result->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }


    /**
     * Получение популярных товаров для кровли.
     */
    static protected function krovlya() {
        global $modx;

        $group = null;
        $optValsToFind = []; // Если передать в этот массив значение для какой-либо опции из $relatedOpts, то сопутствующие товары будут искаться не по значению текущего ресурса, а по переданному значению
        $relatedOpts = []; // Сопутствующие товары ищутся по опциям из этого массива


        // -------------------------------------------------
        // Определяем группу, от нее зависит алгоритм выбора соответствующих товаров
        // -------------------------------------------------
        switch (true) {
            // Группа 1 - Металлочерепица и потомки
            case (in_array(self::$prod->parent, [11760, 12069, 12070, 12071, 12073, 12074, 16789, 37621, 44676, 44677, 44678, 44679, 44680, 44681, 76923, 16788, 11760, 12069, 12070, 12071, 12073, 12074, 16789, 37621, 44676, 44677, 44678, 44679, 44680, 44681, 76923])):
                $group = 1;
                $parents = [49254,49258,64163,64166,49281,49282,18447,18448,49283,49284,49285,49286,49287,64209,64211,64221,49268,49269,49270,49271,49274,49275,49276,49277,49278,49279,49280,64182,64185,64188,15439,15498,15499,15500,18441,26250,49227,49228,49229,49230,49231,49232,64101,64114,64125,64128,49233,49234,49235,49236,49237,49238,60143,60146,60149,60152,18442,18443,49195,49239,64133,64142,64146,49288,49289,49290,49291,49292,49293,49294,49295];
                break;

            // Группа 2 - Фальцевая кровля и потомки
            case in_array(self::$prod->parent, [22595, 26835, 26846, 26856, 26868, 26875, 26922, 26948, 26957, 22594, 22595, 26835, 26846, 26856, 26868, 26875, 26922, 26948, 26957]):
                $group = 2;
                $parents = [49196,49197,49198,49199,49200,49201,49202,49203,49204,49205,49206,49207,49208,49209];
                break;

            // Группа 3 - Профлист
            case in_array(self::$prod->parent, [86214,
                43711, 81055, 81054, 81053, 81056, 81057, 81047, 43790, 43775, 43760, 43748, 43730, 43720, 43536, 81058, 86224, 86215, 86225, 86217, 86218, 86219, 86220, 86221, 86222, 86223, 86226, 86227, 41715, 41709, 41706, 41701, 41699, 41690, 41684, 41628, 86229, 37728, 81052, 86216, 26581, 81051, 26582]):
                $group = 3;
                $parents = [49254,64166,49281,49282,18447,18448,49283,49284,49285,49286,49287,64209,64211,64221,49268,49269,49270,49271,49274,49275,49276,49277,49278,49279,49280,64182,64185,64188,15439,15498,15499,15500,18441,26250,49227,49228,49229,49230,49231,49232,64101,64114,64125,64128,18442,18443,49195,49239,64133,64142,64146];
                break;
        }

        if (empty($group)) {
            self::$debug[] = "Не получилось определить группу. Возвращено " . self::$textStd . ".";
            return false;
        }

        // -------------------------------------------------
        // Составляем SQL запрос
        // -------------------------------------------------
        $resources = self::buildAndRunQuery(['proizvoditel', 'cvet', 'pokrytie', 'item_thickness'], $optValsToFind, $parents);
        if ($resources === false) {
            return false;
        }
        if (empty($resources)) {
            $resources = self::buildAndRunQuery(['proizvoditel', 'cvet', 'pokrytie'], $optValsToFind, $parents);
            if ($resources === false) {
                return false;
            }
        }

        $resources = array_column($resources, 'product_id');
        return implode(',', $resources);
    }


    /**
     * Получение популярных товаров для кирпича.
     */
    static protected function kirpich() {
        global $modx;

        // Определение, в какой группе кирпичей находится товар. От группы зависит алгоритм выборки популярных товаров
        $group = null;

        // Облицовочный кирпич
        $catIdsGroup1 = [37609, 19851, 19852, 37610];
        // Строительный кирпич
        $catIdsGroup2 = [37608];
        // Поризованный кирпич
        $catIdsGroup3 = [19848];

        // Сначала проверим 2 и 3 группы, т.к. это сделать проще (и быстрее с точки зрения производительности), чем 1 группу
        foreach ([2 => $catIdsGroup2, 3 => $catIdsGroup3] as $key => $val) {
            if (in_array(self::$prod->parent, $val)) {
                $group = $key;
                break;
            }
        }

        // Теперь проверим $catIdsGroup1 (если в этом есть необходимость - если $group все еще пустой)
        if (empty($group)) {
            // Возможно, РОДИТЕЛЬ явлется одной из тех категорий, которая нам нужна
            if (in_array(self::$prod->parent, $catIdsGroup1)) {
                $group = 1;
            } else {
                // Нет, РОДИТЕЛЬ не является ни одной из тех категорий, которая нам нужна. Проверяем доп. категории
                $table = $modx->getOption('table_prefix') . 'ms2_product_categories';
                $query = "SELECT *
                  FROM $table
                  WHERE product_id = " . self::$prod->id . " AND category_id IN (" . implode(',', $catIdsGroup1) . ")";

                $items = $modx->query($query);
                $items = $items->fetchAll(PDO::FETCH_ASSOC);

                if (!empty($items)) {
                    $group = 1;
                }
            }
        }

        // Проверка заполненности $group. Переменная должна быть заполнена. Если она не заполнена, то случилась какая-то ошибка - товар не находится ни в одной из 3 групп
        if (empty($group)) {
            self::$debug[] = "Не получилось определить группу кирпичей. Возвращено " . self::$textStd . ".";
            return false;
        }

        self::$debug[] = "Группа кирпичей определена как: $group.";

        // Одинаковые действия для групп 2 и 3
        if (in_array($group, [2, 3])) {
            $format = self::$prod->get('format');

            if (!empty($format)) {
                self::$debug[] = 'Получено значение опции format: ' . implode(', ', $format) . '.';
            } else {
                self::$debug[] = 'Не удалось получить значение опции format (или оно пустое).';
            }
        }

        // Определение параметров в зависимости от группы
        switch ($group) {
            case 1:
                // Группа 1 - товары с таким же цветом, оттенком, поверхностью. Сортировка - чем больше полей заполнено, тем выше приоритет
                $where = [];
                $optionsValues = ['cvet' => self::$prod->get('cvet'), 'ottenok' => self::$prod->get('ottenok'), 'surface' => self::$prod->get('surface')];
                foreach ($optionsValues as $key => $val) {
                    if (!empty($val)) {
                        // Добавляем кавычки в каждый элемент конкретной опции
                        $tmpValue = array_map(function ($v) {
                            return "'$v'";
                        }, $val);

                        // Добавляем элементы в where
                        $where[] = "(`$key`.`value` IN (" . implode(',', $tmpValue) . "))";
                    }
                }

                if (!empty($where)) {
                    $where = implode(' OR ', $where);
                    $where = "AND ($where)";
                    self::$debug[] = "У товара заполнена хотя бы одна из этих опций: цвет, оттенок, поверхность, составлено where: \"$where\".";
                } else {
                    self::$debug[] = "У товара не заполнен ни цвет, ни оттенок, ни поверхность, дополнительное where не составлено.";
                }

                $query = "SELECT `msProduct`.`id`, `cvet`.`value` as cvet, `ottenok`.`value` as ottenok, `surface`.`value` as surface

                                  FROM `modx_site_content` AS `msProduct`
                                      
                                  -- Присоединяем поля товара
                                  LEFT JOIN `modx_ms2_products` `Data` ON `msProduct`.`id` = `Data`.`id`
                                  -- Присоединяем опции
                                  LEFT JOIN `modx_ms2_product_options` `cvet` ON `cvet`.product_id = Data.id AND `cvet`.key = 'cvet'
                                  LEFT JOIN `modx_ms2_product_options` `ottenok` ON `ottenok`.product_id = Data.id AND `ottenok`.key = 'ottenok'
                                  LEFT JOIN `modx_ms2_product_options` `surface` ON `surface`.product_id = Data.id AND `surface`.key = 'surface'
                                  
                                  -- Выбираем только товары
                                  WHERE `msProduct`.`class_key` = 'msProduct'
                                  -- И не просто товары, а определенные...
                                  $where";

                break;
            case 2:
                // Группа 2 - два товара из кладочных смесей; товары с таким же форматом и товары с форматом "2.1 НФ", но из категорий для группы 3 (т.к. в группе 4 нет товаров с таким форматом)
                if (!empty($format)) {
                    $where = "(
                          (`Options`.`key` = 'format' AND `Options`.`value` = '$format[0]' AND `msProduct`.parent = 37608)
                          OR
                          (`Options`.`key` = 'format' AND `Options`.`value` = '2.1НФ' AND `msProduct`.parent = 19848)
                          )";
                } else {
                    $where = "(`Options`.`key` = 'format' AND `Options`.`value` = '2.1НФ' AND `msProduct`.parent = 19848)";
                }

                break;
            case 3:
                // Группа 3 - два товара из кладочных смесей; товары с таким же форматом, товары с форматом "2.1 НФ" и товары с форматом, который отличается на 1 от формата текущего товара
                if (!empty($format)) {
                    // Вся работа будет с самым первым элементом format
                    $formatString = $format[0];
                    // Заменяем запятые на точки, если запятые есть
                    $formatString = str_replace(',', '.', $formatString);

                    // Получаем число из текстового значения опции format
                    //preg_match('/[0-9]+((\.[0-9])?[0-9]*)?/', $formatString, $formatNum);
                    $formatNum = floatval($formatString);

                    if (empty($formatNum)) {
                        self::$debug[] = "Не удалось получить число из текстового значения опции format ($formatString), чтобы найти товары, которые отличаются на 1 от format текущего товара. Либо это число равно 0.";

                        $where = "(`Options`.`key` = 'format' AND (`Options`.`value` = '$format[0]' OR `Options`.`value` = '2.1НФ') AND `msProduct`.parent = 19848)";
                    } else {
                        //$formatNum = $formatNum[0];
                        self::$debug[] = "Удалось получить число ($formatNum) из текстового значения опции format ($formatString).";

                        $formatNumPlus = str_replace(',', '.', $formatNum + 1);
                        $formatNumMinus = str_replace(',', '.', $formatNum - 1);

                        $where = "(`Options`.`key` = 'format' AND (`Options`.`value` = '2.1НФ' OR `Options`.`value` = '$format[0]' OR ((CAST(`Options`.`value` AS DECIMAL(4,2)) >= $formatNumMinus) AND (CAST(`Options`.`value` AS DECIMAL(4,2)) <= $formatNumPlus)))) AND `msProduct`.parent = 19848";
                    }
                }

                break;
        }

        if (in_array($group, [2, 3])) {
            $query = "SELECT `msProduct`.id, `Options`.`value` as format

                              FROM `modx_site_content` AS `msProduct`
                                
                              -- Присоединяем опции
                              JOIN `modx_ms2_product_options` `Options` ON `msProduct`.`id` =  `Options`.`product_id`
                              -- Присоединяем поля товара
                              LEFT JOIN `modx_ms2_products` `Data` ON `msProduct`.`id` =  `Data`.`id`
                            
                              -- Выбираем только товары
                              WHERE `msProduct`.`class_key` = 'msProduct'
                              -- И не просто товары, а определенные...
                              -- Товары с таким же форматом и родителем 'Строительный кирпич'. Или с форматом 2.1НФ и родителем 'Поризованный кирпич'
                              AND " . $where;
        }

        $query .= "-- Проверяем, чтобы товары были опубликованы, не удалены, чтобы не было выбора текущего товара
                AND `msProduct`.`published` = 1
                AND `msProduct`.`deleted` = 0
                AND `msProduct`.`id` <> " . self::$prod->id . "
                
                GROUP BY msProduct.id
                ORDER BY `msProduct`.menuindex
                
                -- 40, а не 42, потому что потом в самое начало добаляются 2 товара из кладочных смесей
                LIMIT 40";

        // Запуск SQL запроса и обработка результатов
        $resources = $modx->query($query);
        if ($resources === false) {
            self::$debug[] = "Во время SQL запроса произошла ошибка, возвращено " . self::$textStd . ".";
            return false;
        }
        $resources = $resources->fetchAll(PDO::FETCH_ASSOC);

        // Сортировка
        if ($group == 1) {
            // Выше всего идут товары с тремя одинаковыми опциями. Далее идут товары с двумя одинаковыми опциями. В конце идут товары с одной одинаковой опцией. Товаров без одинаковых опций здесь не может быть (они бы не выбрались из БД)

            // Многомерный массив с отсортированными ресурсами
            $resourcesSorted = [1 => [], 2 => [], 3 => []];

            // Цикл для сортировки ресурсов
            // TODO: Опции текущего товара выбираются из БД все. А вот опции популярных товаров - не все. Но пока можно и без всех обойтись
            foreach ($resources as $resValues) {
                // Приоритет. Чем ниже значение, тем ближе к началу будет ресурс
                $priorityCounter = 4;

                // Определяем приоритет по кол-ву соответствий в опциях
                foreach ($optionsValues as $key => $val) {
                    // Конвертируем все в нижний регистр
                    $tmpVal = mb_strtolower($resValues[$key]);
                    $tmpArr = array_map(function ($val) {
                        return mb_strtolower($val);
                    }, $optionsValues[$key]);

                    // Проверяем
                    if (in_array($tmpVal, $tmpArr)) {
                        $priorityCounter--;
                    }
                }

                // Заносим в массив с соответствующим приоритетом
                $resourcesSorted[$priorityCounter][] = $resValues;
            }

            // Объединяем массив с приоритетами в один
            $resources = array_merge($resourcesSorted[1], $resourcesSorted[2], $resourcesSorted[3]);
        } else {
            // Сначала - с таким же форматом
            $resourcesWithSameFormat = [];
            foreach ($resources as $key => $val) {
                if ($val['format'] === $format[0]) {
                    $resourcesWithSameFormat[] = $val;
                    unset($resources[$key]);
                }
            }

            // Потом - с форматом 2.1 НФ
            $resources2_1NF = [];
            foreach ($resources as $key => $val) {
                if ($val['format'] === '2.1НФ') {
                    $resources2_1NF[] = $val;
                    unset($resources[$key]);
                }
            }

            // Далее - зависит от группы
            switch ($group) {
                case 2:
                    // Для группы 2 сортировка больше не нужна. Добавляем $resources2_1NF в конец массива $resourcesWithSameFormat
                    $resources = array_merge($resourcesWithSameFormat, $resources2_1NF);

                    break;
                case 3:
                    // Далее - с наиболее близким форматом
                    // Получаем разницу по модулю
                    $resourcesAbs = [];
                    foreach ($resources as $key => $val) {
                        $resourcesAbs[$key] = $val;
                        $resourcesAbs[$key]['abs'] = abs($formatNum - floatval($val['format']));
                    }
                    // Сортируем по разнице по модулю
                    usort($resourcesAbs, function ($a, $b) {
                        return strcmp($a['abs'], $b['abs']);
                    });

                    // Объединяем массивы
                    $resources = array_merge($resourcesWithSameFormat, $resources2_1NF, $resourcesAbs);

                    break;
            }
        }

        $resources = array_column($resources, 'id');

        if (in_array($group, [2, 3])) {
            // Добавление к отсортированным товарам двух товаров из кладочных смесей
            $resources = array_merge(['68082', '68083'], $resources);
        }

        return implode(',', $resources);
    }

}

$cacheName = $modx->resource->id;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'strong_cache/file_snippets/getPopularProductsClass/' . $modx->context->key
];

if (!$params = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    $getPopularProductsClass = new getPopularProductsClass($tpl);
    $data = $getPopularProductsClass::getPopularProductsParams();
    $params = $data['params'];
    $modx->cacheManager->set($cacheName, $params, 0, $cacheOptions);
}

if (!empty($params['resources'])) {
    $result = $modx->runSnippet('msProductsMy', $params);
} else {
    $result = '';
}

return $result;
