<div class="popup" id="material-callback-modal">
  <form method="POST" action class="popup__form form">
    <p class="title-2 form__title">Спасибо за вашу заявку!</p>
    <div class="form__text">
      Ваш заказ будет обработан <b>быстрее</b>, если вы ответите на
      <b>3 вопроса</b>
    </div>
    <div class="form__inputs gap-16">
      <div class="form__group">
        <label class="bold">Какой материал вам необходим?</label>
        <input
          type="text"
          placeholder="Введите тип материала"
          name="material_type"
        />
      </div>

      <div class="form__group">
        <label class="bold">Какой объем необходим?</label>
        <input
          type="text"
          placeholder="Введите объем материала"
          name="material_volume"
        />
      </div>

      <div class="form__group">
        <label class="bold">Адрес доставки (город и район)</label>
        <input
          type="text"
          placeholder="Введите адрес"
          name="material_address"
        />
      </div>

      <div class="text-center">
        Благодаря дополнительной информации наш менеджер
        <b>СРАЗУ</b> предоставит вам расчёт!
      </div>
    </div>
    <button type="submit" class="form__button custom-btn w-100">Отправить</button>
    <label class="form__checkbox">
      <small class="text-center">
        Нажимая на кнопку, я соглашаюсь с политикой обработки персональных
        данных
      </small>
    </label>
  </form>
</div>
