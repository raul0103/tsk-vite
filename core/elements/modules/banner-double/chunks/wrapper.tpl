{set $bg = [
    "big" => "/assets/template/img/banners-slider/gazobeton/1.jpg",
    "small" => "/assets/template/img/banners-slider/gazobeton/small.jpg"
]}
{set $link_more = "/rasprodazha-so-sklada/"}

<section class="banner-double">
  <div class="wrapper">
    <div class="banner-double__row">
      <div
        class="banner-double__big"
        style="background-image: url('{$bg['big']}')"
      >
        <div class="banner-double__big-content">
          <div class="banner-double__big-text">
            <span class="colored">Скидка 30%</span> на доставку и разгрузку!
          </div>
          <div class="banner-double__big-intro">
            Оставьте заявку и сэкономьте 30% на доставке при заказе от 40м3
          </div>
          <button
            class="btn"
            data-btn-key="banner-main"
            data-fancybox=""
            data-src="#cost-delivery"
          >
            Заказать со скидкой
          </button>
        </div>
      </div>
      <div
        class="banner-double__small"
        style="background-image: url('{$bg['small']}')"
      >
        <div class="banner-double__small-text">
          <span class="colored">Ликвидация склада!</span> Успей забрать
        </div>
        <a class="btn" href="{$link_more}">Подробнее</a>
      </div>
    </div>
  </div>
</section>