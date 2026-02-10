<section class="wrapper sect-showroom-gallery">
    <div class="sect-showroom-gallery__wrapper showroom-gallery"> 
    {set $imagePath = "/assets/images/show-room/{$site_context}"}
    {set $showroomImages = '@FILE snippets/getFolderJpgList.php' | snippet : ['file_suffix'=>'show-room', 'folder'=> $imagePath]}          
 
   
    {foreach $showroomImages as $idx => $img} 
        {set $thumb = 'phpthumbon' | snippet : [ 'input' => "{$imagePath}/{$img}", 'options' => '&h=364&w=570&zc=1' ]} 
        <p
            class="showroom-gallery__thumb">
            <a data-fancybox="gallery" href="{$imagePath}/{$img}">
                <img class="showroom-gallery__image" src="{$thumb}" alt="Шоурум компании {$_modx->config.site_name} {$idx}" />
            </a>
        </p> 
    {/foreach} 
    </div>
</section>
