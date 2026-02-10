{set $items = [
    [
    'uri' => '/polikarbonat-dlya-zabora/',
    'title' => 'Для забора',
    'image' => 'assets/template/img/application-icons/zabor.svg'
    ],
    [
    'uri' => '/polikarbonat-dlya-vorot/',
    'title' => 'Для ворот',
    'image' => 'assets/template/img/application-icons/vorot.svg'
    ],
    [
    'uri' => '/polikarbonat-dlya-krovli/',
    'title' => 'Для кровли',
    'image' => 'assets/template/img/application-icons/krovlya.svg'
    ],
    [
    'uri' => '/polikarbonat-dlya-teplic/',
    'title' => 'Для теплиц',
    'image' => 'assets/template/img/application-icons/teplic.svg'
    ],
    [
    'uri' => '/polikarbonat-dlya-balkona/',
    'title' => 'Для балкона',
    'image' => 'assets/template/img/application-icons/balkon.svg'
    ],
    [
    'uri' => '/polikarbonat-dlya-navesa/',
    'title' => 'Для навеса',
    'image' => 'assets/template/img/application-icons/naves.svg'
    ],
    [
    'uri' => '/polikarbonat-dlya-besedki/',
    'title' => 'Для беседки',
    'image' => 'assets/template/img/application-icons/besed.svg'
    ],
]}

<section class="application-icons">
    <div class="wrapper">
      <h2 class="title-2">Применение</h2>
      <div class="application-icons__rows">
        {foreach $items as $item}
        <a class="application-icons__item" href="{$item['uri']}">
          <div class="application-icons__item-image">
            <img src="{$item['image']}" />
          </div>
          <div class="application-icons__item-title">{$item['title']}</div>
        </a>
        {/foreach}
      </div>
    </div>
  </section>
  
