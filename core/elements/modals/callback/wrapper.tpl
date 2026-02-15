{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/popup-callback.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{if !$_modx->getPlaceholder('utm_source')}
    {'!AjaxForm' | snippet : [
    'snippet' => 'FormIt',
    'form' => '@FILE elements/modals/callback/popup-discount.tpl',
    'hooks' => 'check_words,create_request,create_bitrix_lead',
    'customValidators' => 'checkPhone,check_request',
    'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
    'validationErrorMessage' => 'В форме содержатся ошибки!',
    'successMessage' => 'Сообщение успешно отправлено'
    ]}
{/if}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/popup-cost-delivery.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE modules/stocks/chunks/popup-form-stock.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/popup-order.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/popup-view-showroom.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/popup-showroom.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/help-calculator-in-choice.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/help-in-choice.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}

{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/help-in-choice.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}


{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/plan-in-choice.tpl',
'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
'customValidators' => 'checkPhone,check_request',
'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Сообщение успешно отправлено'
]}


{'!AjaxForm' | snippet : [
'snippet' => 'FormIt',
'form' => '@FILE elements/modals/callback/popup-reviews.tpl',
'validate' => 'NAME:required,TEXT:required',
'validationErrorMessage' => 'В форме содержатся ошибки!',
'successMessage' => 'Спасибо, ваш отзыв отправлен на модерацию'
]}

{if ($_modx->resource.template in [21,51])}
    {'!AjaxForm' | snippet : [
    'snippet' => 'FormIt',
    'form' => '@FILE elements/modals/callback/popup-cost-fanera.tpl',
    'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
    'customValidators' => 'checkPhone,check_request',
    'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
    'validationErrorMessage' => 'В форме содержатся ошибки!',
    'successMessage' => 'Сообщение успешно отправлено'
    ]}
{/if}

{if ($_modx->resource.template in list [17, 20, 22])}
    {include 'file:elements/modals/callback/popup-select.tpl'}
{/if}

{*Выводим данный блок на всех страницах кроме статейных*}
{if $_modx->getPlaceholder('weekdaycall') == '1' and $_modx->resource.template not in list [34,35,41,42,43]}
    {'!AjaxForm' | snippet : [
      'snippet' => 'FormIt',
      'form' => '@FILE elements/modals/callback/weekdaycall.tpl',
      'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
      'customValidators' => 'checkPhone,check_request',
      'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
      'validationErrorMessage' => 'В форме содержатся ошибки!',
      'successMessage' => 'Сообщение успешно отправлено'
    ]}
{/if}

{if $_modx->resource.context_key in list ['pilomat', 'fasady-pro']}
    {'!AjaxForm' | snippet : [
      'snippet' => 'FormIt',
      'form' => '@FILE elements/modals/callback/popup-watch-live.tpl',
      'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
      'customValidators' => 'checkPhone,check_request',
      'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
      'validationErrorMessage' => 'В форме содержатся ошибки!',
      'successMessage' => 'Сообщение успешно отправлено'
    ]}
{/if}

{* {if ($_modx->resource.context_key in list ['krovlya', 'kirpich-m', 'fasady-pro', 'pilomat', 'pro-fanera', 'plitaosb', 'plity-mdvp', 'fasad', 'web', 'rockwool', 'tn', 'penoplex', 'isover', 'paroc', 'ursa', 'isorok', 'umatex'])}
    {include "file:chunks/popup-fortwheel.tpl"}
{/if} *}

{if ($_modx->resource.context_key == 'kirpich-m') && ($_modx->resource.template in [6,21,22,20,17])}
    {'!AjaxForm' | snippet : [
      'snippet' => 'FormIt',
      'form' => '@FILE elements/modals/callback/popup-discount-block.tpl',
      'hooks' => 'check_words_and_links,create_request,create_bitrix_lead',
      'customValidators' => 'checkPhone,check_request',
      'validate' => 'PHONE:required:checkPhone:check_request,mobilephone:blank',
      'validationErrorMessage' => 'В форме содержатся ошибки!',
      'successMessage' => 'Сообщение успешно отправлено'
    ]}
{/if}

{include "file:modules/material_callback_modal/chunks/wrapper.tpl"}
