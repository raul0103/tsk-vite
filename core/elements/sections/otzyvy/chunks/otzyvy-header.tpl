<div class="sect-otzyvy__quote">
  <span class="sect-otzyvy__img"><svg width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="0.5" y="0.5" width="41" height="41" rx="20.5" fill="white"/>
    <rect x="0.5" y="0.5" width="41" height="41" rx="20.5" stroke="#7a99a6"/>
    <path d="M10.4926 28.5381C9.03342 26.9882 8.25 25.25 8.25 22.4322C8.25 17.4739 11.7307 13.0298 16.7925 10.8326L18.0576 12.7847C13.333 15.3404 12.4093 18.6568 12.041 20.7478C12.8018 20.354 13.7977 20.2166 14.7737 20.3072C17.3294 20.5438 19.3439 22.6419 19.3439 25.25C19.3439 26.565 18.8215 27.8262 17.8917 28.7561C16.9618 29.6859 15.7006 30.2083 14.3856 30.2083C13.6583 30.2021 12.9396 30.0511 12.2712 29.7644C11.6029 29.4776 10.9983 29.0608 10.4926 28.5381ZM24.6593 28.5381C23.2001 26.9882 22.4167 25.25 22.4167 22.4322C22.4167 17.4739 25.8974 13.0298 30.9592 10.8326L32.2242 12.7847C27.4997 15.3404 26.576 18.6568 26.2077 20.7478C26.9684 20.354 27.9643 20.2166 28.9404 20.3072C31.4961 20.5438 33.5106 22.6419 33.5106 25.25C33.5106 26.565 32.9882 27.8262 32.0583 28.7561C31.1285 29.6859 29.8673 30.2083 28.5522 30.2083C27.825 30.2021 27.1063 30.0511 26.4379 29.7644C25.7696 29.4776 25.1649 29.0608 24.6593 28.5381Z" fill="#7a99a6"/>
    </svg>
  </span>
  <p class="sect-otzyvy__quote-text">&laquo;Нам важно ваше мнение, ведь мы работаем для вас. Поделитесь своими впечатлениями, предложениями или замечаниями – мы обязательно учтем их и ответим каждому.&raquo;</p>
  <a class="sect-otzyvy__quote-btn" href="#mlt-reviews-form" data-fancybox>Оставить отзыв</a>
</div>
<div class="popup" id="mlt-reviews-form" style="display: none;">
  <div class="mlt-reviews__form">
      <div class="mlt-reviews__title">Оставить отзыв</div>
      {'@FILE modules/mltreviews/snippets/mltReviewForm.php' | snippet : [
      'tpl' => '@FILE: modules/mltreviews/chunks/tplForm.tpl'
      ]}
  </div>
</div>
<h1 class="sect-otzyvy__header title-1">{$_modx->resource.pagetitle}</h1>
<p class="sect-otzyvy__annotation">
  {$_modx->resource.introtext}
</p>