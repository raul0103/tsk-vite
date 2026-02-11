// Подробности тут: https://thecode.media/fortune/?ysclid=lldqh4s8b6678403978
// TODO: В статье код на Vanilla. Мне сложно писать на Vanilla, гораздо проще на JQuery. В итоге код получился смешанным. Это плохо. Надо переписать этот код. В идеале вообще в виде класса оформить.

import functions, { isJsonString } from "@/js/functions/";
import usessiontime from './usessiontime';
import Cookies from 'js-cookie';

export default function fortwheel() {
    // Объявляем необходимые переменные и константы
    let causedByMouseLeave = false; // Всплывашка вызвана за счет вывода курсора за границы экрана?
    const sessionTime = usessiontime(); // Время сессии. От него зависит, через сколько после загрузки страницы начнет работать слушатель на вывод курсора за границы экрана и через сколько показывать подарок
    // Через сколько показывать подарок
    // На мобиле показать подарок через 2 минуты
    let giftTimeoutDelay = (window.innerWidth < 768 ? 120 : 30) - sessionTime;

    let mouseLeaveTimeoutDelay = 60 - sessionTime;  // Через сколько начнет работать слушатель на вывод курсора за границы экрана
    giftTimeoutDelay = giftTimeoutDelay < 0 ? 0 : giftTimeoutDelay * 1000;
    mouseLeaveTimeoutDelay = mouseLeaveTimeoutDelay < 0 ? 0 : mouseLeaveTimeoutDelay * 1000;
    let fortwheelCookie = functions.isJsonString(Cookies.get('fortwheel')); // Куки с данными о колесе
    if (!fortwheelCookie) {
        fortwheelCookie = {};
    }

    // Проводим валидацию - есть ли колесо на странице? А так же проверяем на наличие призов
    const wheel = document.querySelector(".deal-wheel");
    const prizes = getPrizesAndRates();     // Надписи и цвета на секторах

    if (!wheel) {
        return;
    }

    if (wheel && prizes.length == 0) {
        wheel.remove();
        console.log("[fortwheel] Для данного сайта не найдены призы");
        return;
    }

    // Создаём переменные для быстрого доступа ко всем объектам на странице — блоку в целом, колесу, кнопке и язычку
    const $inputPhone = $('.popup-fortwheel__input-phone'); // Поле для ввода телефона
    const spinner = wheel.querySelector(".spinner"); // Колесо фортуны
    const ticker = wheel.querySelector(".ticker"); // Язычок слева от колеса
    const popup = document.querySelector('.popup-fortwheel'); // Всплывашка с колесом фортуны
    let selectedPrizeIndex; // Индекс выбранного приза

    // Добавляем подарок, при клике по которому будет открываться всплывашка с колесом
    document.body.insertAdjacentHTML('beforeend', '<div class="hidden fortwheel-gift" data-src="#fortwheel" data-fancybox></div>');
    const gift = document.querySelector('.fortwheel-gift');
    $('.fortwheel-gift').fancybox({
        beforeClose: function () {
            // Если пользователь закрыл всплывашку, которая появилась за счет вывода мыши за экран, то запрещаем всплывашке появляться за счет вывода мыши за экран
            if (causedByMouseLeave === true) {
                fortwheelCookie.forbid_cause_by_mouse_leave = 1;
                Cookies.set('fortwheel', JSON.stringify(fortwheelCookie), { expires: 365 });
            }

            causedByMouseLeave = false;
        },
    });

    // Изначально подарок не виден, он покажется через 30 секунд
    const giftShowFunction = function () {
        gift.classList.remove('hidden');
    };
    setTimeout(giftShowFunction, giftTimeoutDelay);

    // На сколько секторов нарезаем круг
    const prizeSlice = 360 / prizes.length;
    // На какое расстояние смещаем сектора друг относительно друга
    const prizeOffset = Math.floor(180 / prizes.length);
    // Прописываем CSS-классы, которые будем добавлять и убирать из стилей
    const spinClass = "is-spinning";
    // Получаем все значения параметров стилей у секторов
    const spinnerStyles = window.getComputedStyle(spinner);

    // Переменная для анимации
    let tickerAnim;
    // Угол вращения
    let rotation = 0;
    // Текущий сектор
    let currentSlice = 0;
    // Переменная для текстовых подписей
    let prizeNodes;

    // Расставляем текст по секторам
    const createPrizeNodes = () => {
        // Обрабатываем каждую подпись
        prizes.forEach(({ text, color }, i) => {
            // Каждой из них назначаем свой угол поворота
            const rotation = ((prizeSlice * i) * -1) - prizeOffset;
            // Добавляем код с размещением текста на страницу в конец блока spinner
            spinner.insertAdjacentHTML(
                "beforeend",
                // Текст при этом уже оформлен нужными стилями
                `<li class="prize" style="--rotate: ${rotation}deg">
                    <span class="text">${text}</span>
                 </li>`
            );
        });
    };

    // Рисуем разноцветные секторы
    const createConicGradient = () => {
        // Устанавливаем нужное значение стиля у элемента spinner
        spinner.style.setProperty('background', `conic-gradient(from -90deg, ${prizes
            // получаем цвет текущего сектора
            .map(({ color }, i) => `${color} 0 ${(100 / prizes.length) * (prizes.length - i)}%`)
            .reverse()
            })`);
    };

    // Создаём функцию, которая нарисует колесо в сборе
    const setupWheel = () => {
        // сначала секторы
        createConicGradient();
        // потом текст
        createPrizeNodes();
        // а потом мы получим список всех призов на странице, чтобы работать с ними как с объектами
        prizeNodes = wheel.querySelectorAll(".prize");
    };

    // Функция запуска вращения с плавной остановкой
    const runTickerAnimation = () => {
        // Взяли код анимации отсюда: https://css-tricks.com/get-value-of-css-rotation-through-javascript/
        const values = spinnerStyles.transform.split("(")[1].split(")")[0].split(",");
        const a = values[0];
        const b = values[1];
        let rad = Math.atan2(b, a);

        if (rad < 0) {
            rad += (2 * Math.PI);
        }

        const angle = Math.round(rad * (180 / Math.PI));
        const slice = Math.floor(angle / prizeSlice);

        // Анимация язычка, когда его задевает колесо при вращении
        // Если появился новый сектор
        if (currentSlice !== slice) {
            // Убираем анимацию язычка
            ticker.style.animation = "none";
            // И через 10 миллисекунд отменяем это, чтобы он вернулся в первоначальное положение
            setTimeout(() => ticker.style.animation = null, 10);
            // После того, как язычок прошёл сектор - делаем его текущим
            currentSlice = slice;
        }
        // Запускаем анимацию
        tickerAnim = requestAnimationFrame(runTickerAnimation);
    };

    // Подготавливаем всё к запуску
    setupWheel();

    // Если пользователь уже отправлял колесо, то надо сделать форму отправленной (чтобы пользователь не мог обновить страницу и отправить колесо снова)
    if (fortwheelCookie.success == 1) {
        // Добавляем для всплывашки класс, который прячет форму и показывает текст
        popup.classList.add('popup-fortwheel_submitted');
        popup.classList.remove('popup-fortwheel_start-animation');
        selectedPrizeIndex = fortwheelCookie.prizeIndex;
        setPrize();
        spinner.style.setProperty("--rotate", fortwheelCookie.rotation);
    } else {
        // Если курсор пользователя покинул страницу, то надо показать форму с колесом. Но это только в том случае, если в куках нет forbid_cause_by_mouse_leave 
        /*
        if (fortwheelCookie.forbid_cause_by_mouse_leave != 1) {
            const mouseLeaveListener = function (event) {
                if (event.clientY <= 0 || event.clientX <= 0 || (event.clientX >= window.innerWidth || event.clientY >= window.innerHeight)) {
                    causedByMouseLeave = true;
                    document.documentElement.removeEventListener('mouseleave', mouseLeaveListener);
                    gift.click();
                    giftShowFunction();
                }
            };
            const mouseLeaveTimeout = setTimeout(function () {
                document.documentElement.addEventListener('mouseleave', mouseLeaveListener);
            }, mouseLeaveTimeoutDelay);
            // Если пользователь хотя бы раз открыл форму, то надо убрать обработчик на покидание страницы
            const giftClickListener = function () {
                gift.removeEventListener('click', giftClickListener);
                clearTimeout(mouseLeaveTimeout);
                document.documentElement.removeEventListener('mouseleave', mouseLeaveListener);
            };
            gift.addEventListener('click', giftClickListener);
        }
        */
    }

    $(document).on('submit', '.form_fortwheel__user-form', function (e) {
        e.preventDefault();

        // Валидируем телефон
        let inputPhoneVal = $inputPhone.val().trim();
        if (!(/^\+7 \(\d\d\d\) \d\d\d-\d\d-\d\d\d?$/).test(inputPhoneVal)) {
            $.jGrowl('В форме содержатся ошибки!', { theme: 'af-message-error' });
            $inputPhone.addClass('error');
            return false;
        }

        // Убираем класс первичной анимации (постепенного вращения)
        rotation = getRotationAngle(spinner);
        popup.classList.remove('popup-fortwheel_start-animation');
        spinner.style.setProperty('--rotate', rotation);

        // Блокируем отправку формы и нажатие на кнопки
        $inputPhone.prop('disabled', true);
        $('.form__button').prop('disabled', true).addClass('active');
        $('.popup-fortwheel').addClass('popup-fortwheel_sending');

        // Устанавливаем нужные переменные
        // Приз
        const selectedPrizeRate = getRandomValue(1, 100);
        let prizeProbability = 0;
        for (let i = 0; i < prizes.length; i++) {
            prizeProbability += prizes[i].rate;

            if (selectedPrizeRate <= prizeProbability) {
                selectedPrizeIndex = i;
                break;
            }
        }
        // Кол-во оборотов колеса
        const revs = getRandomValue(5, 8);
        // Неточность внутри секции приза
        let inaccuracyInsideSect = getRandomValue(0, 360 / prizes.length - 1);
        // На сколько градусов повернуть колесо
        rotation = Math.floor(360 / prizes.length * selectedPrizeIndex + inaccuracyInsideSect + (360 * revs));

        // Добавляем колесу класс is-spinning, с помощью которого реализуем анимацию
        wheel.classList.add(spinClass);
        // Через CSS устанавливаем поворот колеса
        spinner.style.setProperty("--rotate", rotation);
        // Запускаем анимацию вращения
        runTickerAnimation();
        // Отслеживаем, когда закончится анимация
        spinner.addEventListener("transitionend", eventTransitionend);

        // console.log('selectedPrizeRate', selectedPrizeRate)
        // console.log('selectedPrizeIndex', selectedPrizeIndex)
    });

    function getRandomValue(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }

    function eventTransitionend() {
        // Останавливаем отрисовку вращения
        cancelAnimationFrame(tickerAnim);
        // Получаем текущее значение поворота колеса
        rotation %= 360;
        // Убираем класс, который отвечает за вращение
        wheel.classList.remove(spinClass);
        // Отправляем в CSS новое положение поворота колеса
        spinner.style.setProperty("--rotate", rotation);

        // Заполняем и отправляем форму
        const prizeText = setPrize();
        // Заполняем телефон в скрытой форме
        $('.popup-fortwheel__hidden-input-phone').val($inputPhone.val());
        // Заполняем приз в скрытой форме
        $('.popup-fortwheel__hidden-input-prize').val(prizeText);

        // Отправляем форму
        $('.popup-fortwheel__hidden-form').submit();

        // Добавляем для всплывашки класс, который прячет форму и показывает текст
        popup.classList.add('popup-fortwheel_submitted');
    }

    function setPrize() {
        console.log('ВНИМАНИЕ! selectedPrizeIndex = ', selectedPrizeIndex);
        const $prize = $('.prize').eq(selectedPrizeIndex);
        console.log('$prize = ', $('.prize'));
        $prize.addClass('selected');
        const prizeText = $prize.text().trim();
        // Устанавливаем текст, который будет показан после отправки формы
        const $submittedText = $('.popup-fortwheel__submitted-text');
        $submittedText.html('Ваш приз: ' + prizeText + '<br>' + $submittedText.html());
        return prizeText;
    }

    function getRotationAngle(block) {
        // Получаем стиль элемента, включая его трансформацию
        let style = window.getComputedStyle(block);

        // Получаем матрицу трансформации
        let transform = style.getPropertyValue("transform");

        // Разбираем матрицу трансформации для получения угла вращения
        let values = transform.split('(')[1].split(')')[0].split(',');
        let a = values[0];
        let b = values[1];
        let angle = Math.atan2(b, a);

        // Преобразуем угол из радиан в градусы
        return angle * (180 / Math.PI);
    }

    // Действия после успешной отправки формы
    $(document).on('fortwheel-success', function () {
        fortwheelCookie.success = 1;
        fortwheelCookie.rotation = rotation;
        fortwheelCookie.prizeIndex = selectedPrizeIndex;
        Cookies.set('fortwheel', JSON.stringify(fortwheelCookie), { expires: 365 });
    });

    function getPrizesAndRates() {
        let result = [];

        switch (true) {
            case $('[data-ctx="krovlya"]').length == true:
                result = [
                    {
                        text: "Скидка 10% на все",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка 15% на мембраны",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Скидка 10% на ОСБ плиты",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на гидропароизоляцию",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Скидка 50% на доставку",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на комплектующие",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="pro-fanera"]').length == true:
                result = [
                    {
                        text: "Бесплатный распил в размер",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка 5%",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Бесплатная разгрузка",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Доставка со скдикой 40%",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Скидка 10% на теплоизоляцию Rockwool",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на заказ от 50&nbsp;000&nbsp;&#8381;",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="fasady-pro"]').length == true:
                result = [
                    {
                        text: "Скидка 10% на все",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка 40% на окрашивание",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Бесплатная разгрузка",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% при оплате за наличный расчет",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Скидка 30% на доставку",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "4 балона клей-пены в подарок",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="fasad"]').length == true:
                result = [
                    {
                        text: "Бесплатная разгрузка",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка 50% на доборные элементы",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Скидка на дюбель-гвозди 40%",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% при заказе от 50&nbsp;000&nbsp;&#8381;",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "4 балона клей-пены в подарок",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на заказ от 100&nbsp;000&nbsp;&#8381;",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="pilomat"]').length == true:
                result = [
                    {
                        text: "Скидка 30% на разгрузку манипулятором",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка 20% на покрытие огнебиозащитой",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Скидка 40% на окрашивание",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Льготная доставка 1990 ₽",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Резка в размер в подарок",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% при заказе от 50&nbsp;000&nbsp;&#8381;",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="plitaosb"],[data-ctx="plity-mdvp"]').length == true:
                result = [
                    {
                        text: "Скидка 10% на заказ от 50&nbsp;000&nbsp;&#8381;",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка на доставку 30%",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Бесплатная разгрузка на объекте",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на теплоизоляцию Rockwool",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Бесплатный распил в размер",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на заказ кровельных материалов",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="kirpich-m"]').length == true:
                result = [
                    {
                        text: "Скидка 10% на все",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Услуга стропильщика в подарок при заказе от 100 т.р",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Скидка 30% на разгрузку манипулятором",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка -5% юр.лицам при заказе от 200&nbsp;000&nbsp;&#8381;",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Скидка 10% на штукатурку и кладочный раствор",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% при оплате за наличный расчет при заказе от 100&nbsp;000&nbsp;&#8381;",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="rockwool"], [data-ctx="umatex"], [data-ctx="isorok"]').length == true:
                result = [
                    {
                        text: "Бесплатная разгрузка",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка 40% на пленки и мембраны",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Скидка 30% на доставку",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на заказ от 100&nbsp;000&nbsp;&#8381;",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Скидка на дюбель-гвозди 40%",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% при заказе от 50&nbsp;000&nbsp;&#8381;",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="paroc"], [data-ctx="tn"], [data-ctx="ursa"], [data-ctx="isover"], [data-ctx="web"]').length == true:
                result = [
                    {
                        text: "Скидка 10% на все",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "Скидка на дюбель-гвозди 40%",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "Бесплатная разгрузка",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% при заказе от 50&nbsp;000&nbsp;&#8381;",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "4 балона клей-пены в подарок",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 10% на заказ от 100&nbsp;000&nbsp;&#8381;",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;

            case $('[data-ctx="penoplex"]').length == true:
                result = [
                    {
                        text: "Скидка 10% на все",
                        color: "hsl(197 30% 43%)",
                        rate: 0
                    },
                    {
                        text: "12 м2 XPS в подарок",
                        color: "hsl(350 60% 52%)",
                        rate: 30
                    },
                    {
                        text: "4 балона клей-пены в подарок",
                        color: "hsl(173 58% 39%)",
                        rate: 15
                    },
                    {
                        text: "Скидка 5% на заказ",
                        color: "hsl(43 74% 66%)",
                        rate: 25
                    },
                    {
                        text: "Бесплатная разгрузка",
                        color: "hsl(27 87% 67%)",
                        rate: 15
                    },
                    {
                        text: "Скидка на дюбель-гвозди 40%",
                        color: "hsl(12 76% 61%)",
                        rate: 15
                    },
                ];
                break;
        }

        return result;
    }
}
