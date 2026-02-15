<div class="popup js-thanks popup-discount-block" id="discount-block">
    <form method="POST" action class="popup__form form">
        <input type="text" name="mobilephone" class="fmobilephone">
        <input type="hidden" name="FORM" value="Узнать о снижении цены">

        <p class="title-2 form__title">Оставьте свой номер для отслеживания по СМС или Ватсап</p>
        <div class="form__text">Получайте уведомления о снижении цены на продукцию без регулярной проверки сайта.</div>
        <div class="form__inputs">
            <label>
                <input type="tel" placeholder="Укажите номер телефона*" name="PHONE">
                <span class="error_PHONE">[[!+fi.error.PHONE]]</span>
            </label>
        </div>
        <button type="submit" class="form__button custom-btn">Отправить</button>
        <label class="form__checkbox">
            <input id="callback-policy" type="checkbox" name="callback-policy" checked>
            <span>
                <span>
                     Нажимая кнопку «Отправить», Вы подтверждаете, что ознакомились с
                    <span data-fancybox data-type="ajax"
                       data-src="/confidential/" class="privacy-link">Условиями обработки персональных данных </span>
                    и принимаете их
                </span>
            </span>
        </label>
    </form>
</div>