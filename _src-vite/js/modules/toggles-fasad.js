// Обработка переключателей для фасада
$(document).ready(function() {
    let touchMoved = false;

    // Добавляем скрытые поля для хранения состояния (если их еще нет)
    if (!$('.toggle-hidden-values').length) {
        const hiddenFields = `
            <div class="toggle-hidden-values" style="display: none;">
                <input type="hidden" name="free_measurement" value="0" class="toggle-value" data-toggle="free-measurement">
                <input type="hidden" name="mounting" value="0" class="toggle-value" data-toggle="mounting">
                <input type="hidden" name="mounting_systems" value="0" class="toggle-value" data-toggle="mounting-systems">
            </div>
        `;
        $('.product-card--fasad-images').append(hiddenFields);
    }

    // Восстанавливаем состояние из скрытых полей
    $('.toggle-value').each(function() {
        const $hidden = $(this);
        const toggleName = $hidden.data('toggle');
        const isChecked = $hidden.val() === '1';
        
        // Устанавливаем состояние для всех чекбоксов с этим именем
        $(`.product-card__toggle-input[data-toggle="${toggleName}"]`).prop('checked', isChecked);
    });

    // Обработчик изменения состояния чекбокса
    $('.product-card__toggle-input').on('change', function() {
        const $checkbox = $(this);
        const toggleName = $checkbox.data('toggle');
        const isChecked = $checkbox.is(':checked');
        
        // Обновляем скрытое поле
        $(`.toggle-value[data-toggle="${toggleName}"]`).val(isChecked ? '1' : '0');
        
        // Синхронизируем состояние со всеми переключателями с тем же именем
        $(`.product-card__toggle-input[data-toggle="${toggleName}"]`).not(this).prop('checked', isChecked);
    });

    // Обработчик клика для всех устройств (desktop и mobile)
    $('.product-card__toggle-label').on('click', function(e) {
        // Если это не touch событие, обрабатываем клик
        if (e.type === 'click' && !touchMoved) {
            const $label = $(this);
            const $checkbox = $label.prev('.product-card__toggle-input');
            
            // Переключаем состояние
            $checkbox.prop('checked', !$checkbox.is(':checked')).trigger('change');
            
            e.preventDefault();
            e.stopPropagation();
        }
    });

    // Обработчик для touch устройств
    $('.product-card__toggle-label').on('touchstart', function(e) {
        touchMoved = false;
    });

    $('.product-card__toggle-label').on('touchmove', function(e) {
        touchMoved = true;
    });

    $('.product-card__toggle-label').on('touchend', function(e) {
        if (!touchMoved) {
            const $label = $(this);
            const $checkbox = $label.prev('.product-card__toggle-input');
            
            // Переключаем состояние
            $checkbox.prop('checked', !$checkbox.is(':checked')).trigger('change');
            
            e.preventDefault();
            e.stopPropagation();
        }
    });
});

