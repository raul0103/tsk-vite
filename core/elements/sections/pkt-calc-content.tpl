<div class="pkt-calc">
  <div class="pkt-calc__materials">
    <ul class="pkt-calc__materials">
      <li class="active" id="sect1">
        <input
          class="type__list-radio"
          type="radio"
          name="pkt-calc__materials"
          id="sotpolk"
          value="15"
          checked="checked"
        /><label for="sotpolk">Сотовый поликарбонат</label>
      </li>
      <li id="sect2">
        <input
          class="type__list-radio"
          type="radio"
          name="pkt-calc__materials"
          id="monpolk"
          value="16"
        /><label for="monpolk">Монолитный поликарбонат</label>
      </li>
    </ul>
  </div>
  <div class="pkt-calc__type">
    <span class="pkt-calc__type__title">Тип постройки</span>
    <ul class="pkt-calc__type__list">
      <li>
        <input
          class="pkt-calc__type__list-radio"
          type="radio"
          name="construction"
          id="zabor"
          value="0"
          checked=""
        />
        <label for="zabor">
          <div
            class="pkt-calc__type__img pkt-calc__img-zabor pkt-calc__img-zabor_active"
          ></div>
          <div class="pkt-calc__hidden-name">
            <p class="pkt-calc__hidden-name__title">Забор</p>
            <img
              src="/assets/template/img/pkt-calc/rectangle-gray.png"
              class="pkt-calc__hidden-name__rect"
            />
          </div>
        </label>
      </li>
      <li>
        <input
          class="pkt-calc__type__list-radio"
          type="radio"
          name="construction"
          id="arc"
          value="1"
        />
        <label for="arc">
          <div class="pkt-calc__type__img pkt-calc__img-arc"></div>
          <div class="pkt-calc__hidden-name">
            <p class="pkt-calc__hidden-name__title">Арочная конструкция</p>
            <img
              src="/assets/template/img/pkt-calc/rectangle-gray.png"
              class="pkt-calc__hidden-name__rect"
            />
          </div>
        </label>
      </li>
      <li>
        <input
          class="pkt-calc__type__list-radio"
          type="radio"
          name="construction"
          id="gable"
          value="2"
        />
        <label for="gable">
          <div class="pkt-calc__type__img pkt-calc__img-gable"></div>
          <div class="pkt-calc__hidden-name">
            <p class="pkt-calc__hidden-name__title">Двускатный навес</p>
            <img
              src="/assets/template/img/pkt-calc/rectangle-gray.png"
              class="pkt-calc__hidden-name__rect"
            />
          </div>
        </label>
      </li>
      <li>
        <input
          class="pkt-calc__type__list-radio"
          type="radio"
          name="construction"
          id="lean-to"
          value="3"
        />
        <label for="lean-to">
          <div class="pkt-calc__type__img pkt-calc__img-arcuate"></div>
          <div class="pkt-calc__hidden-name">
            <p class="pkt-calc__hidden-name__title">Односкатный козырек</p>
            <img
              src="/assets/template/img/pkt-calc/rectangle-gray.png"
              class="pkt-calc__hidden-name__rect"
            />
          </div>
        </label>
      </li>
      <li>
        <input
          class="pkt-calc__type__list-radio"
          type="radio"
          name="construction"
          id="arcuate"
          value="4"
        />
        <label for="arcuate">
          <div class="pkt-calc__type__img pkt-calc__img-lean-to"></div>
          <div class="pkt-calc__hidden-name">
            <p class="pkt-calc__hidden-name__title">Дугообразный козырек</p>
            <img
              src="/assets/template/img/pkt-calc/rectangle-gray.png"
              class="pkt-calc__hidden-name__rect"
            />
          </div>
        </label>
      </li>
    </ul>
  </div>

  <div class="pkt-calc__box">
    <div class="pkt-calc__dimension">
      <div class="h5">Габариты конструкции</div>
      <div class="group length">
        <label for="length">Длина A (м):</label
        ><input type="text" class="field" id="length" />
      </div>
      <div class="group width" style="display: none">
        <label for="width">Ширина B (м):</label
        ><input type="text" class="field" id="width" />
      </div>
      <div class="group height">
        <label for="height">Высота H (м):</label
        ><input type="text" class="field" id="height" />
      </div>
      <div class="ortitle" style="display: none">или</div>
      <div class="group arc-length" style="display: none">
        <label for="arc-length">Длина дуги L (м):</label
        ><input type="text" class="field" id="arcLength" />
      </div>
      <div class="group skat-1" style="display: none">
        <label for="arc-length">Длина ската 1 (м):</label
        ><input type="text" class="field" id="skat_1" />
      </div>
      <div class="group skat-2" style="display: none">
        <label for="arc-length">Длина ската 2 (м):</label
        ><input type="text" class="field" id="skat_2" />
      </div>
      <div class="obr">
        <div class="h5">Обрешетка</div>
        <div class="group obr-length">
          <label for="obr-length">Сторона C (cм):</label
          ><input type="text" class="field" id="obr-length" />
        </div>
        <div class="group obr-height">
          <label for="obr-height">Сторона D (cм):</label
          ><input type="text" class="field" id="obr-height" />
        </div>
      </div>
    </div>
    <div class="pkt-calc__img-construct">
      <div class="pkt-calc__img-type pkt-calc__img-zabortype_active"></div>
    </div>
  </div>
  <div class="pkt-calc__controls">
    <input type="button" class="btn calculate" value="Рассчитать количество" />
  </div>
  <div class="pkt-calc__result"></div>
  {*
  <div class="pkt-calc__products">
    <div class="pkt-calc__products-title"></div>
    <div class="pkt-calc__products-row swiper-container">Пусто</div>
  </div>
  *}

  <section class="pkt-calc__products product-slider sect-pop">
    <div class="wrapper sect-pop__wrapper">
      <h2 class="sect-pop__title title-2">Подобранные товары</h2>
      <div class="swiper-buttons sect-pop__swiper-buttons">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper sect-pop__slider">Пусто</div>
        <div class="swiper-scrollbar"></div>
      </div>
    </div>
  </section>
</div>
