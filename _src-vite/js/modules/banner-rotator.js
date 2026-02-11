/**
 * Баннер-ротатор для каталога
 * Автоматическая смена баннеров каждые 10 секунд
 * Использует Swiper для управления слайдами
 */

import Swiper from 'swiper';
import { Autoplay, EffectFade, Pagination } from 'swiper/modules';


function init() {
    const rotators = document.querySelectorAll('.banner-rotator');

    rotators.forEach(rotator => {
        // Подготовка структуры: создаем wrapper для слайдов
        const slides = rotator.querySelectorAll('.banner-rotator__slide');
        const dots = rotator.querySelector('.banner-rotator__dots');

        if (slides.length === 0) return;

        // Создаем wrapper, если его еще нет
        let wrapper = rotator.querySelector('.swiper-wrapper');
        if (!wrapper) {
            wrapper = document.createElement('div');
            wrapper.className = 'swiper-wrapper';

            // Переносим слайды в wrapper и добавляем класс swiper-slide
            slides.forEach(slide => {
                slide.classList.add('swiper-slide');
                wrapper.appendChild(slide);
            });

            // Вставляем wrapper перед точками (если есть) или в конец
            if (dots) {
                rotator.insertBefore(wrapper, dots);
            } else {
                rotator.appendChild(wrapper);
            }
        }

        // Преобразуем dots в стандартный контейнер пагинации
        if (dots) {
            dots.classList.add('swiper-pagination');
        }

        // Инициализируем Swiper
        const swiperInstance = new Swiper(rotator, {
            modules: [Autoplay, Pagination, EffectFade],

            // Настройки слайдов
            slidesPerView: 1,
            speed: 500,
            effect: 'fade',
            fadeEffect: {
                crossFade: true
            },

            // Автоплей с задержкой 5 секунд
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },

            // Пагинация (точки)
            pagination: {
                el: dots || '.swiper-pagination',
                clickable: true,
                bulletClass: 'banner-rotator__dot',
                bulletActiveClass: 'active',
            },

            // Кастомный класс для активного слайда
            slideActiveClass: 'active',
        });

        // Ручная пауза при наведении
        rotator.addEventListener('mouseenter', () => {
            if (swiperInstance.autoplay) {
                swiperInstance.autoplay.stop();
            }
        });

        rotator.addEventListener('mouseleave', () => {
            if (swiperInstance.autoplay) {
                swiperInstance.autoplay.start();
            }
        });
    });
}

// Инициализация всех баннер-ротаторов на странице
document.addEventListener('DOMContentLoaded', function () {
    init();
});
$(document).ajaxSuccess(function (event, xhr, settings) {
    init();
});

export default Swiper;

