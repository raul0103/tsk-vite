{set $rd = '@FILE modules/reviews-popup/snippets/reviews-data.php' | snippet : [
  'ratingRowClass' => 'reviews-popup__rate',
  'ratingItemClass' => 'reviews-popup__rate-item',
]}
<div class="reviews-popup js-reviews-popup">
  <a class="reviews-popup__close js-reviews-popup__close" href="#">
    <svg xmlns="http://www.w3.org/2000/svg" version="1" viewBox="0 0 24 24"><path d="M13 12l5-5-1-1-5 5-5-5-1 1 5 5-5 5 1 1 5-5 5 5 1-1z"></path></svg>
  </a>
  <a class="reviews-popup__link" href="/otzyvy/">
    <p class="reviews-popup__title">{$rd.rate}</p>
    {$rd.rating_html}
    <p class="reviews-popup__count">({$rd.count_txt})</p>
    <p class="reviews-popup__text">Читать все отзывы <img src="assets/template/tpl-imgs/review-icons/arrow.svg"></p>
  </a>
</div>
