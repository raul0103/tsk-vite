{if $_modx->context.key == 'krovlya'}
<div class="popup js-thanks" id="plan-in-choice">
    <div class="plan-modal-form">
        <p class="title-2 form__title">Поможем подобрать материал и рассчитать стоимость по вашему чертежу!</p>

        <form method="POST" action class="popup__form form plan-in-choice">
            <input type="text" name="mobilephone" class="fmobilephone">

            <div class="form__inputs">
                <label>
                    <input type="text" placeholder="Укажите Ваше имя" name="NAME">
                    <span class="error_NAME">[[!+fi.error.NAME]]</span>
                </label>

                <label>
                    <input type="tel" placeholder="Укажите номер телефона*" name="PHONE">
                    <span class="error_PHONE">[[!+fi.error.PHONE]]</span>
                </label>


                <input type="hidden" id="plan-file" name="COMMENT">
                {$_modx->runSnippet("!YandexDiskUploader", ["inputId" => "plan-file" ])}

                <span class="error_FILE">[[!+fi.error.COMMENT]]</span>

                <label for="plan-file">
                    Формат: doc, jpg, png, pdf, dwg, xlsx;<br>
                    Размер не более 15 Мб.
                </label>


            </div>
            <button type="submit" class="form__button custom-btn">Отправить</button>
            <label class="form__checkbox">
                <input id="callback-policy" type="checkbox" name="callback-policy" checked>
                <span>
                <span>
                     Нажимая кнопку «Отпарвить», Вы подтверждаете, что ознакомились с
                    <span data-fancybox data-type="ajax"
                          data-src="/confidential/" class="privacy-link">Условиями обработки персональных данных </span>
                    и принимаете их
                </span>
            </span>
            </label>
        </form>
    </div>

</div>
{else}
<div class="popup js-thanks" id="plan-in-choice">
    <div class="plan-modal-form">
        <p class="title-2 form__title">Поможем подобрать материал и рассчитать стоимость по вашему чертежу!</p>

        <div class="plan-modal-form__image">
            <img src="/assets/template/img/modal/0001-1 1.png">
        </div>

        <form method="POST" action class="popup__form form plan-in-choice">
            <input type="text" name="mobilephone" class="fmobilephone">

            <div class="form__inputs">
                <label>
                    <input type="text" placeholder="Укажите Ваше имя" name="NAME">
                    <span class="error_NAME">[[!+fi.error.NAME]]</span>
                </label>

                <label>
                    <input type="tel" placeholder="Укажите номер телефона*" name="PHONE">
                    <span class="error_PHONE">[[!+fi.error.PHONE]]</span>
                </label>


                <input type="hidden" id="plan-file" name="COMMENT">
                {$_modx->runSnippet("!YandexDiskUploader", ["inputId" => "plan-file" ])}

                <span class="error_FILE">[[!+fi.error.COMMENT]]</span>

                <label for="plan-file">
                    Формат: doc, jpg, png, pdf, dwg, xlsx;<br>
                    Размер не более 15 Мб.
                </label>


            </div>
            <button type="submit" class="form__button custom-btn">Отправить</button>
            <label class="form__checkbox">
                <input id="callback-policy" type="checkbox" name="callback-policy" checked>
                <span>
                <span>
                     Нажимая кнопку «Отпарвить», Вы подтверждаете, что ознакомились с
                    <span data-fancybox data-type="ajax"
                          data-src="/confidential/" class="privacy-link">Условиями обработки персональных данных </span>
                    и принимаете их
                </span>
            </span>
            </label>
        </form>
    </div>

</div>

{/if}
