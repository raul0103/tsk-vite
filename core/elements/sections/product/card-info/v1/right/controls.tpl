<div class="product-card__btns-wrap">
  <span
    class="js-product__btn product-card__btn-compare js-product__btn-compare{if $checkItems['comp'][$_modx->resource['id']]?} active{/if}"
    href="#"
  >
    <svg
      class="svg icon-compare"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      version="1.1"
      viewBox="0 0 16 16"
      width="16"
      height="16"
    >
      <use
        xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-compare"
      ></use>
    </svg>
  </span>
  <span
    class="js-product__btn product-card__btn-fav js-product__btn-fav{if $checkItems['fav'][$_modx->resource['id']]?} active{/if}"
    href="#"
  >
    <svg
      class="svg icon-heart"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:xlink="http://www.w3.org/1999/xlink"
      version="1.1"
      viewBox="0 0 21 18"
      width="21"
      height="18"
    >
      <use
        xlink:href="{$_modx->config['template_path']}img/svg-sprite.svg#icon-heart"
      ></use>
    </svg>
  </span>
  <script src="https://yastatic.net/share2/share.js"></script>
  <div
    class="ya-share2"
    data-copy="last"
    data-curtain
    data-shape="round"
    data-limit="0"
    data-more-button-type="short"
    data-services="vkontakte,odnoklassniki,telegram,whatsapp"
  ></div>
</div>
