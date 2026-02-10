<a href="{$uri}" class="selections__item">

        {if $mainImage?}
            {set $src = 'phpthumbon' | snippet : [
                'input' => $mainImage,
                'options' => '&w=55&h=20&far=1&bg=ffffff'
            ]}

            <div class="selections__item-media" style="background-image:url({$mainImage});background-size: contain; background-position: 50%; background-repeat: no-repeat;"></div>   
        {else}
            <div class="selections__item-media" data-val="{$menutitle}"></div>         
        {/if}
    
    <div class="selections__item-title">
        {$menutitle}
    </div>
</a>
