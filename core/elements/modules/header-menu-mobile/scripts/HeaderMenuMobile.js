/**
 * [HeaderMenuMobile] Класс для упраления мобильным меню
 *
 * У HTML элементов должны быть следующие обязательыне data аттрибуты
 * data-hmm-menu - Мобильное Меню
 * data-hmm-menu-open - Кнопка для открытия мобильного меню
 * data-hmm-tab - Таб с переданным в него ID
 * data-hmm-tab-open - Кнопка для открытия таба, с переданным ID таба
 * data-hmm-tab-back - Кнопка назад. Откроет прошлый активный таб
 *
 * Необязатльные аттрибуты
 * data-hmm-menu-open-tab - Указывается у кнопки открытия меню, при его наличии будет открыт переданный таб а не первая страница меню
 */

export default class HeaderMenuMobile {
  constructor() {
    this.store = {
      story: [], // История активных табов, используется для дальнейшего перехода "назад"
      current: null, // Текущая активная вкладка
      default: document.querySelector("[data-hmm-tab='main']"), // Дефолтная активная вкладка
    };

    this.initOpenMenuBtn();
    this.initCurrentTab();
    this.initBackButtons();
    this.initOpenButtons();
  }

  initOpenMenuBtn() {
    let btns = document.querySelectorAll("[data-hmm-menu-open]");
    let menu = document.querySelector("[data-hmm-menu]");
    let body = document.querySelector("body");

    if (!btns.length || !menu) {
      console.warn("[HeaderMenuMobile] Не найдены элементы");
      return;
    }

    // Открытие
    btns.forEach((btn) => {
      btn.addEventListener("click", (e) => {
        btn.classList.toggle("opened");
        menu.classList.toggle("opened");
        body.classList.toggle("freeze-page");

        // Открывает определенный таб если передан аттрибут - data-hmm-menu-open-tab
        let open_tab = btn.dataset.hmmMenuOpenTab;
        if (open_tab) {
          this.store.story = [this.store.default];
          this.store.current.classList.remove("active");
          this.store.current = document.querySelector(
            `[data-hmm-tab='${open_tab}']`
          );
          this.store.current.classList.add("active");
        }
      });
    });

    // Закрытие меню
    document.addEventListener("click", (e) => {
      // Проверяем является ли элемент частью кнопки для открытия
      let btn_contains;
      btns.forEach((btn) => {
        if (!btn_contains) btn_contains = btn.contains(e.target);
      });

      if (!menu.contains(e.target) && !btn_contains) {
        btns.forEach((btn) => {
          btn.classList.remove("opened");
        });
        menu.classList.remove("opened");
        body.classList.remove("freeze-page");
      }
    });
  }

  // Определяем активную вкладку
  initCurrentTab() {
    this.store.current = document.querySelector(".active[data-hmm-tab]");
    if (!this.store.current) {
      this.store.current = this.store.default;
      if (this.store.current) this.store.current.classList.add("active");
    }
  }

  // Метод для привязки событий к кнопкам "Назад"
  initBackButtons() {
    document.querySelectorAll("[data-hmm-tab-back]").forEach((button) => {
      button.addEventListener("click", () => {
        if (this.store.current) {
          this.store.current.classList.remove("active");
        }
        // Закрыли последнюю активную вкладку
        let past_active = this.store.story.pop();
        if (past_active) {
          this.addActiveClass(past_active);
          this.store.current = past_active;
        }
      });
    });
  }

  // Метод для привязки событий к кнопкам "Открыть"
  initOpenButtons() {
    document.querySelectorAll("[data-hmm-tab-open]").forEach((button) => {
      let tab_id = button.dataset["hmmTabOpen"];
      button.addEventListener("click", () => {
        // Закрыли текущий открытый таб
        if (this.store.current) {
          this.store.current.classList.remove("active");
          this.store.story.push(this.store.current);
        }

        // Открыли новую вкладку
        this.store.current = document.querySelector(
          `[data-hmm-tab="${tab_id}"]`
        );

        if (this.store.current) {
          this.addActiveClass(this.store.current);
        }
      });
    });
  }

  // Метод для добавления класса "active" с задержкой
  addActiveClass(elem) {
    setTimeout(() => {
      elem.classList.add("active");
    }, 200);
  }
}
