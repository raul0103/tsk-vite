{if ($evenodd == 0)}
<div class="swiper-slide mlt-reviews__slide">
{/if}
  <div class="mlt-reviews__item">
    <div class="mlt-reviews__item-header">
      <div class="mlt-reviews__item-header-column">
        <div
                class="mlt-reviews__item-header-logo"
                style="background-image: url('{$avatar ?: '/assets/template/img/reviews/default.svg'}');"
        ></div>
      </div>
      <div class="mlt-reviews__item-header-column">
        <div class="mlt-reviews__item-header-name">
          {$user_name}
        </div>
        <div class="mlt-reviews__item-header-date">
          {'@FILE modules/mltreviews/snippets/stringDateFormatted.php' | snippet : [
          'dateString' => $createdon
          ]}
        </div>
      </div>
      <div class="mlt-reviews__item-header-column mlt-reviews__item-header-imgrate">
          <img src="{$logo}" class="mlt-reviews__item-header-company-logo" />
          <div class="mlt-reviews__item-header-rating">{$rating_html}</div>
      </div>      
    </div>

    <div class="mlt-reviews__item-body">
      <div class="mlt-reviews__item-body-content collapse-long-text" style="line-height: 1.5;"> 
        {$content}
      </div>
    </div>
  </div>
{if $evenodd }
</div>
{/if}
