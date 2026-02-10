<?php
$context = $modx->resource->context_key;

$path = "./core/elements/snippets/menu_new_v2/menu_$context.json";

if (file_exists($path)){

    $json = file_get_contents($path);
    $result = json_decode($json);

    try {

        $result = json_decode($json, $associative=true, $depth=512, JSON_THROW_ON_ERROR);


        $output="";
        $count=0;

        $main_block_item="";
        $main_block_scats="";


        foreach($result as $cat){
            
            $main_block_item=$main_block_item.'<span class="mm_block_main_item" data-category="mm_v2_'.$count.'">
                                                    <svg class="assort__svg">
                                                        <use xlink:href="/assets/template/img/svg-sprite.svg?v='.$modx->getOption('file_version').'#'.$cat['svg_id'].'"></use>
                                                    </svg>
                                                    '.$cat['name'].'
                                                </span>';

            $cat_block="";
            $groups=""; 
            $inner_tabs="";

            
            if((array_key_exists("links", $cat))&&(count($cat["links"])>0)){
                $inner_tabs=$inner_tabs.'<div class="mm_block-inner_tabs">';
                    foreach($cat['links'] as $link){
                         $inner_tabs=$inner_tabs.'<a href="'.$link['uri'].'">'.$link['name'].'</a>';
                    }
                $inner_tabs=$inner_tabs.'</div>';
            }
            


            if(array_key_exists("groups", $cat)){
                foreach($cat['groups'] as $group){
                    $group_current='<div class="mm_block-inner_group">';
                    if($group['name']!=null){
                        $group_current=$group_current.'<a href="'.$group['uri'].'" class="mm_block-inner_group-title">'.$group['name'].'</a>';
                    }
                    $group_current=$group_current.'<div class="mm_block-inner_group-linkwrapper type_'.$group['type'].'">';
                    if(count($group['items'])>0){
                        foreach($group['items'] as $item){
                            $item_html="";
                            switch ($group['type']){
                                case 1:{
                                    $item_html='<a class="mm_block-inner_group-linkitem" href="'.$item['uri'].'">
                                        <div class="img_wrapper"><img src="'.$item['img'].'"></div>
                                        <div class="txt_wrapper"><span>'.$item['name'].'</span></div>
                                    </a>';
                                    break;
                                }
                                case 2:{
                                    $item_html='<div class="mm_block-inner_group-linkitem">
                                        <div class="img_wrapper"><img src="'.$item['img'].'"></div>
                                        <div class="txt_wrapper"><a href="'.$item['uri'].'">'.$item['name'].'</a>';
                                    foreach($item['links'] as $ilnk){
                                        $item_html=$item_html.'<a href="'.$ilnk['uri'].'">'.$ilnk['name'].'</a>';
                                    }
                                    $item_html=$item_html.'</div></div>';
                                    break;
                                }
                                case 3:{
                                    $item_html='<a href="'.$item['uri'].'">
                                        <div class="txt_wrapper"><span>'.$item['name'].'</span></div>
                                    </a>';
                                    break;
                                }
                                default:{
                                    break;
                                }
                            }
                            $group_current=$group_current.$item_html;
                        }
                    }
                    $group_current=$group_current.'</div>';
                    $group_current=$group_current.'</div>';
                    $groups=$groups.$group_current;
                }
            }
            

            $cat_block=$cat_block.'<div class="mm_block_inner" id="mm_v2_'.$count.'">'.$inner_tabs.'<div class="mm_block-inner_groups">'.$groups.'</div></div>';
            $main_block_scats=$main_block_scats.$cat_block;
            

            $count++;
        }

        $output=$output.'<div class="mm_block_main">'.$main_block_item.'</div>';

        $output=$output.'<div class="mm_block_cat_blocks_wrapper">'.$main_block_scats.'</div>';

        echo $output;
    }catch (Exception $e){
        echo '<h2>JSON не читается</h2>';
        echo '<p>'.$e.'</p>';
    }
}else{
    echo '<h2>Разделы не найдены</h2>';
}