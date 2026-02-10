/**
 * MV78 Product Gallery Module
 * Инициализация Swiper слайдеров для галереи товаров
 * 
 * @requires Swiper
 */

import Swiper from 'swiper';
import { Navigation, Thumbs, Lazy } from 'swiper/modules';

Swiper.use([Navigation, Thumbs, Lazy]);

/**
 * Инициализация галереи MV78
 * Поддерживает:
 * - Основной слайдер с изображениями
 * - Слайдер с превьюшками
 * - Синхронизацию между слайдерами
 * - Корректное отображение при одном изображении
 */
function initMv78Gallery() {
    const galleryContainers = document.querySelectorAll('.product-gallery-mv78');
    
    galleryContainers.forEach((container) => {
        const mainSlider = container.querySelector('.product-gallery-mv78__main-slider');
        const thumbsSlider = container.querySelector('.product-gallery-mv78__thumbs-slider');
        
        if (!mainSlider) return;
        
        // Проверяем количество слайдов
        const mainSlides = mainSlider.querySelectorAll('.swiper-slide');
        const hasMultipleImages = mainSlides.length > 1;
        
        // Если одно изображение - галерея работает как статичная картинка
        if (!hasMultipleImages) {
            console.log('MV78 Gallery: Single image detected, skipping Swiper initialization');
            return;
        }
        
        let thumbsSwiper = null;
        
        // Инициализируем слайдер превьюшек, только если есть несколько изображений
        if (thumbsSlider && hasMultipleImages) {
            const thumbSlides = thumbsSlider.querySelectorAll('.swiper-slide');
            if (thumbSlides.length > 1) {
                thumbsSwiper = new Swiper(thumbsSlider, {
                    direction: 'vertical', // Вертикальное направление (превьюшки слева)
                    spaceBetween: 9,
                    slidesPerView: 'auto',
                    freeMode: true,
                    watchSlidesProgress: true,
                    slideToClickedSlide: true,
                    breakpoints: {
                        0: {
                            direction: 'vertical',
                            spaceBetween: 9,
                        },
                        768: {
                            direction: 'vertical',
                            spaceBetween: 9,
                        }
                    }
                });
            }
        }
        
        // Инициализируем основной слайдер
        const mainSwiper = new Swiper(mainSlider, {
            spaceBetween: 0,
            slidesPerView: 1, // Только ОДИН слайд видимый
            centeredSlides: false, // НЕ центрируем - это вызывает перекос
            loop: false,
            allowTouchMove: true, // Разрешаем свайп
            effect: 'slide', // Эффект перелистывания
            speed: 300, // Скорость переключения
            lazy: {
                loadPrevNext: true,
                loadPrevNextAmount: 2,
            },
            thumbs: thumbsSwiper ? {
                swiper: thumbsSwiper,
                slideThumbActiveClass: 'active',
            } : undefined,
            on: {
                init: function() {
                    console.log('MV78 Gallery: Main slider initialized with', this.slides.length, 'slides');
                },
                slideChange: function(swiper) {
                    console.log('MV78 Gallery: Changed to slide', swiper.activeIndex);
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
        
        // Обработка кликов на превьюшки для дополнительной гарантии переключения
        if (thumbsSlider && thumbsSwiper) {
            const thumbSlides = thumbsSlider.querySelectorAll('.product-gallery-mv78__thumb-slide');
            thumbSlides.forEach((thumb, index) => {
                thumb.addEventListener('click', () => {
                    mainSwiper.slideTo(index);
                    
                    // Обновляем active класс вручную для гарантии
                    thumbSlides.forEach((t, i) => {
                        if (i === index) {
                            t.classList.add('active');
                        } else {
                            t.classList.remove('active');
                        }
                    });
                });
            });
        }
        
        console.log('MV78 Gallery: Initialized with', mainSlides.length, 'images');
    });
}

// Инициализируем при загрузке DOM
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMv78Gallery);
} else {
    initMv78Gallery();
}

// Экспортируем для возможности переинициализации
export { initMv78Gallery };

