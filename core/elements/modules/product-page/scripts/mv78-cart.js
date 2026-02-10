/**
 * Переиспользуемый компонент корзины для модуля product-page
 * 
 * Этот модуль независим от основной системы и использует собственные селекторы:
 * - .js-mv78-cart - контейнер компонента
 * - .js-mv78-cart__controls_action_add - блок для добавления в корзину
 * - .js-mv78-cart__controls_action_change - блок для изменения количества
 * - .js-mv78-cart__to-cart - кнопка добавления в корзину
 * - .js-mv78-cart__form-add - форма добавления
 * - .js-mv78-cart__form-change - форма изменения
 * - .mv78-cart-counter__amount - поле с количеством
 * - .mv78-cart-counter__btn - кнопки +/-
 */

export default {
  init,
};

/**
 * Инициализация компонента корзины MV78
 */
function init() {
  console.log('MV78 Cart component initialized');

  // Обработчик кнопки добавления товара в корзину
  $(document).on('click', '.js-mv78-cart .js-mv78-cart__to-cart', handleAddToCart);

  // Обработчик изменения количества в счетчике
  $(document).on('change', '.js-mv78-cart .mv78-cart-counter__amount', handleCounterChange);

  // Обработчик кнопок +/- в счетчике
  $(document).on('click', '.mv78-cart-counter__btn', handleCounterButton);

  // Инициализация всех компонентов на странице
  initMV78CartComponents();

  // Callbacks для miniShop2
  if (typeof miniShop2 !== 'undefined') {
    setupMiniShop2Callbacks();
  }
}

/**
 * Получить активную форму компонента
 */
function getActiveMV78Form($cartComponent) {
  let $formService;
  let $formAction;

  if ($cartComponent.hasClass('js-mv78-cart-in-cart')) {
    // Товар уже в корзине
    $formService = $cartComponent.find('.js-mv78-cart__form-change');
    $formAction = $cartComponent.find('.js-mv78-cart__controls_action_change');
  } else {
    // Товара нет в корзине
    $formService = $cartComponent.find('.js-mv78-cart__form-add');
    $formAction = $cartComponent.find('.js-mv78-cart__controls_action_add');
  }

  return {
    system: $formService,
    action: $formAction,
  };
}

/**
 * Обработчик добавления товара в корзину
 */
function handleAddToCart(e) {
  e.preventDefault();

  let $this = $(this);
  let $cartComponent = $this.closest('.js-mv78-cart');
  let $formChange = $cartComponent.find('.js-mv78-cart__controls_action_change');
  let $closestFormAdd = $cartComponent.find('.js-mv78-cart__controls_action_add');
  let purposes = {};

  // Собираем опции если есть toggles
  let options = {};
  $('.product-card__toggles .product-card__toggle-input').each(function() {
    let $checkbox = $(this);
    let toggleName = $checkbox.data('toggle');
    if (toggleName && $checkbox.is(':checked')) {
      let optionName = toggleName
        .replace(/-/g, '_')
        .replace(/free_measurement/, 'Бесплатный замер')
        .replace(/mounting/, 'Монтаж')
        .replace(/mounting_systems/, 'Системы крепления');
      options[optionName] = 'Да';
    }
  });

  // Получение количества
  let countRaw = $closestFormAdd.find('.mv78-cart-counter__amount').val();
  let count = parseFloat(countRaw);

  // Обработка data-purpose если есть
  $closestFormAdd.find('.mv78-cart-counter__amount').each(function(i, e) {
    let $e = $(e);
    let key = $e.attr('data-purpose');
    if (typeof key !== 'undefined') {
      purposes[key] = $e.val();
    }
  });

  // Установка количества в форму изменения
  if (Object.keys(purposes).length) {
    for (let key in purposes) {
      $formChange
        .find('.mv78-cart-counter__amount[data-purpose="' + key + '"]')
        .each(function(i, e) {
          $(e).val(purposes[key]);
          e['oldValue-change'] = purposes[key];
          e['lastValue'] = purposes[key];
        });
    }
  } else {
    $formChange.find('.mv78-cart-counter__amount').each(function(i, e) {
      if (countRaw == 0) countRaw = 1;
      $(e).val(countRaw);
      e['oldValue-change'] = count;
      e['lastValue'] = count;
    });
  }

  // Добавление товара
  formAddCount($cartComponent, count, options);
  
  // Добавляем класс что товар в корзине
  $cartComponent.addClass('js-mv78-cart-in-cart');
}

/**
 * Отправка формы добавления товара в корзину
 */
function formAddCount($cartComponent, count, options) {
  options = typeof options !== 'undefined' ? options : {};
  
  let $formAdd = $cartComponent.find('.js-mv78-cart__form-add');
  
  // Удаляем старые опции
  $formAdd.find('input[name^="options["]').remove();
  
  // Добавляем новые опции
  for (let optionName in options) {
    if (options.hasOwnProperty(optionName)) {
      $('<input>')
        .attr('type', 'hidden')
        .attr('name', 'options[' + optionName + ']')
        .val(options[optionName])
        .appendTo($formAdd);
    }
  }
  
  // Устанавливаем количество
  $formAdd.find('[name="count"]').val(count);
  $('.js-mv78-cart__form-change [name="count"]').val(count);
  
  // Отправляем форму
  $formAdd.find('[type="submit"]')[0].click();
}

/**
 * Обработчик изменения количества в счетчике
 */
function handleCounterChange(e) {
  e.preventDefault();
  
  let $input = $(this);
  let $cartComponent = $input.closest('.js-mv78-cart');
  
  changeCountItemInCart($cartComponent, false, $input);
}

/**
 * Обработчик кнопок +/- счетчика
 */
function handleCounterButton(e) {
  e.preventDefault();

  let $this = $(this);
  let $counter = $this.closest('.mv78-cart-counter');
  let $inputValue = $counter.find('.mv78-cart-counter__amount');
  let step = 1;

  let val = parseFloat($inputValue.val());
  val = Math.floor(val / step);

  if ($this.hasClass('mv78-cart-counter__btn_dir_less')) {
    val -= 1;
  } else if ($this.hasClass('mv78-cart-counter__btn_dir_more')) {
    val += 1;
  }
  
  val = val * step;
  $inputValue.val(val);

  if (!$inputValue.closest('.ms2_form').length) {
    $inputValue.trigger('change');
  }
}

/**
 * Изменение количества товара в корзине
 */
function changeCountItemInCart($cartComponent, forbidZero, $target, dontShowMessage) {
  dontShowMessage = typeof dontShowMessage !== 'undefined' ? dontShowMessage : false;
  forbidZero = typeof forbidZero !== 'undefined' ? forbidZero : false;
  $target = typeof $target !== 'undefined' ? $target : null;

  let inCart = false;
  let $inputAmount;

  let $forms = getActiveMV78Form($cartComponent);
  let $systemForm = $forms['system'];
  
  if ($cartComponent.hasClass('js-mv78-cart-in-cart')) {
    inCart = true;
  }

  if ($target === null) {
    $inputAmount = $forms['action'];
    if ($inputAmount.length > 1) {
      $forms['action'].each(function(i, e) {
        if ($(e).is(':visible')) {
          $inputAmount = $(e);
        }
      });
    }
    $inputAmount = $inputAmount.find('.mv78-cart-counter__amount');
  } else {
    $inputAmount = $target;
  }

  let val = $inputAmount.val();

  // Синхронизация всех счетчиков
  $forms['action'].each(function(i, e) {
    $(e).find('.mv78-cart-counter__amount').each(function(i, e) {
      let valTmp = val;
      let $checkedAmount = $(e);

      let koeff1 = $checkedAmount.attr('data-koeff');
      let koeff2 = $inputAmount.attr('data-koeff');

      let cond1 = typeof koeff1 !== 'undefined' && typeof koeff2 === 'undefined';
      let cond2 = typeof koeff1 === 'undefined' && typeof koeff2 !== 'undefined';

      switch (true) {
        case cond1:
          valTmp = koeff1 * valTmp;
          break;
        case cond2:
          valTmp = valTmp / koeff2;
          break;
      }

      if ($cartComponent.find('.mv78-cart-counter_type_fractional').length) {
        valTmp = Number(valTmp).toFixed(2);
      } else {
        valTmp = Math.ceil(valTmp);
      }

      if (!$checkedAmount.is($inputAmount)) {
        if (!$checkedAmount.parent().hasClass('mv78-cart-counter_type_fractional')) {
          valTmp = Math.ceil(valTmp);
        }
        valTmp = parseFloat(valTmp);
        $checkedAmount.val(valTmp);
      }

      if (cond2) {
        val = valTmp;
      }
    });
  });

  let count = parseFloat(val);
  if (forbidZero && count === 0) {
    count = 1;
  }

  $systemForm.find('[name="count"]').val(count);

  // Если товар в корзине
  if (inCart) {
    let $dontShowMessageInput;
    if (dontShowMessage) {
      $dontShowMessageInput = $('<input name="dont_show_message" value="1">').appendTo($systemForm);
    }

    $systemForm.find('[type="submit"]')[0].click();

    if (count === 0) {
      let $elemsAdd = $cartComponent.find('.js-mv78-cart__controls_action_add');
      $elemsAdd.find('[name="count"]').each(function(i, e) {
        let $e = $(e);
        let newVal = 1;
        if ($e.attr('data-koeff')) {
          newVal = $e.attr('data-koeff') * newVal;
        }
        $e.val(newVal);
      });
      $cartComponent.removeClass('js-mv78-cart-in-cart');
    }

    if (typeof $dontShowMessageInput !== 'undefined' && $dontShowMessageInput.length) {
      $dontShowMessageInput.remove();
    }
  }

  $cartComponent.trigger('changeAmount');
}

/**
 * Инициализация компонентов на странице
 */
function initMV78CartComponents() {
  $('.js-mv78-cart').each(function() {
    let $cartComponent = $(this);
    let $counterInput = $cartComponent.find('.mv78-cart-counter__amount');

    // Инициализация фильтра для счетчика
    $counterInput.each(function() {
      const $this = $(this);
      const minVal = parseFloat($this.attr('data-min'));

      let regexp = /(^$)|(^(0|[1-9][0-9]{0,})$)/;
      if ($this.closest('.mv78-cart-counter_type_fractional').length) {
        regexp = /(^$)|(^((0|[1-9][0-9]{0,})(\.[0-9]{0,2}){0,1})$)/;
      }

      const filter = function(value) {
        let floatVal = parseFloat(value);
        let condition = !isNaN(floatVal) && regexp.test(value);

        if (!isNaN(minVal)) {
          condition = condition && floatVal >= minVal;
        }
        return condition;
      };

      // Применяем фильтр если функция доступна
      if (typeof $this.inputFilter === 'function') {
        $this.inputFilter(filter);
        $this.inputFilter(
          function(value) {
            return regexp.test(value);
          },
          { event: 'input' }
        );
      }
    });
  });
}

/**
 * Настройка callbacks для miniShop2
 */
function setupMiniShop2Callbacks() {
  // Callback успешного добавления в корзину
  const originalAddSuccess = miniShop2.Callbacks.Cart.add.response.success;
  miniShop2.Callbacks.Cart.add.response.success = function(response) {
    if (response.success) {
      // Вызываем оригинальный callback
      if (typeof originalAddSuccess === 'function') {
        originalAddSuccess.call(this, response);
      }
    }
  };

  // Callback успешного изменения в корзине
  const originalChangeSuccess = miniShop2.Callbacks.Cart.change.response.success;
  miniShop2.Callbacks.Cart.change.response.success = function(response) {
    if (response.success) {
      // Вызываем оригинальный callback
      if (typeof originalChangeSuccess === 'function') {
        originalChangeSuccess.call(this, response);
      }
    }
  };

  // Callback успешного удаления из корзины
  const originalRemoveSuccess = miniShop2.Callbacks.Cart.remove.response.success;
  miniShop2.Callbacks.Cart.remove.response.success = function(response) {
    if (response.success) {
      // Вызываем оригинальный callback
      if (typeof originalRemoveSuccess === 'function') {
        originalRemoveSuccess.call(this, response);
      }
    }
  };
}

