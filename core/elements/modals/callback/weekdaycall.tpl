{set $days = '@FILE snippets/weekdaycall/weekdaycallDays.php' | snippet}
{set $textareaPlaceholder = "Удобное для Вас время\nПредпочтительный способ связи\n(моб. тел, WhatsApp, Telegram)"}

<div class="weekdaycall__bg"></div>
<form method="POST" action class="weekdaycall">
  <input type="text" name="mobilephone" class="fmobilephone">
  <div class="weekdaycall__btn-close" title="Закрыть"></div>
  <p class="weekdaycall__header">Свяжемся когда Вам удобнее</p>
  <div class="weekdaycall__body">
    <p class="weekdaycall__title">Выберите удобный день</p>
    <select name="DAY" class="weekdaycall__select">
        {foreach $days as $index => $day}
          <option value="{$day}"{if $index == 0} selected{/if}>{$day}</option>
        {/foreach}
    </select>
    <div class="weekdaycall__inputs-wrap">
      <label class="weekdaycall__label">
        <input name="NAME" class="custom-input" placeholder="Укажите Ваше имя">
        <span class="error_NAME"></span>
      </label>
      <label class="weekdaycall__label">
        <input name="PHONE" class="custom-input" placeholder="Укажите Ваш номер телефона">
        <span class="error_PHONE"></span>
      </label>
    </div>
    <label>
      <span class="weekdaycall__label-text">Комментарий</span>
      <textarea name="COMMENT" class="custom-textarea weekdaycall__textarea" placeholder="{$textareaPlaceholder}"></textarea>
      <span class="error_COMMENT"></span>
    </label>
    <button type="submit" class="form__button custom-btn weekdaycall__btn-submit">Перезвоните мне</button>
    <label class="form__checkbox weekdaycall__privacy">
      <input id="callback-policy" type="checkbox" name="callback-policy" checked>
      <span>
          <span>
             Нажимая кнопку «Перезвоните мне», Вы подтверждаете, что ознакомились с
            <span data-fancybox data-type="ajax" data-src="/confidential/" class="privacy-link">Условиями обработки персональных данных </span> и принимаете их
          </span>
        </span>
    </label>
  </div>

  <input name="weekdaycall-comment" type="hidden" value="Форма выходного дня">
</form>
