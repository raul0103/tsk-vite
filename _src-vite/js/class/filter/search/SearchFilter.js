class SearchFilter {


    /**
     * Функция конструктора инициализирует свойства объекта с предоставленными параметрами.
     * @param $filter — Параметр $filter — это ссылка на объект jQuery фильтра, которая будет использоваться для фильтрации
     * @param $elems — Параметр $elems — это ссылка на объект jQuery опций фильтра.
     * @param selector_past_search — параметр selector_past_search — это селектор на элемент html куда будет вставлен поиск с помощью prepend
     * @param [maxLength=10] — параметр maxLength используется для указания максимальной длины массива элементов поиска для отображения поиска.
     */
    constructor($filter, $elems, selector_past_search, maxLength = 10) {
        this.$filter = $filter;
        this.$elems = $elems;
        this.maxLength = maxLength;
        this.selector_past_search = selector_past_search;


        this.hide_option = 0;
        this.show_option = 0;
        this.initialization();
    }

    /**
     * Функция проверяет, превышает ли длина переменной указанную максимальную длину, и регистрирует сообщение.
     * соответственно.
     */
    initialization() {
        var self = this;
        if (self.$elems.length > self.maxLength) {
            self.$filter.find(self.selector_past_search).prepend(self.addSearchElement());
            //console.log("поиск объявлен" + self.$elems.length);
        }
    }

    /**
     * Функция создает элемент ввода поиска с заполнителем и стилем, а также добавляет обработчик событий для поиска.
     * @returns Функция `addSearchElement()` возвращает элемент div, содержащий элемент ввода для поиска.
     * функциональность.
     */
    addSearchElement() {
        const searchInput = document.createElement("input");
        searchInput.className = "search-filter";
        searchInput.type = "text";
        searchInput.placeholder = "Поиск";
        searchInput.style.padding = "8px 10px";
        searchInput.style.width = "100%";
        searchInput.style.marginBottom = "20px";
        this.addHandlerSearch(searchInput);

        const searchDiv = document.createElement("div");
        searchDiv.appendChild(searchInput);
        return searchDiv;
    }

    /**
     * Отобразить все опции фильтра
     */
    showAllOption() {
        this.$elems.each(function () {
            $(this).show();
        });
    }

    /**
     * Функция добавляет к заданному элементу ввода обработчик поиска, который фильтрует и скрывает элементы на основе данных пользователя.
     * поиск ввода.
     * @param searchInput — параметр searchInput — это элемент ввода, в который пользователь может ввести свой поисковый запрос.
     */
    addHandlerSearch(searchInput) {
        var self = this;
        // при событии ввода
        searchInput.addEventListener('input', function (evt) {
            let search = evt.target.value;
            // отображаем все
            self.showAllOption();
            let $more = self.$filter.find(self.selector_past_search).find(".listing__filter-block-btn-more");


            if (search.length >= 1) {
                $more.hide();
                //обходим все элементы фильтра
                self.$elems.each(function () {
                    //приводим к нижнему регистру
                    let valueLowerCase = String($(this).data('value')).toLowerCase();
                    // ищем
                    if (valueLowerCase.indexOf(String(search).toLowerCase()) < 0) {
                        $(this).hide();
                    }
                })
            } else {
                self.showAllOption();
            }

            self.handlerStart();
        });
    }


    /**
     * Обработчики фильтров
     */
    handlerStart()
    {
        this.handlerCountingOptions();
        this.handlerNotFoundResult();
    }

    /**
     * Обработка нет результата
     */
    handlerNotFoundResult() {
        var self = this;

        const notFoundMessage = document.createElement("div");
        notFoundMessage.textContent = "Результатов не найдено";

        notFoundMessage.style.marginTop = "3px";
        notFoundMessage.className = "not-found-message";

        if (self.hide_option > 0 && self.show_option === 0) {
            if (!self.$filter.find('.not-found-message').length) {
                self.$filter.find(self.selector_past_search).append(notFoundMessage);
                //TODO: вынести сокрытие блока Показать еще в отдельный метод
                self.$filter.find(self.selector_past_search).find(".listing__filter-block-btn-more").hide();
            }
        } else {
            self.$filter.find(self.selector_past_search).find('.not-found-message').remove();
        }
    }

    /**
     * Подсчет скрытых и видимых опций фильтров
     */
    handlerCountingOptions()
    {
        var self = this;

        self.show_option =  self.$elems.filter(function () {
            return $(this).css('display') !== 'none';
        }).length;
        self.hide_option = self.$elems.filter(function () {
            return $(this).css('display') === 'none';
        }).length;
    }
}

export default SearchFilter;