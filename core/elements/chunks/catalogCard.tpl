<a class="catalog__card" href="{$uri}">
    {if $class_key == "msCategory"}
      {set $src = 'phpthumbon' | snippet : [
        'input' => $_pls['tv.mainImage'],
        'options' => '&w=350&far=1'
      ]}
    {elseif $class_key == "msProduct"}
      {set $src = 'msGallery' | snippet : [
        'product' => $id,
        'tpl' => "@INLINE [[+files.0.url]]"
      ]}
    {/if}
    <img class="catalog__card-img" src="{$src}" alt="{$menutitle}">
    <div class="catalog__card-title">
        <span class="catalog__card-title-span">{$menutitle}</span>
    </div>
</a>
