<?php

class getSimilarProducts {

    static protected $prod;
    static protected $limit = 42;

    /**
     * Главная открытая функция класса.
     * @return array
     */
    public static function getSimilarProductsParams() {
        global $modx;

        $prodId = $modx->resource->id;
        self::$prod = $modx->getObject('msProduct', $prodId);

        $params = [
            'resources' => '-' . $prodId,
            'parents' => 0,
            'depth' => 50,
            'limit' => self::$limit,
            'tpl' => '@FILE sections/popular/pop-slide.tpl',
            'includeTVs' => 'isFractional,productNotAvailable,freeShipping',
            'context' => self::$prod->context_key,
            'tplWrapper' => '@FILE sections/popular/sect-similar-wrapper.tpl',
            'wrapIfEmpty' => 0,
        ];

        $resources = self::uteplitel();

        if ($resources === false) {
            return [];
        }

        $params = array_merge($params, [
            'resources' => $resources,
            'sortby' => "FIELD(msProduct.id, $resources)"
        ]);

        return $params;
    }

    protected static function buildAndRunQueryUteplitel($whereExact, $whereIn) {
        global $modx;

        $whereInValues = [];
        $optionsHash = [];
        $selects = ['main.`product_id`'];
        $joins = [];

        // Заполняем $selects и $joins
        foreach (['exact' => $whereExact, 'in' => $whereIn] as $whereType => $whereOptions) {
            foreach ($whereOptions as $optKey) {
                $val = self::$prod->get($optKey);
                if (empty($val)) {
                    continue;
                }

                $selects[] = "$optKey.`value` AS $optKey";
                $joins[] = "LEFT JOIN modx_ms2_product_options $optKey ON $optKey.`key` = '$optKey' AND $optKey.`product_id` = main.`product_id`";

                if ($whereType == 'exact') {
                    asort($val);
                    foreach ($val as $k => $v) {
                        $val[$k] = "$optKey=$v";
                    }
                    $val = implode('|', $val);
                    $optionsHash[$optKey] = $val;
                }

                if ($whereType == 'in') {
                    $val = array_map(function ($v) {
                        return '"' . $v . '"';
                    }, $val);
                    $val = implode(',', $val);
                    $whereInValues[] = "$optKey.`value` IN ($val)";
                }
            }
        }

        // Обрабатываем $selects и $joins
        $selects = implode(', ', $selects);
        $joins = implode("\n", $joins);

        // Обрабатываем $whereInValues
        if (!empty($whereInValues)) {
            $whereIn = implode(' AND ', $whereInValues);
            $whereIn = 'AND ' . $whereIn;
        } else {
            $whereIn = '';
        }

        // Обрабатываем $optionsHash
        $whereHash = '';
        if (!empty($optionsHash)) {
            // Составляем хеш для опций
            ksort($optionsHash);
            $optionsHash = implode('|', $optionsHash);
            $md5 = md5($optionsHash);
            // Получаем опции для SQL-запроса
            $optionsHash = [];
            foreach ($whereExact as $key) {
                $optionsHash[] = "'$key'";
            }
            $optionsHash = implode(', ', $optionsHash);

            $whereHash = "AND main.`product_id` IN (
                    -- Получаем все товары с таким же хешем
                    SELECT `product_id`
                    FROM modx_ms2_product_options
                    WHERE `key` IN ($optionsHash) AND `value` != ''
                    GROUP BY `product_id`
                    HAVING MD5(GROUP_CONCAT(CONCAT(`key`, '=', `value`) ORDER BY `key` ASC, `value` ASC SEPARATOR '|')) = '$md5')";
        }

        // Составляем SQL-запрос
        $contextKey = '"' . self::$prod->get('context_key') . '"';
        $query = "
                SELECT $selects
                FROM modx_ms2_product_options main
                $joins
                LEFT JOIN modx_site_content resources ON resources.`id` = main.`product_id`
                WHERE resources.`context_key` = $contextKey
                $whereHash
                AND main.`product_id` != " . self::$prod->id . "
                $whereIn
                GROUP BY main.`product_id`
                LIMIT " . self::$limit;

        // Выполняем SQL-запрос
        $result = $modx->query($query);

        // Обрабатываем результат SQL-запроса
        if ($result === false) {
            return false;
        }

        // Получаем данные из результата SQL-запроса и выходим из функции
        $result = $result->fetchAll(PDO::FETCH_ASSOC);
        $result = array_column($result, 'product_id');
        return implode(',', $result);
    }


    static protected function uteplitel() {
        $options = self::$prod->loadData()->get('options');

        // Толщина, плотность, применение
        if (!empty($options['item_thickness']) && !empty($options['plotnost']) && !empty($options['primenenie'])) {
            $result = self::buildAndRunQueryUteplitel(['item_thickness', 'plotnost'], ['primenenie']);
            if (!empty($result)) {
                return $result;
            }
        }

        // Толщина, применение
        if (!empty($options['item_thickness']) && !empty($options['primenenie'])) {
            $result = self::buildAndRunQueryUteplitel(['item_thickness'], ['primenenie']);
            if (!empty($result)) {
                return $result;
            }
        }

        // Применение
        if (!empty($options['primenenie'])) {
            $result = self::buildAndRunQueryUteplitel([], ['primenenie']);
            if (!empty($result)) {
                return $result;
            }
        }

        return false;
    }

}

$cacheName = $modx->resource->id;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'strong_cache/file_snippets/getSimilarProducts/' . $modx->context->key
];

if (!$params = $modx->cacheManager->get($cacheName, $cacheOptions)) {
    $params = getSimilarProducts::getSimilarProductsParams();
    $modx->cacheManager->set($cacheName, $params, 0, $cacheOptions);
}

if (!empty($params)) {
    $result = $modx->runSnippet('msProductsMy', $params);
} else {
    $result = '';
}

return $result;
