import { Fancybox } from "@fancyapps/ui/dist/fancybox/";

// -------------------------------
// Импорты Swiper
// -------------------------------
import Swiper from 'swiper';
import { Autoplay, Navigation, Scrollbar, Thumbs, Pagination, FreeMode } from 'swiper/modules';

// CSS
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css/scrollbar';
import 'swiper/css/thumbs';
// import 'animate.css';

import $ from 'jquery';
import Inputmask from 'inputmask';
import LazyLoad from 'vanilla-lazyload';
import Cookies from 'js-cookie';
import '@fancyapps/fancybox/dist/jquery.fancybox.min.css';
import '@fancyapps/fancybox/dist/jquery.fancybox.min.js';

// -------------------------------
// Примеры слайдеров
// -------------------------------

// Галерея на странице товара без перелинковки и с кнопками
new Swiper(".product-card_type_usual .product-card__gallery-slider, .product-card_type_relinking-btns .product-card__gallery-slider", {
    modules: [Navigation],
    loop: false,
    slidesPerView: 'auto',
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".product-card__gallery-btn_dir_next",
        prevEl: ".product-card__gallery-btn_dir_prev"
    },
});

// Слайдер с фото клиентов
new Swiper(".photos-of-our-customers", {
    modules: [Navigation],
    loop: false,
    spaceBetween: 30,
    slidesPerView: 'auto',
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    },
});

// Галерея на странице товара с перелинковкой со списками
new Swiper(".product-card_type_relinking-petrovich .product-card__gallery-slider", {
    modules: [Navigation],
    loop: false,
    spaceBetween: 20,
    slidesPerView: 'auto',
    direction: 'horizontal',
    navigation: {
        nextEl: ".product-card__gallery-btn_dir_next",
        prevEl: ".product-card__gallery-btn_dir_prev"
    },
    breakpoints: {
        481: { direction: 'horizontal', spaceBetween: 0 }
    }
});

// Галерея с перелинковкой
new Swiper(".product-card_type_relinking .product-card__gallery-slider", {
    modules: [Navigation],
    loop: false,
    spaceBetween: 8,
    slidesPerView: 'auto',
    direction: 'horizontal',
    navigation: {
        nextEl: ".product-card__gallery-btn_dir_next",
        prevEl: ".product-card__gallery-btn_dir_prev"
    },
    breakpoints: {
        481: { direction: 'vertical', spaceBetween: 4 }
    }
});

// Галерея карточки фасада
new Swiper(".product-card--fasad-images .product-card__gallery-slider", {
    modules: [Thumbs],
    loop: false,
    spaceBetween: 8,
    slidesPerView: 'auto',
    direction: 'horizontal',
    freeMode: false,
    watchSlidesProgress: true,
    breakpoints: {
        769: { direction: 'horizontal', spaceBetween: 8 },
        0: { direction: 'vertical', spaceBetween: 0 },
    },
});

// Мобильная галерея
export const $productMobileSlider = new Swiper(".product-card__mobile-slider", {
    modules: [Pagination],
    pagination: { el: ".swiper-pagination", clickable: true },
    loop: false,
    slidesPerView: 'auto',
    centeredSlides: 1,
});


// Инициализация Fancybox для элементов с data-fancybox
// $('[data-fancybox]').fancybox();

Fancybox.bind('[data-fancybox]', {
    loop: true,
    Toolbar: true,
    Thumbs: false
});

// -------------------------------
// Inputmask
// -------------------------------
const inputs = document.querySelectorAll('input[data-mask]');
Inputmask().mask(inputs);

// -------------------------------
// LazyLoad
// -------------------------------
const lazyLoadInstance = new LazyLoad({ elements_selector: ".lazy" });

// -------------------------------
// Пример cookie
// -------------------------------
Cookies.set('user', 'JohnDoe', { expires: 7 });

// -------------------------------
// Init MV78 gallery
// -------------------------------
export function initMv78Gallery() {
    const galleryContainers = document.querySelectorAll('.product-gallery-mv78');

    galleryContainers.forEach(container => {
        const mainSlider = container.querySelector('.product-gallery-mv78__main-slider');
        const thumbsSlider = container.querySelector('.product-gallery-mv78__thumbs-slider');
        if (!mainSlider) return;

        let thumbsSwiper = null;

        if (thumbsSlider) {
            thumbsSwiper = new Swiper(thumbsSlider, {
                modules: [FreeMode, Thumbs],
                spaceBetween: 9,
                slidesPerView: 'auto',
                freeMode: true,
                watchSlidesProgress: true,
            });
        }

        new Swiper(mainSlider, {
            modules: [Thumbs],
            spaceBetween: 0,
            slidesPerView: 1,
            loop: false,
            lazy: { loadPrevNext: true },
            thumbs: thumbsSwiper ? { swiper: thumbsSwiper } : undefined,
        });
    });
}

// -------------------------------
// Автоинициализация при DOMContentLoaded
// -------------------------------
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMv78Gallery);
} else {
    initMv78Gallery();
}
