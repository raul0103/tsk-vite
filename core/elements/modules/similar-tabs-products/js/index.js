document.addEventListener('DOMContentLoaded', function() {
    const similarTabsProducts = document.querySelector('.similar-tabs-products');
    
    if (!similarTabsProducts) return;
    
    const navItems = similarTabsProducts.querySelectorAll('.similar-tabs-products__nav-item');
    const tabs = similarTabsProducts.querySelectorAll('.similar-tabs-products__tab');
    const swipers = {};
    
    // Инициализация слайдеров для каждого таба
    function initSwiper(tabElement) {
        const swiperContainer = tabElement.querySelector('.similar-tabs-products__slider');
        const swiperButtons = similarTabsProducts.querySelector('.similar-tabs-products__global-buttons');
        
        if (!swiperContainer) return null;
        
        const tabId = tabElement.id;
        
        if (swipers[tabId]) {
            return swipers[tabId];
        }
        
        const swiper = new Swiper(swiperContainer, {
            slidesPerView: 2,
            spaceBetween: 20,
            loop: false,
            navigation: {
                nextEl: swiperButtons?.querySelector('.swiper-button-next'),
                prevEl: swiperButtons?.querySelector('.swiper-button-prev'),
            },
            scrollbar: {
                el: swiperContainer.querySelector('.swiper-scrollbar'),
                draggable: true,
            },
            breakpoints: {
                480: {
                    slidesPerView: 2,
                    spaceBetween: 15,
                },
                768: {
                    slidesPerView: 3,
                    spaceBetween: 20,
                },
                1024: {
                    slidesPerView: 4,
                    spaceBetween: 20,
                },
                1200: {
                    slidesPerView: 5,
                    spaceBetween: 20,
                }
            },
            on: {
                init: function() {
                    // Показываем кнопки навигации после инициализации
                    if (swiperButtons && this.slides.length > this.params.slidesPerView) {
                        swiperButtons.style.display = 'flex';
                    }
                },
                breakpoint: function() {
                    // Обновляем видимость кнопок при изменении breakpoint
                    if (swiperButtons) {
                        if (this.slides.length > this.params.slidesPerView) {
                            swiperButtons.style.display = 'flex';
                        } else {
                            swiperButtons.style.display = 'none';
                        }
                    }
                }
            }
        });
        
        swipers[tabId] = swiper;
        return swiper;
    }
    
    // Переключение табов
    function switchTab(targetTabId) {
        // Убираем активные классы
        navItems.forEach(item => item.classList.remove('active'));
        tabs.forEach(tab => tab.classList.remove('active'));
        
        // Добавляем активные классы
        const targetNavItem = similarTabsProducts.querySelector(`[data-tab="${targetTabId}"]`);
        const targetTab = document.getElementById(targetTabId);
        
        if (targetNavItem && targetTab) {
            targetNavItem.classList.add('active');
            targetTab.classList.add('active');
            
            // Инициализируем слайдер для активного таба
            setTimeout(() => {
                const swiper = initSwiper(targetTab);
                if (swiper) {
                    swiper.update();
                }
            }, 100);
        }
    }
    
    // Обработчики клика по табам
    navItems.forEach(navItem => {
        navItem.addEventListener('click', function() {
            const targetTabId = this.getAttribute('data-tab');
            switchTab(targetTabId);
        });
    });
    
    // Инициализируем слайдер для первого активного таба
    const activeTab = similarTabsProducts.querySelector('.similar-tabs-products__tab.active');
    if (activeTab) {
        setTimeout(() => {
            initSwiper(activeTab);
        }, 100);
    }
    
    // Обновление слайдеров при изменении размера окна
    let resizeTimeout;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimeout);
        resizeTimeout = setTimeout(() => {
            Object.values(swipers).forEach(swiper => {
                if (swiper && typeof swiper.update === 'function') {
                    swiper.update();
                }
            });
        }, 250);
    });
});
