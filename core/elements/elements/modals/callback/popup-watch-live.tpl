<div class="popup js-thanks" id="watch-live">
  <form method="POST" action class="popup__form form">
    <input type="text" name="mobilephone" class="fmobilephone">

    <p class="title-2 form__title">Посмотреть вживую</p>
    <div class="form__text">Вы получите фото/видео товара в удобный для вас мессенджер</div>

    <div class="form__inputs">
      <label>
        <input type="text" placeholder="Ваше имя" name="NAME">
        <span class="error_NAME">[[!+fi.error.NAME]]</span>
      </label>

      <label>
        <input type="tel" placeholder="Телефон*" name="PHONE">
        <span class="error_PHONE">[[!+fi.error.PHONE]]</span>
      </label>

      <label>
        <select class="popup__form-select" name="MESSENGER">
          <option value="Не выбран" selected disabled hidden>Выберите мессенджер</option>
          <option value="WhatsApp">WhatsApp</option>
          <option value="Telegram">Telegram</option>
        </select>
        <span class="error_MESSENGER">[[!+fi.error.MESSENGER]]</span>
      </label>
    </div>

    <button type="submit" class="form__button custom-btn">Посмотреть вживую</button>
    <label class="form__checkbox">
      <input id="callback-policy" type="checkbox" name="callback-policy" checked>
      <span>
        <span>
           Нажимая кнопку «Посмотреть вживую», Вы подтверждаете, что ознакомились с
          <span data-fancybox data-type="ajax"
                data-src="/confidential/" class="privacy-link">Условиями обработки персональных данных </span>
          и принимаете их
        </span>
      </span>
    </label>

    <input name="COMMENT" type="hidden" value="Заявка на просмотр товара в живую">
  </form>
</div>
