import "@/sass/main.sass"
import "@/scss/main.scss"

import "@fancyapps/ui/dist/fancybox/fancybox.css";

// import "@fancyapps/fancybox/dist/jquery.fancybox.css"; // CSS для Fancybox

// import '@fancyapps/fancybox/dist/jquery.fancybox.min.css';
// import 'swiper/swiper-bundle.min.css';
// import 'animate.css';

// JS
// import 'swiper/css';           // базовый CSS
// import 'swiper/css/navigation'; // если используешь стрелки
// import 'swiper/css/pagination'; // если используешь пагинацию


// -------------------------------------
// Библиотеки (в основном из node_modules)
// -------------------------------------
import Inputmask from 'inputmask';
import LazyLoad from "vanilla-lazyload";
import '@fancyapps/fancybox';

//import ImageZoom from 'js-image-zoom';
import '@/js/libs/euv_custom_select/js/euv_custom_select';
import '@/js/libs/Drog.js/Drog.js';
import '@/js/libs/inputFilter/inputFilter.js';
//import Cookies from 'js-cookie';


// -------------------------------------
// Самописные модули на JS
// -------------------------------------
import '@/js/modules/pkt_calc.js'
import '@/js/modules/sliders.js';
import '@/js/modules/banner-rotator.js';
import '@/js/modules/toggles-fasad.js';
import '@/js/modules/anchor_scroll';
import '@/js/modules/article_table_wrap_container';
import '@/js/modules/createMenu';

import initOpened from '@/js/modules/opened.js';
import initTabs from '@/js/modules/tabs.js';
import mailChange from '@/js/modules/mailchanger';
import initDistrictsMap from '@/js/modules/districts_map';
import mapsLazyload from '@/js/modules/lazyload_maps';
import youtubePlayer from '@/js/modules/youtube_player';
// import add_cover_to_map from '@/js/modules/maps';
import shadowMap from '@/js/modules/shadow_map';
import FastSearch from '@/js/modules/fast_search';
import ArticleFavorite from '@/js/modules/article_favorites';
import ArticleLike from '@/js/modules/article_likes'
import MenuNewV2 from '@/js/modules/menu_new.js';
import TabHide from '@/js/modules/TabHide.js';
import MenuTabs from '@/js/modules/MenuTabs.js';
import MenuV4 from '@/js/modules/MenuV4.js';
import Instructions from '@/js/modules/instructions.js';
import collapseLongTexts from '@/js/modules/collapseLontTexts.js';
import showMoreListing from '@/js/modules/showMoreListing.js';
import initStockForm from '@/js/modules/stock_form.js';
import '@/js/modules/popup-order-delivery.js';

import '../../core/elements/modules/listing-gallery/scripts/script.js'
import HeaderMenuMobile from '../../core/elements/modules/header-menu-mobile/scripts/HeaderMenuMobile.js'
import AdditionalFieldsCallbackForm from '../../core/elements/modules/additional-fields-callback-form/scripts/main.js'
import CityChanger from '../../core/elements/modules/city-changer/scripts/CityChanger.js'
import { MltReviews_front } from '../../core/elements/modules/mltreviews/js/mltreviews.js'
import { ReviewsPopup } from '../../core/elements/modules/reviews-popup/js/reviews-popup.js'
import { CatalogSideBanner } from '../../core/elements/modules/catalog-side-banner/js/catalog-side-banner.js'

import "../../core/elements/modules/customer-photos/js/main.js";
import '../../core/elements/modules/warehoses/script/warehouses.js';
import '../../core/elements/modules/similar-tabs-products/scripts/index.js';
import "../../core/elements/modules/category-product-rules/scripts/script";
import '../../core/elements/modules/stocks/js/warehouse-search.js';
import "@/js/modules/metric_click"
import mv78Cart from '../../core/elements/modules/product-page/scripts/mv78-cart.js';

// -------------------------------------
// Импорт функций на JQuery
// -------------------------------------
import modxJS from '@/js/functions/modxJS';
import functions from '@/js/functions/';
import funcsProduct from '@/js/functions/funcsProduct.js';
import funcsCatalog from '@/js/functions/funcsCatalog.js';
import funcsFavAndComp from '@/js/functions/funcsFavAndComp';

// import fortwheel from "@/js/modules/fortwheel";

import { DeliveryCalculatorServiceAreas } from '../../core/elements/modules/deliveryCalculatorServiceAreas/js/index'

// -------------------------------------
// Основной код файла
// -------------------------------------
// Замена сообщения о ненайденных результатах на странице каталога. Другого способа разделить сообщения mFilter2 и mSearch2, который не сбросится при обновлении / переустановке плагина, я не нашел. Код написан вверху и без jQuery, чтобы работать быстрее.
let elem = document.querySelector('.listing__content .msearch2message');
if (elem !== null) {
  elem.innerHTML = 'Подходящих результатов не найдено.';
}

try {
  const reviews = new MltReviews_front();
  reviews.bind();
} catch (t) {
}


try {
  const reviewsPopup = new ReviewsPopup({
    container: '.js-reviews-popup',
    close: '.js-reviews-popup__close',
    timeout: 5000
  });
  reviewsPopup?.bind();
} catch (t) {
  //console.error("ReviewsPopup failed");
  //console.error(t);
}

try {
  const catalogSideBanner = new CatalogSideBanner();
  catalogSideBanner.run();
} catch (t) {
  console.log(t);
}


// $.fancybox.defaults.backFocus = false;

jQuery(function ($) {

  // Динамическая подгрузка "Скачать PDF"
  const pdfButtons = document.querySelectorAll(".js-create-pdf");
  if (pdfButtons.length > 0) {
    pdfButtons.forEach((button) => {
      button.addEventListener("click", async (e) => {
        e.preventDefault();

        // ⬇️ динамический импорт с правильным относительным путём
        const module = await import('../../core/elements/modules/createPdf/js/createPdf.js');

        // вызываем функцию
        await module.createPdf();
      });
    });
  }


  collapseLongTexts();
  showMoreListing();
  // Переменная инициадизируется в шаблоне elements/layouts/default.layout.tpl
  // if(window.SHOW_FORTWHEEL && window.innerWidth > 768){
  //     try{
  //         if(jQuery("body").data("ctx") != "fasad"){
  //             fortwheel();
  //         }
  //     }catch{
  //         console.error('Ошибка модуля fortwheel')
  //     }
  // }


  // --------------------------------
  // Добавление дублирующихся заголовков в fancybox через JS, чтобы поисковики не видели их
  // --------------------------------
  jQuery('#cost-fanera, #callback, #cost-delivery').find('.form__title').text('Оставьте свои контакты ниже');


  // --------------------------------
  // Копируем форму для шапки
  // --------------------------------
  // Это необходимо, т.к. после форм выдается сообщение об успешной отправке, которое не дает отправить форму еще раз. Форма в шапке такая же, как форма обратного звонка. Если ее отправить, то нельзя будет отправить форму обратного звонка. Чтобы это исправить, надо скопировать форму для шапки
  let $popupCallback = jQuery('#callback');
  $popupCallback.clone().insertAfter($popupCallback).attr('id', 'header-callback');


  // --------------------------------
  // Основные установки
  // --------------------------------
  // id для целей Яндекс.Метрики
  const yandexMetrikaId = getYandexMetrikaId();

  // Lazyload для картинок
  let lazyLoadInstance = new LazyLoad();

  // Код с обработчиками MODX
  modxJS(lazyLoadInstance, yandexMetrikaId);

  // Inputmask для ввода номера телефона
  let im = new Inputmask("+7 (999) 999-99-9{2,3}");
  im.mask(document.querySelectorAll('input[name="PHONE"]'));

  // Инициализация табов
  initTabs();

  // Инициализация формы товаров под запрос
  initStockForm();

  // Инициализация быстрого поиска
  new FastSearch();

  MenuNewV2();//Новое меню
  Instructions();
  // -------------------------------------
  // Функции страниц на JQuery
  // -------------------------------------
  // Функции для каталога
  funcsCatalog.init();

  // Функции для карточки товара
  funcsProduct.init(yandexMetrikaId);

  // Функции для избранного и сравнения
  funcsFavAndComp.init();

  // Инициализация компонента корзины MV78
  mv78Cart.init();

  // Инициализация модалки для выбора города
  try {
    let city_changer = new CityChanger()
    city_changer.init()
  } catch (err) {
    console.error('Ошибка модуля CityChanger: ' + err);
  }


  try {
    new TabHide().init()
  } catch (err) {
    console.error('Ошибка модуля TabHide: ' + err);
  }

  try {
    new MenuTabs().init()
  } catch (err) {
    console.error('Ошибка модуля MenuTabs: ' + err);
  }

  try {
    new MenuV4().init()
  } catch (err) {
    console.error('Ошибка модуля MenuV4: ' + err);
  }

  // -------------------------------
  // Меню на ПК
  // -------------------------------
  jQuery('.header__catalog').on('click', function (e) {
    let $target = jQuery(e.target);
    if (!$target.closest('.header__catalog-menu').length) {
      jQuery(this).toggleClass('hover');
    }
  });

  jQuery(document).on('click', function (e) {
    let $target = jQuery(e.target);

    if (!$target.hasClass('header__catalog') && !$target.closest('.header__catalog').length) {
      jQuery('.header__catalog.hover').removeClass('hover');
    }
  });


  // -------------------------------
  // Меню на мобилках
  // -------------------------------
  jQuery('.header__mobile-menu-link').on('click', function (e) {
    e.preventDefault();

    let $this = jQuery(this);
    let $headerNav = $this.closest('.header__nav-contents-wrap');

    $headerNav.addClass('fade');
    setTimeout(function () {
      $this.closest('.header__nav-content.active').removeClass('active');
      $this.closest('.header__nav-contents-wrap').find('.header__nav-content[data-key="' + $this.attr('data-key') + '"]').addClass('active');
      $headerNav.removeClass('fade');
    }, 300);
  });


  // -------------------------------
  // Запрет прокрутки карты до клика
  // -------------------------------
  // let $map_containers = jQuery('.map__container');
  // $map_containers.each((idx, map_container) => {
  //     add_cover_to_map(map_container);
  // });
  shadowMap('.map__container');


  // -------------------------------
  // Вкладки
  // -------------------------------
  jQuery('.js-tabs').each(function () {
    let $this = jQuery(this);
    let $headers = $this.find('.js-tabs-header');
    $headers.on('click', function (e) {
      e.preventDefault();
      $this.find('.js-tabs-content, .js-tabs-header').removeClass('active');

      let $header = jQuery(this);
      $header.addClass('active');
      let tab = $header.attr('data-tab');
      $this.find('.js-tabs-content[data-tab="' + tab + '"]').addClass('active');
    });
  });


  // -------------------------------
  // Скрыть / показать кнопки слайдера
  // -------------------------------
  jQuery('.swiper-buttons').each(function () {
    let $this = jQuery(this);
    let $sliders = jQuery(this).parent().find('.swiper-wrapper').find('.swiper-slide');
    if ($sliders.length > 4) {
      $this.show();
    }
  });


  // -------------------------------
  // Яндекс карты
  // -------------------------------
  window.initDistrictsMap = initDistrictsMap;
  mapsLazyload();


  // -------------------------------
  // Подмена Email'а
  // -------------------------------
  mailChange();


  // -------------------------------
  // Меню
  // -------------------------------
  // На ПК
  // jQuery('.header__catalog').on('click', function(e) {
  //     e.preventDefault();
  //     jQuery(this).toggleClass('opened');
  // });
  jQuery(document).on("click", function (e) {

    // Проверяем, является ли элемент "header__nav" открытым
    if (jQuery(".header__nav").hasClass("opened")) {
      // Проверяем, является ли цель клика элементом "header__nav" или его дочерним элементом
      if (!jQuery(e.target).closest(".header__nav").length) {
        // Проверяем, если клик был не по элементу ".js-catalog-burder"
        if (!jQuery(e.target).hasClass("js-catalog-burder") && !jQuery(e.target).closest(".js-catalog-burder").length) {
          // Если клик был вне элемента "header__nav" и не по ".js-catalog-burder", убираем класс "opened"
          jQuery(".header__nav").removeClass("opened");
          jQuery(".js-catalog-burder").removeClass("opened");
          jQuery('body').removeClass('freeze-page');
        }
      }
    }
  });

  // На телефонах
  jQuery('.js-catalog-burder').on('click', function (e) {
    e.preventDefault();



    let $this = jQuery(this);

    // Если есть у кнопки аттрибут data-active-catalog, тогда откроется сразу меню каталога
    if ($this.attr('data-active-catalog')) {
      jQuery('.header__nav-content.active').removeClass('active')
      jQuery('.header__nav-content[data-key="catalog"]').addClass('active')
    }

    $this.toggleClass('opened');
    $this.closest('.header__wrapper').find('.header__nav').toggleClass('opened');
    jQuery('body').toggleClass('freeze-page');
  });


  // -------------------------------
  // Звездочки во всплывашке для рейтинга
  // -------------------------------
  jQuery('.popup-reviews__stars svg').on('click', function (e) {
    e.preventDefault();

    jQuery('.popup-reviews__stars svg').removeClass('active');

    let $this = jQuery(this);
    $this.addClass('active');
  });


  // -------------------------------
  // faq
  // -------------------------------
  jQuery('.questions__item-top').on('click', function (e) {
    e.preventDefault();
    jQuery(this).parent().toggleClass('active');
  });

  jQuery('.questions__btn-more').on('click', function (e) {
    e.preventDefault();
    const $this = jQuery(this);
    $this.parent().find('.questions__list-hidden').slideToggle();
    $this.remove();
  });


  // -------------------------------
  // Новый блок с ассортиментом товаров
  // -------------------------------
  let $assort = jQuery('.assort');
  if ($assort.length) {
    // Основные переменные и константы
    const sidebar = 1;
    const content = 2;
    let $backBtnText = $assort.find('.assort__back-text');

    // Вспомогательная функция для анимации при переключении табов
    function toggleClasses(classConst, oldHeight) {
      // Завершаем предыдущую анимацию (если она выполняется)
      $assort.finish();
      switch (classConst) {
        case sidebar:
          $assort.removeClass('assort_active_content').addClass('assort_active_sidebar');
          break;
        case content:
          $assort.removeClass('assort_active_sidebar').addClass('assort_active_content');
          break;
      }
      let newHeight = $assort.height();
      $assort.height(oldHeight);
      $assort.animate({
        'height': newHeight
      }, 300, function () {
        $assort.css('height', '');
      });
    }

    $assort.find('.assort__sidebar-item').on('click', function (e) {
      e.preventDefault();
      let $this = jQuery(this);

      if ($this.hasClass('active') && window.innerWidth > 500) {
        return;
      }

      let oldHeight = $assort.height();
      $assort.find('.active.assort__sidebar-item, .active.assort__content-wrap').removeClass('active');
      $this.addClass('active');
      $assort.find('.assort__content-wrap[data-tab="' + $this.attr('data-tab') + '"]').addClass('active');
      toggleClasses(content, oldHeight);
      $backBtnText.text($this.text());
    });

    $assort.find('.assort__back').on('click', function (e) {
      e.preventDefault();
      toggleClasses(sidebar, $assort.height());
      $backBtnText.text('');
    });
  }


  // -------------------------------
  // Скрывание / раскрывание по клику
  // -------------------------------
  document.querySelectorAll("[data-dropdown]").forEach((function (e) {
    if (e.getAttribute("data-dropdown")) {
      Array.from(document.querySelectorAll(e.getAttribute("data-dropdown"))).forEach((function (e) {
        e.addEventListener("click", (function () {
          e.parentElement.classList.toggle("active");
        }));
      }));
    } else {
      Array.from(e.children).forEach((function (e) {
        e.addEventListener("click", (function () {
          e.classList.toggle("active");
        }));
      }));
    }
  }));


  // -------------------------------------
  // Уменьшение размера h1 на мобилках, если он длинный и переносится на 2 и более строки
  // -------------------------------------
  if (window.innerWidth <= 768) {
    let $h1 = jQuery('.category-header');
    if ($h1.outerHeight() > 30) {
      $h1.css('font-size', 18);
    }
  }


  // --------------------------------
  // Кнопка для скролла вверх
  // --------------------------------
  let $btn = jQuery('.scroll-top');
  jQuery(window).scroll(function () {
    if (jQuery(window).scrollTop() > window.innerHeight) {
      $btn.addClass('active');
    } else {
      $btn.removeClass('active');
    }
  });

  $btn.on('click', function (e) {
    e.preventDefault();
    jQuery('html, body').animate({
      scrollTop: 0
    }, 300);
  });


  // --------------------------------
  // Главная с фильтрами
  // --------------------------------
  let $mainList = jQuery('.sect-mainlist');
  if ($mainList.length) {
    // Если я буду смотреть, каким фильтрам добавлять hidden, когда все фильтры показаны и ширина блока с фильтрами не ограничена, может быть такое, что фильтры перенесутся на след. строку, но будут видны.
    // Если я буду смотреть, каким фильтрам добавлять hidden, когда все фильтры скрыты и ширина блока с фильтрами ограничена, может быть такое, что я нажму кнопку "Показать еще", а фильтры на след. строку не переносятся.
    // Я выбрал второй вариант.
    // TODO. Можно выбрать первый. Строго задать высоту строки. А то, что выходит за нее, будет прятаться (overflow: hidden).

    // Перерасчет фильтров на главной при изменении ширины браузера
    jQuery(window).on('resize', function () {
      recalculateMainlist();
    });

    // Перерасчет фильтров на главной при загрузке страницы
    recalculateMainlist();

    // Щелчок по кнопке для скрытия / показа фильтров
    jQuery('.sect-mainlist__btn-more').on('click', function () {
      // Основные переменные
      let $btn = jQuery(this);
      let $fblockwrap = $btn.closest('.sect-mainlist__fblock-wrap');
      let $fblock = $fblockwrap.find('.sect-mainlist__fblock');

      // Переключение класса для кнопки, от которого будет зависеть, что делать дальше
      $btn.toggleClass('sect-mainlist__btn-more_toggled');
      functions.toggleText($btn, 'data-text');

      recalculateMainlist($fblock);
    });

    /**
     * Перерасчет фильтров
     */
    function recalculateMainlist($fblockArray) {
      let strictReset = false;
      if (typeof $fblockArray === 'undefined') {
        strictReset = true;
        $fblockArray = jQuery('.sect-mainlist__fblock');
      }

      $fblockArray.each(function () {
        // Основные переменные
        let $fblock = jQuery(this);
        let filtersNotFit = false;
        let fblockOffsetTop = $fblock.offset().top;
        let $fblockwrap = $fblock.parent();
        let $btnMore = $fblockwrap.find('.sect-mainlist__btn-more');
        let $filters = $fblock.find('.sect-mainlist__filter');
        let needHideFilters = true;

        // Сбрасываем кнопку "Показать еще" в вид по умолчанию
        if (strictReset && $btnMore.hasClass('sect-mainlist__btn-more_toggled')) {
          functions.toggleText($btnMore, 'data-text');
          $btnMore.toggleClass('sect-mainlist__btn-more_toggled');
          $btnMore.appendTo($fblock);
          needHideFilters = false;
        }
        // Или в вид, соответствующий предназначению кнопки
        else if (!strictReset) {
          if ($btnMore.hasClass('sect-mainlist__btn-more_toggled')) {
            $btnMore.appendTo($fblock);
            needHideFilters = false;
          } else {
            $btnMore.appendTo($fblockwrap);
          }
        }

        // Показываем все фильтры, скрываем кнопку "Показать еще" (т.к. она занимает место), убираем у блока с фильтрами класс, который убирает ограничение по ширине. Все это, чтобы правильно рассчитать, какие фильтры скрыть, а какие оставить
        $filters.removeClass('hidden');
        $btnMore.addClass('hidden');
        $fblock.removeClass('sect-mainlist__fblock_show-filters');

        // Скрываем лишние фильтры
        $filters.each(function () {
          let $fltr = jQuery(this);
          // 2 - на всякий случай, вдруг в каких браузерах будут отображаться чуть ниже / чуть выше
          if (Math.abs($fltr.offset().top - fblockOffsetTop) > 2) {
            if (needHideFilters) {
              $fltr.addClass('hidden');
            }
            if (!filtersNotFit) {
              filtersNotFit = true;
            }
          }
        });

        if (filtersNotFit) {
          $btnMore.removeClass('hidden');
          $fblock.addClass('sect-mainlist__fblock_show-filters');
        }
      });
    }
  }


  // --------------------------------
  // Если на странице есть таблица.table-filter подгрузить module_filter_table
  // --------------------------------
  if (document.querySelector('.content-block table.table-filter')) {
    // Запрещаем перенос строки в ячейках с ценой
    jQuery('.table-filter').each(function () {
      let $table = jQuery(this);
      let index = $table.find('td.no-sort').index();
      if (index === -1) {
        return;
      }
      $table.find('tr').each(function (i) {
        if (i === 0) {
          return;
        }
        let $tr = jQuery(this);
        let $td = $tr.find('td').eq(index);
        if (!$td.length) {
          return;
        }
        $td.css('white-space', 'nowrap');
      });
    });


    // Подгружаем module_filter_table
    let script = document.createElement("script");
    script.type = "text/javascript";
    script.src = '/assets/template/js/module_filter_table.js';
    document.getElementsByTagName("head")[0].appendChild(script);
  }


  // -------------------------------
  // Заменяем div на стилизованный список для адреса
  // -------------------------------
  jQuery('.contacts__item_content_address, .header__contacts-city').each(function () {
    const $this = jQuery(this);
    let listClass, $addressNode;
    switch (true) {
      case $this.is('.header__contacts-city'):
        listClass = 'header__select-address';
        $addressNode = jQuery('.header__contacts-city');
        break;
      case $this.is('.contacts__item_content_address'):
        listClass = 'contacts__select-address';
        $addressNode = $this.find('.contacts__item-value');
        break;
    }
    const $select = jQuery('<select class="' + listClass + ' select-address" name="select-address"></select>').insertAfter($addressNode);

    console.log('$this = ', $this);
    console.log('$addressNode = ', $addressNode);

    for (let i = 1; i < 10; i++) {
      let dataAddress;
      // if (i === 1) {
      //     dataAddress = $addressNode.text();
      // } else {
      //     dataAddress = $addressNode.attr('data-address-' + i);
      // }
      // if (!dataAddress) {
      //     break;
      // }
      // $select.append('<option value="' + i + '">' + dataAddress + '</option>');
      switch (i) {
        case 1: {
          dataAddress = $addressNode.text();
          dataAddress && $select.append('<option value="' + i + '">' + dataAddress + '</option>');
          break;
        }
        case 2: {
          dataAddress = $addressNode.attr('data-address-' + i);
          dataAddress && $select.append('<option value="' + i + '">' + dataAddress + '</option>');
          break;
        }
        default: {
          dataAddress = $addressNode.attr('data-address-' + i);
          dataAddress && $select.append('<option value="' + i + '">' + dataAddress + '</option>');
        }
      }
    }
    $addressNode.remove();
  });


  // -------------------------------
  // Стилизованный список для адреса (есть в шапке и отдельно на странице с контактами)
  // -------------------------------
  jQuery('.select-address')?.euv_custom_select();

  // Перемещаем стрелочку в списке в шапке, чтобы она была сразу после текста
  let $headerSelect = jQuery('div.header__select-address');
  $headerSelect.find('.euv-custom-select__btn').appendTo($headerSelect.find('.euv-custom-select__input'));

  // Задаем ширину списка в шапке равной самому длинному адресу, чтобы при смене адреса не было скачков
  let headerSelectMaxWidth = 0;
  $headerSelect.find('.euv-custom-select__options-wrap .euv-custom-select__option').each(function (i, e) {
    let $e = jQuery(e);
    $e.click();
    let width = $headerSelect.outerWidth();
    if (headerSelectMaxWidth < width) {
      headerSelectMaxWidth = width;
    }
  });
  // Самый длинный адрес нашли, максимальную ширину получили, теперь возвращаем список в значение по умолчанию (кликаем по самому первому значению)
  $headerSelect.find('.euv-custom-select__options-wrap .euv-custom-select__option:first-child').click();
  $headerSelect.width(headerSelectMaxWidth);

  // выбираем верхний адрес в списке на странице контактов
  let $contactsSelect = jQuery('.contacts__item_content_address');
  $contactsSelect.find('.euv-custom-select__options-wrap .euv-custom-select__option:first-child').click();

  // -------------------------------
  // Форма с перезвоном
  // -------------------------------
  const $weekdaycall = jQuery('.weekdaycall');
  if ($weekdaycall.length) {
    const $weekdaycallbg = jQuery('.weekdaycall__bg');
    const $weekdaycallElems = $weekdaycall.add($weekdaycallbg);

    // Показ формы
    let timout = setTimeout(function () {
      $weekdaycallElems.addClass('active');
    }, 50000);

    // Нажатие на шапку
    $weekdaycall.find('.weekdaycall__header').on('click', function () {
      $weekdaycallElems.toggleClass('active');
      clearTimeout(timout);
    });

    // Нажатие на кнопку "Закрыть"
    $weekdaycall.find('.weekdaycall__btn-close').on('click', function () {
      $weekdaycallElems.removeClass('active');
    });

    // Стилизованный список с выбором дня
    $weekdaycall.find('.weekdaycall__select').euv_custom_select();

    // Закрытие всплывашки при нажатии на фон
    $weekdaycallbg.on('click', function (e) {
      $weekdaycallElems.removeClass('active');
    });
  }


  // -------------------------------------------
  // Смена карты при смене адреса на странице с контактами
  // -------------------------------------------
  let $selectAddress = jQuery('select.contacts__select-address');
  if ($selectAddress.length) {
    $selectAddress.on('change', function (e) {
      const $section = jQuery(this).closest('section');
      $section.find('.map__container').hide();
      $section.find('.map__container[data-map="' + $selectAddress.val() + '"]').show();
    });
  }


  // --------------------------------
  // Ленивая загрузка видео
  // --------------------------------
  youtubePlayer();


  // --------------------------------
  // О-компании галерея
  // --------------------------------
  jQuery('.about-gallery__img-wrap').on('click', function (e) {
    e.preventDefault();
    jQuery('.about-gallery__slider-item').eq(0).click();
  });


  // --------------------------------
  // Добавление статей в избранное
  // --------------------------------
  new ArticleFavorite().init();
  new ArticleLike().init();


  // --------------------------------
  // Добавление статей в избранное
  // --------------------------------
  jQuery('.sect-otzyvy__item').on('click', function (e) {
    jQuery('.sect-otzyvy__item-hidden[data-index="' + jQuery(this).attr('data-index') + '"]')[0].click();
  });



  if (jQuery(".tags-calculator__tags").height() > 30) {
    jQuery(".tags-calculator__tags").addClass("hide");
    let $btnShowMore = jQuery(".tags-calculator__show_more");
    $btnShowMore.addClass("active");

    $btnShowMore.click(function () {
      jQuery(".tags-calculator__tags").toggleClass('hide');
      jQuery(this).toggleClass("show");
      if (!jQuery(".tags-calculator__tags").hasClass("hide")) {
        jQuery(this).text("Скрыть все теги");
      } else {
        jQuery(this).text("Все теги");
      }

    })
  }

  /**
   * Скролл сортировки в листинге
   */
  let $stickyElement = jQuery(".js-sticky-sort");
  if ($stickyElement.length && window.innerWidth < 550) {
    let stickyOffset = $stickyElement.offset().top;

    let border_size = 2
    let $placeholder = jQuery('<div class="placeholder"></div>').height($stickyElement.outerHeight() + border_size); // Заглушка, что бы контент страницы не подскакивал
    let isSticky = false;

    let mse2_height = jQuery('#mse2_results').outerHeight() + jQuery('#mse2_results').offset().top
    jQuery(window).scroll(function () {
      let scrollTop = jQuery(window).scrollTop();

      if (scrollTop > stickyOffset - 65 && !isSticky && scrollTop < mse2_height) {
        $stickyElement.addClass("active");
        $stickyElement.after($placeholder.show());
      } else {
        $stickyElement.removeClass("active");
        $placeholder.remove()
        isSticky = false
      }
    });
  }

  /**
   * Скрытие крошек
   */
  let $bcms_more = jQuery(".js-bcms-more");
  if ($bcms_more.length && window.innerWidth < 550) {
    $bcms_more.children().not(":last-child").css({ display: "none" });

    let btn_more = `<li class="bcms-btn-more">
                        <svg class="svg icon-dots" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 16 16" width="16" height="16">
                                <use xlink:href="/assets/template/img/svg-sprite.svg#icon-dots"></use>
                        </svg>
                    </li>`;
    jQuery($bcms_more).on("click", ".bcms-btn-more", function () {
      $bcms_more.children().not(":last-child").css({ display: "block" });
      jQuery(this).remove();
    });
    $bcms_more.prepend(btn_more);
  }

  try {
    new HeaderMenuMobile();
  } catch (e) {
    console.error("Ошибка модуля HeaderMenuMobile", e);
  }

  // Скрыть часть текста в карточке товара на plitaosb
  if (jQuery(".show-all-content").length > 0) {
    jQuery(".show-all-content").click(function () {
      let $contentBlock = jQuery(".content-block");
      $contentBlock.toggleClass("active");
      if ($contentBlock.hasClass("active")) {
        jQuery(this).text("Скрыть");
      } else {
        jQuery(this).text("Читать полностью");
      }
    });
  }


  try {
    new AdditionalFieldsCallbackForm();
  } catch (error) {
    console.error(`Ошибка модуля AdditionalFieldsCallbackForm`, error);
  }

  initOpened()
});


function getYandexMetrikaId() {
  switch (location.host) {
    case 'armatura-178.ru':
      return 87592591;
    case 'asfalt-prof.ru':
      return 87877840;
    case 'fasady-pro.ru':
      return 87550456;
    case 'minvata-178.ru':
      return 86222127;
    case 'kirpich-m.ru':
      return 87468541;
    case 'minvata-78.ru':
      return 86221747;
    case 'krovlyasp.ru':
      return 86936986;
    case 'www-fasad.ru':
      return 88306051;
    case 'minvata-pro.ru':
      return 86222192;
    case 'plity-epps.ru':
      return 86222030;
    case 'pilomat-pro.ru':
      return 87877411;
    case 'plitaosb.ru':
      return 88179338;
    case 'plity-mdvp.ru':
      return 88305740;
    case 'www-minvata.ru':
      return 86220330;
    case 'pro-minvata.ru':
      return 86221954;
    case 'minvata-spb.ru':
      return 86222209;
    case 'pro-fanera.ru':
      return 88180782;
  }
}

try {
  const dc = new DeliveryCalculatorServiceAreas();
  dc.run();
} catch (t) {
  console.error(t);
}


const menuV4 = function () {
  const SELECTOR_BUTTON = '.menu-catalog__item';
  const SELECTOR_CONTENT = '.menu-content';
  const SELECTOR_DATA_ATTRIBUTE = 'data-catalog-item';
  const ACTIVE_CLASS = 'active';

  document.querySelectorAll(SELECTOR_BUTTON).forEach(item => {
    item.addEventListener('click', () => {
      document.querySelectorAll(SELECTOR_BUTTON).forEach(content => {
        content.classList.remove(ACTIVE_CLASS);
      });
      item.classList.add(ACTIVE_CLASS);

      const id = item.getAttribute(SELECTOR_DATA_ATTRIBUTE);

      document.querySelectorAll(SELECTOR_CONTENT).forEach(content => {
        content.classList.remove(ACTIVE_CLASS);
      });
      document.querySelectorAll(SELECTOR_CONTENT)[id].classList.add(ACTIVE_CLASS);
    });
  });
}

try {
  menuV4();
} catch (t) {
  //console.error(t);
}