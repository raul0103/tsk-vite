<?php
/* Класс replacer используется для замены текста в заданном выводе HTML и добавления функций JavaScript для декодирования и
отобразить замененный текст. */
class Replacer
{
    private $output;
    private $indexShredinger = 0;
    private $replaceshredinger = [];


    public function __construct(&$output){
        $this->output = $output;
    }


    /**
     * Функция «handlerArticle» использует регулярные выражения для извлечения и замены текста внутри артикула.
     *
     * @return измененную выходную строку после замены текста внутри тегов `<div>` новым значением.
     */
    public function handlerArticle(){
        $pattern = '/<div class="listing__products-item-art">(.*?)<\/div>/s';

        $this->output = preg_replace_callback($pattern, function($matches){

            $text = str_replace("Арт. ", "Арт.", $matches[1]);

            $this->replaceshredinger[$this->indexShredinger] = base64_encode($text); // Извлеченный текст: Арт. CheOn-16808

            // Заменяем текст внутри <div> на новое значение
            $newText = "<span class='shredinger shredinger" . $this->indexShredinger . "'></span>";
            $this->indexShredinger++;
            return '<div class="listing__products-item-art">' . $newText . '</div>';
        }, $this->output);
    }

    /**
     * Функция replaceArticle вызывает две другие функции: handlerArticle и addShredingerJs.
     */
    public function processReplace()
    {
        $this->handlerArticle();
        $this->addShredingerJs();
    }


    public function handlerMenu(Array $replaces, string $pattern =  '/<div class="txt_wrapper"><span>(.*?)<\/span><\/div>/s'){
        $this->output = preg_replace_callback($pattern, function($matches) use ($replaces){
            $textReplace = $matches[0];
            foreach ($replaces as $searchReplace){
                if(strpos($matches[1], $searchReplace) !== false)
                {
                    $textReplace = str_replace($searchReplace, "<span class='shredinger shredinger" . $this->indexShredinger . "'></span>", $matches[0]);
                    $text = $searchReplace;
                    $this->indexShredinger ++;
                    $this->replaceshredinger[$this->indexShredinger] = base64_encode($text);
                }
            }
            // Заменяем текст внутри <div> на новое значение
            return $textReplace;
        }, $this->output);
    }


    /**
     * Функция «addShredingerJs» добавляет в выходной HTML-код JavaScript, который заменяет определенные элементы их
     * соответствующие значения из объекта JSON.
     */
    public function addShredingerJs(){
        $this->output = str_replace("</body>", "<script> var shredinger = " . json_encode(array_values($this->replaceshredinger), JSON_UNESCAPED_UNICODE) . "; 
             function b64_to_utf8(str) {
            	return decodeURIComponent(escape(window.atob(str)));
            }
 
            $.each(shredinger, function(index, elemm){
                $('.shredinger' + index).attr('data-content', b64_to_utf8(elemm)); 
            }); 
        </script></body>", $this->output);
    }

    /**
     * Функция getOutput возвращает выходное свойство текущего объекта.
     *
     * @return output.
     */
    public function getOutput(){
        return $this->output;
    }

}

switch ($modx->event->name) {
    case 'OnWebPagePrerender':

        $output = &$modx->resource->_output;
        $pdoTools = $modx->getService("pdoTools");
        if($modx->resource->get("id") == 36807 or
           in_array($modx->resource->get("id"), $pdoTools->runSnippet("@FILE snippets/getCategoriesListIds.php", ['parent' => '81059,32363,27915']))
           )
        {
            $replacer = new Replacer($output);
            $replacer->handlerArticle();
            $replacer->handlerMenu(
                ["Кликфальц"]
            );
            $replacer->handlerMenu(
                ["Металлочерепица"],
                '/class="mm_block-inner_group-title">(.*?)<\/a>/s'
            );
            $replacer->addShredingerJs();
            $output = $replacer->getOutput();
        }

        break;
}