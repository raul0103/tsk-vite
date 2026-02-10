{if $_modx->resource.context_key == 'pilomat'} 
  <section class="wrapper sect-pilorama">
    
    {if $_modx->resource.template != 23}
        <h1 class="title-1">Наши пилорамы</h1>
    {/if}
    
    <div class="about-gallery">
      {set $pilomatImages = [
        '/assets/template/img/pilorama/1.jpg',
        '/assets/template/img/pilorama/3.jpg',
        '/assets/template/img/pilorama/4.jpg',
        '/assets/template/img/pilorama/5.jpg',
        '/assets/template/img/pilorama/6.jpg',
        '/assets/template/img/pilorama/7.jpg',
        '/assets/template/img/pilorama/10.jpg',
        '/assets/template/img/pilorama/11.jpg',
        '/assets/template/img/pilorama/13.jpg',
        '/assets/template/img/pilorama/14.jpg',
        '/assets/template/img/pilorama/15.jpg',
        '/assets/template/img/pilorama/18.jpg',
        '/assets/template/img/pilorama/19.jpg',
        '/assets/template/img/pilorama/20.jpg'
      ]}
      
      <div class="about-gallery__img-wrap">
        <img class="about-gallery__img" src="/assets/template/img/pilorama/1.jpg">
      </div>
      <div class="swiper">
        <div class="swiper-container">
          <div class="swiper-buttons">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
          <div class="about-gallery__slider swiper-wrapper">
            {foreach $pilomatImages as $idx => $img}
              <div data-fancybox="pilorama" href="{$img}" class="swiper-slide about-gallery__slider-item{if $idx == 0} hidden{/if}">
                {set $imgsmall = 'phpthumbon' | snippet : [
                  'input' => $img,
                  'options' => '&w=400&h=272&zc=1'
                ]}
                <img class="about-gallery__slider-item-img" src="{$imgsmall}">
              </div>
            {/foreach}
          </div>
        </div>
      </div>
    </div>
    
    <div class="sect-pilorama__addresses-wrap content-block">
      <p class="sect-pilorama__address-header">Адрес пилорам</p>
      {'!lumbermills' | snippet : ['type'=>'custom']}
      <!-- <p class="sect-pilorama__address">Санкт-Петербург, территория Сергиево, Красная улица, 44Д</p>
      <p class="sect-pilorama__address">Парголово, Ленинградская улица, 93В</p>
      <p class="sect-pilorama__address">Всеволожский район, территория Соржа-Старая производственно-складская зона, Заневское городское поселение
      </p> -->
    </div>

    {if $_modx->resource.template == 23} 
        {$content}
    {/if}
    
  </section>
{/if}