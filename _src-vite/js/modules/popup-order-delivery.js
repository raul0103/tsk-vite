/**
 * Управление видимостью контейнера "Адрес доставки" в зависимости от выбранного способа получения
 * Работает только для вкладок "Физическое лицо" и "Юридическое лицо"
 */
(function() {
    'use strict';

    /**
     * Инициализация функционала
     */
    function init() {
        const $popupOrder = $('#order');
        
        if (!$popupOrder.length) {
            return;
        }

        // Обработка для каждой вкладки (физическое и юридическое лицо)
        const tabs = ['fiz', 'yur'];
        
        tabs.forEach(function(tab) {
            const $tabContent = $popupOrder.find('.js-tabs-content[data-tab="' + tab + '"]');
            
            if (!$tabContent.length) {
                return;
            }

            // Находим радиокнопки способа получения
            const $deliveryRadios = $tabContent.find('input[name="DELIVERY"]');
            
            if (!$deliveryRadios.length) {
                return;
            }

            // Находим контейнер адреса доставки (теперь одинаковая структура для обеих вкладок)
            const $addressContainer = $tabContent.find('.popup-order__address-wrap');

            if (!$addressContainer.length) {
                return;
            }

            /**
             * Функция для показа/скрытия контейнера адреса доставки
             */
            function toggleAddressContainer() {
                const $checkedRadio = $deliveryRadios.filter(':checked');
                const isDelivery = $checkedRadio.length && $checkedRadio.val() === 'Доставка';
                
                if (isDelivery) {
                    // Показываем контейнер, если выбрана "Доставка"
                    $addressContainer.show();
                } else {
                    // Скрываем контейнер, если выбран другой способ получения
                    $addressContainer.hide();
                }
            }

            // Инициализация при загрузке (проверяем состояние по умолчанию)
            toggleAddressContainer();

            // Обработчик изменения выбора способа получения
            $deliveryRadios.on('change', toggleAddressContainer);
        });
    }

    // Инициализация при загрузке DOM (с использованием jQuery, который доступен в index.js)
    $(function() {
        init();
        
        // Также инициализируем при открытии модального окна (на случай динамической загрузки)
        $(document).on('fancybox:afterShow', function(e, instance, slide) {
            if (slide.$content && slide.$content.find('#order').length) {
                setTimeout(init, 100);
            }
        });
        
        // Переинициализация при переключении вкладок (физическое/юридическое лицо)
        $('#order').on('click', '.js-tabs-header', function() {
            setTimeout(init, 50);
        });
    });

})();

