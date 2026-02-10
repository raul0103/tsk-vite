<div class="content-block">
    {set $srcs = $value | split}
    {foreach $srcs as $src}
        <iframe width="100%" height="450" class="lazy" data-src="{$src}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    {/foreach}
</div>