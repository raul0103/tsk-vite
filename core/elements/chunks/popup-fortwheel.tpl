<div class="js-dont-close-on-submit popup popup-fortwheel popup-fortwheel_start-animation" id="fortwheel">
  <form method="POST" action class="popup__form form form_fortwheel__user-form">
    <p class="title-2 form__title">Испытайте удачу</p>
    <div class="form__text">Введите номер вашего телефона, вращайте колесо и получите бонус</div>

    <div class="popup-fortwheel__content">
      <div class="popup-fortwheel__content-side">
        <div class="deal-wheel">
          <ul class="spinner"></ul>
          <div class="ticker"></div>
        </div>
      </div>
      <div class="popup-fortwheel__content-side">
        <div class="popup-fortwheel__form-wrap">
          <div class="popup-fortwheel__form form__inputs">
            <label>
              <input class="popup-fortwheel__input-phone" type="tel" placeholder="Телефон*" name="PHONE">
              <span class="error_PHONE">[[!+fi.error.PHONE]]</span>
            </label>
          </div>
          <button type="submit" class="form__button custom-btn">Испытай удачу</button>
          <label class="form__checkbox">
            <input id="callback-policy" type="checkbox" name="callback-policy" checked>
            <span>
            <span>
               Нажимая кнопку «Вращать колесо», Вы подтверждаете, что ознакомились с
              <span data-fancybox data-type="ajax"
                    data-src="/confidential/" class="privacy-link">Условиями обработки персональных данных </span>
              и принимаете их
            </span>
          </span>
          </label>
        </div>
        <div class="popup-fortwheel__submitted-text">
          В ближайшее время наш менеджер свяжется с Вами и сообщит условия акции
        </div>
      </div>
    </div>
  </form>

  
    {'!AjaxForm' | snippet : [
      'snippet' => 'FormIt',
      'form' => '@FILE elements/modals/callback/popup-fortwheel-hidden-form.tpl',
      'hooks' => 'create_bitrix_lead',
      'submittype' => 'fortwheel',
      'validate' => 'mobilephone:blank',
      'validationErrorMessage' => 'В форме содержатся ошибки!',
      'successMessage' => 'Сообщение успешно отправлено'
    ]}
  

</div>
