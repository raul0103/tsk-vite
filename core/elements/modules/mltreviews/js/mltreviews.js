import Swiper from 'swiper';

import { Navigation, Thumbs, Autoplay, } from 'swiper/modules';

Swiper.use([Navigation, Thumbs, Autoplay,]);

class MltReviews_front {
  constructor(config = {}) {
    const defaultConfig = {
      slideSource: '.sect-otzyvy__slide-source',
      sliderContainer: '.sect-otzyvy__slider', //Там, где слайды
      tabs: '.sect-otzyvy__tabs',
      tabButton: '.sect-otzyvy__tab-button',
      activeButton: '.sect-otzyvy__tab-button.active',
      swiperContainer: '.sect-otzyvy .swiper-container', //Там где контейнер со слайдами и элементы управления
      nextEl: '.sect-otzyvy .swiper-button-next', //кнопки навигации слайдера
      prevEl: '.sect-otzyvy .swiper-button-prev',
    }
    this.config = Object.assign({}, defaultConfig, config);
    const sources = body.querySelectorAll(this.config.slideSource);
    if (sources.length < 1) throw "Sources aren't exist";
    this.sourceMap = new Map();
    for (const src of sources) {
      this.sourceMap.set(src.dataset.source, src);
    }

    const host = this;
    this.onClickHandler = function (e) {
      host.tabOnClick(e, this);
    }

    this.tabs = body.querySelector(this.config.tabs);
    this.btns = this.tabs.querySelectorAll(this.config.tabButton);
    if (this.btns.length < 1) throw "Buttons aren't exist";
    this.sliderContainer = body.querySelector(this.config.sliderContainer);
  }

  initSlider() {
    // Слайдер с отзывами
    this.swiper = new Swiper(this.config.swiperContainer, {
      loop: false,
      slidesPerView: 1,
      spaceBetween: 20,
      lazy: { loadPrevNext: true },
      observer: true,
      observeParents: true,
      navigation: {
        nextEl: this.config.nextEl,
        prevEl: this.config.prevEl
      },
      /*pagination: {
          el: ".sect-otzyvy .swiper-pagination",
          clickable: true
      },*/
      /*scrollbar: {draggable: true, el: ".sect-otzyvy .swiper-scrollbar"},*/
      breakpoints: {
        1201: {
          slidesPerView: 4,
        },
        768: {
          slidesPerView: 3,
        },
        500: {
          slidesPerView: 2,
        },
        400: {
          slidesPerView: 1,
        }
      }
    });
  }

  initTabs() {
    for (const btn of this.btns) {
      btn.removeEventListener('click', this.onClickHandler); //предотвратит повторное назначение обработчиков на одних и тех же элементах при повторном вызове функции
      btn.addEventListener('click', this.onClickHandler);
    }
  }

  tabOnClick(e, obj) {
    e.preventDefault();
    e.stopPropagation();
    //console.log(obj);
    //console.log(e.target);
    const el = this.sourceMap.get(obj.dataset.source);
    //Это все нужно для сохранения обработчиков событий на карточках отзывов
    const prevActiveTab = this.tabs.querySelector(this.config.activeButton);
    const prevSource = prevActiveTab.dataset.source;
    const prevSourceCntr = this.sourceMap.get(prevSource);
    if (prevSourceCntr.children.length == 0) { //Переместить активный набор элементов обратно в контейнер, если контейнер пуст, т. к. при инициализации в слайдере будет лишняя копия
      prevSourceCntr.replaceChildren(...this.sliderContainer.children);
    }
    this.sliderContainer.replaceChildren(...el.children);
    for (const btn of this.btns) {
      btn.classList.remove('active');
    }
    obj.classList.add('active');
  }

  bind() {
    this.initSlider();
    this.initTabs();
  }
}

export {
  MltReviews_front
}