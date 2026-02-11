/**
 * Класс работает с добавлением в статей в избранное
 * Работет с локальным зранилищем
 *
 * На кнопку добавления в изранное добавить 2 атрибута
 * data-article-favorite - Кнопка добавления
 * data-article-id - ID статьи. Добавится в хранилище
 *
 * На кол-во избранных
 * data-article-favorite-count
 */
export default class ArticleFavorite {
  constructor() {
    this.favorite_btns = document.querySelectorAll("[data-article-favorite]");
    this.favorite_link = document.querySelector("[data-article-favorite-link]");
    this.favorite_count = document.querySelectorAll(
      "[data-article-favorite-count]"
    );
  }

  init() {
    this.storage = new Storage();

    // Кнопки добавления
    this.favorite_btns.forEach((btn) => {
      // Прверяем является ли кнопка активной
      this.activated(btn);

      // Добавили сообытия
      btn.addEventListener("click", () => {
        this.favorite(btn);
        this.activated(btn);
        this.count();
      });
    });

    this.count();
  }

  // кол-во избранных
  count() {
    this.favorite_count.forEach((item) => {
      item.textContent = this.storage.get().length;
    });
  }

  activated(btn) {
    const article_id = btn.getAttribute("data-article-id");
    if (this.storage.check(article_id)) btn.classList.add("active");
    else btn.classList.remove("active");
  }

  favorite(btn) {
    const article_id = btn.getAttribute("data-article-id");

    this.storage.event(article_id);
  }
}

class Storage {
  constructor() {
    this.storage_key = "article-favorites";
  }

  get() {
    const storage = localStorage.getItem(this.storage_key)
      ? JSON.parse(localStorage.getItem(this.storage_key))
      : [];

    return storage;
  }

  save(storage) {
    localStorage.setItem(this.storage_key, JSON.stringify(storage));
    // Пришлось сохранять так же в сесии для получения на бэке
    $.ajax({
      method: "POST",
      dataType: "json",
      url: location.href,
      data: {
        ajax_action: "setSessionArticleFavorites",
        data: storage.join(","),
      },
      success: function (data) {
        console.log(data);
      },
      error: function (data) {
        console.log("error", data);
      },
    });
  }

  check(value) {
    const storage = this.get();

    if (storage.indexOf(value) !== -1) return true;
    else return false;
  }

  event(value) {
    const storage = this.get();

    if (this.check(value)) {
      storage.splice(storage.indexOf(value), 1);
    } else {
      storage.push(value);
    }

    this.save(storage);
  }
}
