export default function init() {
    let tube_player = {
        init: function () {
            let t = this;
            $('.lazy-video').each(function (i, e) {
                t.setupVideo($(e));
            });
        },

        setupVideo: function ($video) {
            // Устанавливаем необходимые для работы переменные
            let $link = $video.find('.lazy-video__link');
            let $media = $video.find('.lazy-video__media');
            let id = this.getIdFromLink($link);
            // 1120 и 630 - это значения по умолчанию. Я взял их из головы. Видео с такими размерами смотрится хорошо
            let width = $video.attr('data-width') ?? 1120;
            let height = $video.attr('data-height') ?? 630;

            // Убираем ссылку (тег a), она нужна была для SEO
            $media.unwrap();
            // Добавляем div'у специалный класс, который содержит нужные CSS стили
            $video.addClass('video-enabled');
            // Добавляем кнопку для воспроизведения видео
            let $button = $('<button class="lazy-video__button" type="button" aria-label="Запустить видео"><svg width="68" height="48" viewBox="0 0 68 48"><path class="lazy-video__button-shape" d="M66.52,7.74c-0.78-2.93-2.49-5.41-5.42-6.19C55.79,.13,34,0,34,0S12.21,.13,6.9,1.55 C3.97,2.33,2.27,4.81,1.48,7.74C0.06,13.05,0,24,0,24s0.06,10.95,1.48,16.26c0.78,2.93,2.49,5.41,5.42,6.19 C12.21,47.87,34,48,34,48s21.79-0.13,27.1-1.55c2.93-0.78,4.64-3.26,5.42-6.19C67.94,34.95,68,24,68,24S67.94,13.05,66.52,7.74z"></path><path class="lazy-video__button-icon" d="M 45,24 27,14 27,34"></path></svg></button>').appendTo($video);
            // Добавляем блок, отвечающий за высоту div'а с видео (высота считается в padding, за счет чего при сжимании экрана и видео, и img-заглушка будут смотреться красиво)
            let $placeholder = $('<div class="lazy-video__placeholder"></div>').appendTo($video);

            // Добавляем стили для ширины и высоты
            $video.css('width', width);
            $placeholder.css('padding-bottom', (height / width * 100) + '%');

            // Вешаем обработчик на клик по видео
            let t = this;
            $video.on('click', function () {
                let $iframe = t.createIframe(id, width, height);
                $link.remove();
                $button.remove();
                $video.append($iframe);
            });
        },

        getIdFromLink: function ($link) {
            let url = $link.attr('href');
            let splitted = url.split('/')
            return splitted[splitted.length - 1];
        },

        createIframe: function (id, width, height) {
            let $iframe = $('<iframe></iframe>');

            $iframe.attr('allowfullscreen', '');
            $iframe.attr('src', this.generateURL(id));
            $iframe.addClass('lazy-video__iframe');

            $iframe.attr('width', width);
            $iframe.attr('height', height);

            return $iframe;
        },

        generateURL: function (id, query='') {
            return 'https://www.rutube.ru/play/embed/' + id + query;
        }
    };

    tube_player.init();
}
