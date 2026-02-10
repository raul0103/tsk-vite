{set $ctx = $_modx->context.key}

{if $_modx->resource.parent in list [126001,125604]}
    {set $garanty = ['image' => 'pictograms-svg-7.svg','title'=>'Гарантия от протечек 15 лет']}
{else}
    {set $garanty = ['image' => 'pictograms-svg-1.svg','title'=>'Гарантия от протечек 20 лет']}
{/if}

{set $advantages_mini_items = [
    'onduline1' => [
        $garanty,
        ['image' => 'pictograms-svg-2.svg','title'=>'Не шумит в дождь'],  
        ['image' => 'pictograms-svg-4.svg','title'=>'Простой монтаж'],  
        ['image' => 'pictograms-svg-5.svg','title'=>'Не нагревается'],  
        ['image' => 'pictograms-svg-9.svg','title'=>'Не ржавеет'],
        ['image' => 'anchor.svg','title'=>'Больше о свойствах Onduline', 'anchor' => 'section-advantages'],
    ]
]}

{if $advantages_mini_items[$ctx]}
<div class="advantages-mini">
    {foreach $advantages_mini_items[$ctx] as $item}
    <div class="advantages-mini__item">
      {if $item['anchor']}
        <a class="advantages-mini__item-anchor" href="#{$item['anchor']}" data-anchor-scroll>
            <img src="/assets/template/img/advantages/{$ctx}/{$item['image']}" />
        </a>
      {else}
        <img src="/assets/template/img/advantages/{$ctx}/{$item['image']}" />
      {/if}
      <span class="advantages-mini__item-title">{$item['title']}</span>
    </div>
    {/foreach}
</div>
{/if}
  