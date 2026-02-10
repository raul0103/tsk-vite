<div class="production-block" style="width:100%">
<div class="production-block__content">
  <div class="production-block__info production-info">
    <h2 class="production-info__title">Собственное производство</h2>
    <div class="production-info__item">
      <div class="production-info__item-icon">
      <svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M6.62 11.29C8.06 14.12 10.38 16.43 13.21 17.88L15.41 15.68C15.68 15.41 16.08 15.32 16.43 15.44C17.55 15.81 18.76 16.01 20 16.01C20.55 16.01 21 16.46 21 17.01V20.5C21 21.05 20.55 21.5 20 21.5C10.61 21.5 3 13.89 3 4.5C3 3.95 3.45 3.5 4 3.5H7.5C8.05 3.5 8.5 3.95 8.5 4.5C8.5 5.75 8.7 6.95 9.07 8.07C9.18 8.42 9.1 8.81 8.82 9.09L6.62 11.29Z" fill="#AA010E"/>
      </svg>
    
      </div>
      <div class="production-info__item-phone">
        <p class="production-info__item-phone-title">Телефон производства:</p>
        <a href="tel:{'!get_virtual_phone' | snippet}">{'!get_virtual_phone' | snippet : ['type'=>'text']}</a>
      </div>
    </div>
    <div class="production-info__item">
      <div class="production-info__item-icon">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path
            d="M12 24C12 24 21 15.471 21 9C21 6.61305 20.0518 4.32387 18.364 2.63604C16.6761 0.948211 14.3869 0 12 0C9.61305 0 7.32387 0.948211 5.63604 2.63604C3.94821 4.32387 3 6.61305 3 9C3 15.471 12 24 12 24ZM12 13.5C10.8065 13.5 9.66193 13.0259 8.81802 12.182C7.97411 11.3381 7.5 10.1935 7.5 9C7.5 7.80653 7.97411 6.66193 8.81802 5.81802C9.66193 4.97411 10.8065 4.5 12 4.5C13.1935 4.5 14.3381 4.97411 15.182 5.81802C16.0259 6.66193 16.5 7.80653 16.5 9C16.5 10.1935 16.0259 11.3381 15.182 12.182C14.3381 13.0259 13.1935 13.5 12 13.5Z"
            fill="#AA010E" />
        </svg>
      </div>
      <div class="production-info__item-adres">
        <span>{'address' | option}</span>
      </div>
    </div>
    <div class="production-info__item">
      <div class="production-info__item-icon">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M2 20V4H22V20H2ZM12 13L20 8V6L12 11L4 6V8L12 13Z" fill="#AA010E" />
        </svg>

      </div>
      <div class="production-info__item-email">
        <a href="mailto:zakaz@www-gazobeton.ru">{'!get_virtual_email' | snippet}</a>
      </div>
    </div>
  </div>
  
  <div class="production-block__images production-images production-images--mobile">
    <div class="production-images__column">
      <img src="/assets/template/img/production/Rectangle 147.png">
      <img src="/assets/template/img/production/Rectangle 152.png">
    </div>
    <div class="production-images__column">
      <img src="/assets/template/img/production/Rectangle 151.png">
      <img src="/assets/template/img/production/Rectangle 153.png">
    </div>
  </div>
  
  
  <div class="production-block__form production-form">
    <h2 class="production-form__title">Связаться с производством</h2>

    {'!AjaxForm' | snippet : [
      'snippet' => 'FormIt',
      'form' => '@FILE chunks/form-production.tpl',
      'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
      'customValidators' => 'checkPhone,check_request,mobilephone:blank',
      'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
      'validationErrorMessage' => 'В форме содержатся ошибки!',
      'successMessage' => 'Сообщение успешно отправлено'
  ]}


  </div>
</div>
<div class="production-block__images production-images production-images--desktop">
  <div class="production-images__column">
    <img src="/assets/template/img/production/Rectangle 147.png">
    <img src="/assets/template/img/production/Rectangle 152.png">
  </div>
  <div class="production-images__column">
    <img src="/assets/template/img/production/Rectangle 151.png">
    <img src="/assets/template/img/production/Rectangle 153.png">
  </div>
</div>
</div>
