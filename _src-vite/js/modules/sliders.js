// -------------------------------
// Импорты Swiper
// -------------------------------
import Swiper from 'swiper';
import { Autoplay, Navigation, Scrollbar, Thumbs, Pagination, FreeMode } from 'swiper/modules';

Swiper.use([Navigation, Pagination, Scrollbar, Thumbs, Autoplay,]);




// Галерея на странице товара без перелинковки и с перелинковкой с кнопками
new Swiper(".product-card_type_usual .product-card__gallery-slider, .product-card_type_relinking-btns .product-card__gallery-slider", {
    loop: false,
    slidesPerView: 'auto', // Чтобы размер фоток был как в CSS, делаем auto
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".product-card__gallery-btn_dir_next",
        prevEl: ".product-card__gallery-btn_dir_prev"
    },
});

new Swiper(".photos-of-our-customers", {
    loop: false,
    spaceBetween: 30,
    slidesPerView: 'auto', // Чтобы размер фоток был как в CSS, делаем auto
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    },
});

// Галерея на странице товара с перелинковкой со списками
new Swiper(".product-card_type_relinking-petrovich .product-card__gallery-slider", {
    loop: false,
    spaceBetween: 20,
    slidesPerView: 'auto', // Чтобы размер фоток был как в CSS, делаем auto
    lazy: { loadPrevNext: true },
    direction: 'horizontal',
    navigation: {
        nextEl: ".product-card__gallery-btn_dir_next",
        prevEl: ".product-card__gallery-btn_dir_prev"
    },

    breakpoints: {
        481: {
            direction: 'horizontal',
            spaceBetween: 0,
        }
    }
});


// Галерея на странице товара с перелинковкой со списками
new Swiper(".product-card_type_relinking .product-card__gallery-slider", {
    loop: false,
    spaceBetween: 8,
    slidesPerView: 'auto', // Чтобы размер фоток был как в CSS, делаем auto
    lazy: { loadPrevNext: true },
    direction: 'horizontal',
    navigation: {
        nextEl: ".product-card__gallery-btn_dir_next",
        prevEl: ".product-card__gallery-btn_dir_prev"
    },

    breakpoints: {
        481: {
            direction: 'vertical',
            spaceBetween: 4,
        }
    }
});

// Галерея для карточки фасада с изображениями
new Swiper(".product-card--fasad-images .product-card__gallery-slider", {
    loop: false,
    spaceBetween: 8,
    slidesPerView: 'auto',
    lazy: { loadPrevNext: true },
    direction: 'horizontal',
    freeMode: false,
    watchSlidesProgress: true,
    breakpoints: {
        769: {
            direction: 'horizontal',
            spaceBetween: 8,
        },
        0: {
            direction: 'vertical',
            spaceBetween: 0, // margin-bottom управляется через CSS
        }
    },
    on: {
        click: function (swiper, event) {
            // Обработка клика на слайд уже реализована в funcsProduct.js
            // через обработчик на .product-card__gallery-item
        }
    }
});

// Мобильная галерея на странице товара
export let $productMobileSlider = new Swiper(".product-card__mobile-slider", {
    pagination: {
        el: ".swiper-pagination",
        clickable: true
    },
    loop: false,
    slidesPerView: 'auto',
    centeredSlides: 1,
});

// Слайдер с популярными товарами и слайдер на странице сравнения
let sliderPopCompareSelector = $(".product-slider-1 .swiper-container.product-slider-container").length ? ".product-slider-1 .swiper-container.product-slider-container" : ".product-slider-1 .swiper-container"

let sliderPopCompare = new Swiper(sliderPopCompareSelector, {
    loop: false,
    slidesPerView: "auto",
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".product-slider-1 .swiper-button-next",
        prevEl: ".product-slider-1 .swiper-button-prev"
    },
    scrollbar: { draggable: true, el: ".product-slider-1 .swiper-scrollbar" }
});

// Слайдер с недавно просмотренными товарами
let sliderRecentlyViewed = new Swiper(".product-slider-2 .swiper-container", {
    loop: false,
    slidesPerView: "auto",
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".product-slider-2 .swiper-button-next",
        prevEl: ".product-slider-2 .swiper-button-prev"
    },
    scrollbar: { draggable: true, el: ".product-slider-2 .swiper-scrollbar" }
});

// Слайдер "Распродажа" на новой странице каталога
let sliderSales = new Swiper(".product-slider-3 .swiper-container", {
    loop: false,
    slidesPerView: "auto",
    lazy: { loadPrevNext: true },
    navigation: {
        nextEl: ".product-slider-3 .swiper-button-next",
        prevEl: ".product-slider-3 .swiper-button-prev"
    },
    scrollbar: { draggable: true, el: ".product-slider-3 .swiper-scrollbar" }
});

// Слайдер с тегами. Скролл для навигации
new Swiper(".listing__tags.navigation-scroll", {
    slidesPerView: "auto",
    freeMode: true,
    scrollbar: {
        draggable: true,
        el: ".listing__tags .swiper-scrollbar"
    }
});

// Слайдер с тегами. Кнопки для навигации
new Swiper(".listing__tags.navigation-btn", {
    slidesPerView: "auto",
    freeMode: true,
    navigation: {
        nextEl: ".listing__tags .listing__tags__swiper-button-next",
        prevEl: ".listing__tags .listing__tags__swiper-button-prev",
    },
    scrollbar: {
        draggable: true,
    },
});

// О компании
new Swiper(".about-gallery .swiper-container", {
    slidesPerView: 1,
    slidesPerGroup: 1,
    spaceBetween: 20,
    autoHeight: true,
    lazy: { loadPrevNext: true },
    allowTouchMove: false,
    navigation: {
        nextEl: ".about-gallery .swiper-button-next",
        prevEl: ".about-gallery .swiper-button-prev"
    },
    breakpoints: {
        1201: {
            slidesPerView: 4,
            slidesPerGroup: 4,
            spaceBetween: 20,
        },
        601: {
            slidesPerView: 3,
            slidesPerGroup: 3,
            spaceBetween: 20,
        },
        481: {
            slidesPerView: 2,
            slidesPerGroup: 2,
            spaceBetween: 20,
        }
    }
});



// Слайдер на странице шоу-рума
new Swiper(".showroom-swiper", {
    loop: false,
    slidesPerView: 1,
    spaceBetween: 10,
    lazy: { loadPrevNext: true },
    observer: true,
    observeParents: true,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true
    },
    scrollbar: { draggable: true, el: ".swiper-scrollbar" },
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
            slidesPerView: 2,
        }
    }
});



// Слайдер баннера на главных
const bigBannerSlider = new Swiper(".banner-slider__big", {
    loop: true,
    slidesPerView: 1,
    autoplay: {
        delay: 5000,
    },
    navigation: {
        nextEl: ".banner-slider__big .swiper-button-next",
        prevEl: ".banner-slider__big .swiper-button-prev"
    },
    pagination: {
        el: ".banner-slider__big .swiper-pagination",
        clickable: true
    },
});

// Проверяем условие и выключаем автоплей
if ($('body[data-ctx="kirpich-m"]').length) {
    bigBannerSlider.autoplay.stop();
}



// ---------------------------------------
// Исправление одного бага на мобилках для слайдеров с товарами.
//
// Подробнее о баге см. скриншот:
// _dev/screenshots/photo_2022-05-26_17-55-36.jpg
// ---------------------------------------
$(sliderPopCompare, sliderRecentlyViewed, sliderSales).each(function (i, e) {
    if (e.slides) {
        e.on('slideChange', setZIndexToSlides);
        setZIndexToSlides(e);
    }
});

function setZIndexToSlides(slider) {
    let amount = slider.slides.length + 10;

    slider.slides.forEach((slide, index) => {
        slide.style.zIndex = amount - index;
    });
}


// ---------------------------------------
// Слайдер с логотипами партнеров
// ---------------------------------------
let sliderClients = null;

function breakpointChecker() {
    if (window.innerWidth < 1350) {
        sliderClientsEnable();
    } else {
        if (sliderClients !== null) {
            sliderClients.destroy(true, true);
            sliderClients = null;
            // spaceBetween прописывается в style. А если слайдера нет, то и spaceBetween не нужен
            $('.clients__list-img').css('margin-right', '');
        }
    }

    if (window.innerWidth >= 500) {
        // На 500 slidesPerView устанавливается как auto. Это значит, что ширина больше не задается через JS. Но она и не сбрасывается. Видимо, так написан swiper.js. Возможно, есть способ настроить плагин так, чтобы ширина сбрасывалась. Но я пока этот способ не знаю.
        $('.clients__list-img').css('width', '');
    }
}

function sliderClientsEnable() {
    if (sliderClients === null) {
        sliderClients = new Swiper(".clients__list", {
            loop: false,
            lazy: { loadPrevNext: true },
            spaceBetween: 30,
            navigation: { nextEl: ".clients__list .swiper-button-next", prevEl: ".clients__list .swiper-button-prev" },
            breakpoints: {
                300: { spaceBetween: 30, slidesPerView: 1 },
                400: { slidesPerView: 2, spaceBetween: 10 },
                500: { slidesPerView: 'auto' }
            },

            // Если убрать эти строки, то при загрузке страницы стрелки слайдера будут неактивны, т.к. картинки подгружаются через lazyload, а ширина слайдов зависит от картинок. Если картинок нет, то и ширина нулевая. А это значит, что и стрелки не нужны, чтобы листать слайды.
            // Подробнее: https://stackoverflow.com/questions/43770106/swiper-slider-not-working-unless-page-is-resized
            observer: true,
            observeParents: true
        });
    }
}

$(window).on('resize', function () {
    breakpointChecker();
});
breakpointChecker();


// ---------------------------------------
// Запрет выделения при двойном клике по кнопкам слайдера 
// ---------------------------------------
$('.swiper-buttons > *').on('mousedown', function (e) {
    e.preventDefault();
});


// Галерея MV78 с основным слайдером и превьюшками
function initMv78Gallery() {
    const galleryContainers = document.querySelectorAll('.product-gallery-mv78');

    galleryContainers.forEach((container) => {
        const mainSlider = container.querySelector('.product-gallery-mv78__main-slider');
        const thumbsSlider = container.querySelector('.product-gallery-mv78__thumbs-slider');

        if (!mainSlider) return;

        // Проверяем количество слайдов
        const mainSlides = mainSlider.querySelectorAll('.swiper-slide');
        const hasMultipleImages = mainSlides.length > 1;

        let thumbsSwiper = null;

        // Инициализируем слайдер превьюшек, только если есть несколько изображений
        if (thumbsSlider && hasMultipleImages) {
            const thumbSlides = thumbsSlider.querySelectorAll('.swiper-slide');
            if (thumbSlides.length > 1) {
                thumbsSwiper = new Swiper(thumbsSlider, {
                    spaceBetween: 9,
                    slidesPerView: 'auto',
                    freeMode: true,
                    watchSlidesProgress: true,
                    breakpoints: {
                        0: {
                            spaceBetween: 9,
                        }
                    }
                });
            }
        }

        // Инициализируем основной слайдер только если есть несколько изображений
        if (hasMultipleImages) {
            const mainSwiper = new Swiper(mainSlider, {
                spaceBetween: 0,
                slidesPerView: 1,
                loop: false,
                lazy: {
                    loadPrevNext: true,
                },
                thumbs: thumbsSwiper ? {
                    swiper: thumbsSwiper
                } : undefined,
                on: {
                    slideChange: function (swiper) {
                        // Обновляем активный класс на превьюшках
                        if (thumbsSlider) {
                            const thumbSlides = thumbsSlider.querySelectorAll('.product-gallery-mv78__thumb-slide');
                            thumbSlides.forEach((thumb, index) => {
                                if (index === swiper.activeIndex) {
                                    thumb.classList.add('active');
                                } else {
                                    thumb.classList.remove('active');
                                }
                            });
                        }
                    }
                }
            });

            // Обработка кликов на превьюшки
            if (thumbsSlider) {
                const thumbSlides = thumbsSlider.querySelectorAll('.product-gallery-mv78__thumb-slide');
                thumbSlides.forEach((thumb, index) => {
                    thumb.addEventListener('click', () => {
                        mainSwiper.slideTo(index);
                    });
                });
            }
        }
    });
}

// Инициализируем при загрузке DOM
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMv78Gallery);
} else {
    initMv78Gallery();
}

export default {
    $productMobileSlider,
    initMv78Gallery,
};
