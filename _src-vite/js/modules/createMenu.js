document.addEventListener('DOMContentLoaded', () => {
    function displayMenuColumns() {
        $('.h-catalog__column').not(':first').each(function (index, element) {
            if ($(this).find('.h-catalog-item_dependent.active').length === 0) {
                $(this).addClass('disable');
            } else {
                $(this).removeClass('disable');
            }
        });

        $('.h-catalog__column:not(:first) .h-catalog-item__name').removeClass('h-catalog-item__name_bold');
    }

    // -------------------------------
    // Переключение вкладок в меню в шапке
    // -------------------------------

    displayMenuColumns();
    const $hCatalogItem = $('.h-catalog-item_main, .h-catalog-item_to-catalog');

    $hCatalogItem.on('mouseenter', function (e) {
        e.preventDefault();
        let $this = $(this);

        if ($this.hasClass('active')) {
            return false;
        }

        $('.h-catalog-item.active, .h-catalog-item_to-catalog.active').removeClass('active');
        $this.addClass('active');
        $('.h-catalog-item_dependent[data-cat-id=' + $this.attr('data-cat-id') + ']').addClass('active');

        displayMenuColumns();
    });
});