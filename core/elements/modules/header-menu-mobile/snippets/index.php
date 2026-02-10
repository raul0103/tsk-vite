<?php

class HmmProcessor
{
    private $context;
    private $output = '';
    private $json;

    public function __construct($context)
    {
        $this->context = $context;
    }

    public function process()
    {
        $this->initDataJSON();

        if (isset($this->json->data)) {
            $this->generateTabsHTML(true, $this->json->data);
            $this->minifyHTML();

            return  '<div class="hmm" data-hmm-menu>' . $this->output . '</div>';
        } else {
            return "";
        }
    }

    /**
     * Меню может занимать много строк
     */
    private function minifyHTML()
    {
        $this->output = preg_replace('/>\s+</u', '><', $this->output);
        $this->output = preg_replace('/\s+/u', ' ', $this->output);
        return $this->output;
    }

    private function initDataJSON()
    {
        $json_path = MODX_BASE_PATH . "core/elements/modules/header-menu-mobile/json/{$this->context}/data.json";
        if (!file_exists($json_path)) {
            return "";
        }

        $json_data = file_get_contents($json_path);
        $this->json = json_decode($json_data);
    }

    /**
     * Функция возращает HTML код
     * Решил делать таким образом что-бы в большом цикле не запрашивать файлы чанков
     * 
     * $tpl - шаблон
     * $insert - переданный код
     */
    private function hmmHTML($tpl, $insert = null)
    {
        $html = [
            'tab' => function ($insert) {
                // Кнопка назад
                if ($insert->btn_back) {
                    $btn_back = $this->hmmHTML('item-back');
                }

                // Ссылка на текущую открытыю категорию
                if (isset($insert->btn_current)) {
                    $btn_current = $this->hmmHTML('item-current', (object)$insert->btn_current);
                }

                return "<div class='hmm__tab {$insert->tab_active_class}' data-hmm-tab='{$insert->tab_id}'>
                            <div class='hmm__title'>
                                {$insert->tab_title}
                            </div>
                            <ul class='hmm__items'>
                                $btn_back
                                $btn_current
                                {$insert->tab_items_html}
                            </ul>
                        </div>";
            },
            'item-tab-catalog' => function ($insert) {
                return "<li class='hmm__item {$insert->colored_class} hmm-tab-catalog hmm-tab-open'>
                            <a data-hmm-tab-open='{$insert->name}'>
                                <div class='hmm-tab-catalog__icon'>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div> 
                                {$insert->name}
                            </a>
                        </li>";
            },
            'item-tab-open' => function ($insert) {
                return "<li class='hmm__item {$insert->colored_class} hmm-tab-open'>
                            <a data-hmm-tab-open='{$insert->name}'> 
                                {$insert->name}
                            </a>
                        </li>";
            },
            'item-normal' => function ($insert) {
                return "<li class='hmm__item {$insert->colored_class}'>
                            <a href='{$insert->uri}'>{$insert->name}</a>
                        </li>";
            },
            'item-current' => function ($insert) {
                return "<li class='hmm__item {$insert->colored_class}'>
                            <a href='{$insert->uri}'>Перейти в {$insert->name}</a>
                        </li>";
            },
            'item-back' => function ($insert) {
                return "<li class='hmm__item hmm-tab-back'>
                            <a data-hmm-tab-back>Назад</a>
                        </li>";
            }
        ];

        return $html[$tpl]($insert);
    }

    /**
     * Генерирует HTML код табов
     * 
     * $tab_is_main - Основной ли это таб? первый активный таб при открытии
     * $tab_items - Элементы (ссылки на страницы). Если это не первый таб то передается children
     * $tab_item_parent - Родительский элемент от которого сгенерированы children
     */
    private function generateTabsHTML($tab_is_main = false, $tab_items, $tab_item_parent = null)
    {
        $tab_items_html = '';
        foreach ($tab_items as $item) {
            if ($item->colored) {
                $item->colored_class = 'colored';
            }



            // Если есть дети, то формируем в виде ссылки на таб и формируем его
            if (!empty($item->children)) {
                // Проеряем передан ли шаблон
                if ($item->item_tpl) {
                    $item_tpl = $item->item_tpl;
                } else {
                    $item_tpl = "item-tab-open";
                }

                $tab_items_html .= $this->hmmHTML($item_tpl, $item);
                $this->generateTabsHTML(false, $item->children, $item);
            } else {
                $tab_items_html .= $this->hmmHTML("item-normal", $item);
            }
        }

        if ($tab_is_main) {
            $tab_data = [
                'tab_id' => 'main',
                'tab_active_class' => 'active',
                'tab_title' => $this->json->other->main_title,
                'tab_items_html' => $tab_items_html
            ];
            $tab_data = (object)$tab_data;
            $this->output .= $this->hmmHTML('tab', $tab_data);
        } else {
            // Эта часть кода сработает в следующих итерациях когда будет передан tab_item_parent
            $tab_data = [
                'btn_back' => true,
                'btn_current' => [
                    'colored_class' => 'colored',
                    'uri' => $tab_item_parent->uri,
                    'name' => $tab_item_parent->name,
                ],
                'tab_id' => $tab_item_parent->name,
                'tab_title' => $tab_item_parent->name,
                'tab_items_html' => $tab_items_html
            ];
            $tab_data = (object)$tab_data;
            $this->output .= $this->hmmHTML('tab', $tab_data);
        }
    }
}

$context = $modx->context->key;
$processor = new HmmProcessor($context);
return $processor->process();
