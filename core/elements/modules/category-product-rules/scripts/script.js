import Swiper from 'swiper';

import { Navigation, Pagination, Scrollbar, Thumbs, Autoplay, } from 'swiper/modules';

Swiper.use([Navigation, Pagination, Scrollbar, Thumbs, Autoplay,]);

class CategoryProductRules {
  constructor() { }
  run() {
    // Находим все элементы с классом 'other-products__slider'
    const otherProductsSliders = document.querySelectorAll(".other-products__slider");
    if (otherProductsSliders.length) {
      // Перебираем каждый найденный элемент и инициализируем слайдер для него
      otherProductsSliders.forEach((sliderContainer) => {
        new Swiper(sliderContainer.querySelector(".swiper-container"), {
          slidesPerView: "auto",
          spaceBetween: 6,
          navigation: {
            prevEl: sliderContainer.querySelector(".swiper-button-prev") || null,
            nextEl: sliderContainer.querySelector(".swiper-button-next") || null,
          },
          breakpoints: {
            768: {
              spaceBetween: 16,
            },
          },
        });
      });
    }
  }
}

const cpr = new CategoryProductRules();
cpr.run();