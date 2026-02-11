/**
 * MenuV4 - Интерактивное меню каталога с анимацией
 * Управляет переключением между категориями и анимацией контента
 */
export default class MenuV4 {
    constructor() {
        this.menuContainer = null;
        this.catalogItems = [];
        this.contentItems = [];
        this.activeIndex = 0;
        this.isAnimating = false;
    }

    init() {
        this.menuContainer = document.querySelector('.menu-v4');
        if (!this.menuContainer) return;

        this.catalogItems = this.menuContainer.querySelectorAll('.menu-catalog__item');
        this.contentItems = this.menuContainer.querySelectorAll('.menu-content');
        
        if (this.catalogItems.length === 0 || this.contentItems.length === 0) return;

        this.bindEvents();
        this.setActiveItem(0); // Устанавливаем первый элемент активным
    }

    bindEvents() {
        this.catalogItems.forEach((item, index) => {
            // Используем mouseenter для плавного переключения при наведении
            item.addEventListener('mouseenter', () => {
                if (!this.isAnimating && index !== this.activeIndex) {
                    this.switchToCategory(index);
                }
            });

            // Добавляем клик для мобильных устройств
            item.addEventListener('click', (e) => {
                e.preventDefault();
                if (!this.isAnimating && index !== this.activeIndex) {
                    this.switchToCategory(index);
                }
            });
        });
    }

    switchToCategory(index) {
        if (this.isAnimating || index === this.activeIndex) return;
        
        this.isAnimating = true;
        
        // Убираем активное состояние с текущих элементов
        this.catalogItems[this.activeIndex].classList.remove('active');
        this.contentItems[this.activeIndex].classList.remove('active');
        
        // Добавляем активное состояние новым элементам
        this.catalogItems[index].classList.add('active');
        
        // Небольшая задержка перед показом нового контента для плавности
        setTimeout(() => {
            this.contentItems[index].classList.add('active');
            this.activeIndex = index;
            
            // Сбрасываем флаг анимации после завершения основной анимации
            setTimeout(() => {
                this.isAnimating = false;
            }, 400);
        }, 50);
    }

    setActiveItem(index) {
        // Сбрасываем все активные состояния
        this.catalogItems.forEach(item => item.classList.remove('active'));
        this.contentItems.forEach(item => item.classList.remove('active'));
        
        // Устанавливаем активное состояние
        if (this.catalogItems[index] && this.contentItems[index]) {
            this.catalogItems[index].classList.add('active');
            this.contentItems[index].classList.add('active');
            this.activeIndex = index;
        }
    }

    // Метод для программного переключения категории
    goToCategory(index) {
        if (index >= 0 && index < this.catalogItems.length) {
            this.switchToCategory(index);
        }
    }

    // Метод для получения текущей активной категории
    getActiveCategory() {
        return this.activeIndex;
    }

    // Метод для обновления меню (если данные изменились динамически)
    refresh() {
        this.catalogItems = this.menuContainer.querySelectorAll('.menu-catalog__item');
        this.contentItems = this.menuContainer.querySelectorAll('.menu-content');
        this.bindEvents();
    }
}

