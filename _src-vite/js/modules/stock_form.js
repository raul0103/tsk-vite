/**
 * Модуль для работы с формой обратной связи для товаров «Под запрос»
 */
export default function initStockForm() {
    // Инициализация при открытии модального окна
    document.addEventListener('DOMContentLoaded', function() {
        // Обработчик для ссылок, открывающих форму
        const stockLinks = document.querySelectorAll('[data-fancybox][href="#stock-modal"]');
        
        stockLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                const materialName = this.getAttribute('data-material-name');
                
                // Устанавливаем название материала в форму при открытии модального окна
                setTimeout(() => {
                    const materialInput = document.querySelector('#stock-modal .js-material-input');
                    if (materialInput && materialName) {
                        materialInput.value = materialName;
                        materialInput.setAttribute('data-original-value', materialName);
                    }
                }, 100); // Небольшая задержка для корректной инициализации модального окна
            });
        });

        // Обработчик для поля "Материал" - разрешаем редактирование при клике
        document.addEventListener('click', function(e) {
            if (e.target && e.target.classList.contains('js-material-input')) {
                const input = e.target;
                
                // Убираем readonly и фокусируемся на поле
                input.removeAttribute('readonly');
                input.focus();
                input.select(); // Выделяем весь текст для удобства редактирования
                
                // Меняем стиль для индикации возможности редактирования
                input.style.backgroundColor = '#fff';
            }
        });

        // Обработчик потери фокуса для поля "Материал"
        document.addEventListener('blur', function(e) {
            if (e.target && e.target.classList.contains('js-material-input')) {
                const input = e.target;
                
                // Если поле пустое, восстанавливаем оригинальное значение
                if (!input.value.trim()) {
                    const originalValue = input.getAttribute('data-original-value') || '';
                    input.value = originalValue;
                }
                
                // Возвращаем readonly состояние и стиль
                input.setAttribute('readonly', 'readonly');
                input.style.backgroundColor = '#F0F0F0';
            }
        }, true); // Используем capture фазу для корректной обработки

        // Обработчик для предотвращения отправки формы с пустым полем "Материал"
        document.addEventListener('submit', function(e) {
            if (e.target && e.target.closest('#stock-modal')) {
                const materialInput = e.target.querySelector('.js-material-input');
                const materialError = e.target.querySelector('.error_MATERIAL');
                
                if (materialInput && !materialInput.value.trim()) {
                    e.preventDefault();
                    
                    // Показываем ошибку
                    if (materialError) {
                        materialError.textContent = 'Поле "Материал" обязательно для заполнения';
                        materialError.style.display = 'block';
                    }
                    
                    // Подсвечиваем поле
                    materialInput.classList.add('error');
                    materialInput.style.borderColor = '#e80000';
                    
                    return false;
                }
                
                // Убираем ошибку если поле заполнено
                if (materialInput && materialInput.value.trim()) {
                    materialInput.classList.remove('error');
                    materialInput.style.borderColor = '';
                    
                    if (materialError) {
                        materialError.textContent = '';
                        materialError.style.display = 'none';
                    }
                }
            }
        });

        // Обработчик для очистки ошибок при вводе
        document.addEventListener('input', function(e) {
            if (e.target && e.target.classList.contains('js-material-input')) {
                const input = e.target;
                const errorElement = input.parentNode.querySelector('.error_MATERIAL');
                
                if (input.value.trim()) {
                    input.classList.remove('error');
                    input.style.borderColor = '';
                    
                    if (errorElement) {
                        errorElement.textContent = '';
                        errorElement.style.display = 'none';
                    }
                }
            }
        });

        // Обработчик для сброса формы при закрытии модального окна
        document.addEventListener('click', function(e) {
            // Проверяем, если клик по кнопке закрытия или по overlay
            if (e.target && (e.target.classList.contains('fancybox-close-small') || 
                           e.target.classList.contains('fancybox-bg'))) {
                
                setTimeout(() => {
                    const form = document.querySelector('#stock-modal form');
                    if (form) {
                        // Очищаем все поля кроме скрытых
                        const inputs = form.querySelectorAll('input:not([type="hidden"])');
                        inputs.forEach(input => {
                            if (input.type !== 'checkbox') {
                                input.value = '';
                            }
                        });
                        
                        // Очищаем все ошибки
                        const errors = form.querySelectorAll('[class*="error_"]');
                        errors.forEach(error => {
                            error.textContent = '';
                            error.style.display = 'none';
                        });
                        
                        // Убираем классы ошибок
                        const errorInputs = form.querySelectorAll('.error');
                        errorInputs.forEach(input => {
                            input.classList.remove('error');
                            input.style.borderColor = '';
                        });
                        
                        // Восстанавливаем readonly для поля материал
                        const materialInput = form.querySelector('.js-material-input');
                        if (materialInput) {
                            materialInput.setAttribute('readonly', 'readonly');
                            materialInput.style.backgroundColor = '#F0F0F0';
                        }
                    }
                }, 100);
            }
        });
    });
}

// Автоматическая инициализация
if (typeof window !== 'undefined') {
    initStockForm();
}
