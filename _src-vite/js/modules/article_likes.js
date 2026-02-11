/**
 * data-article-like
 * data-article-like-count
 * data-article-id
 */
export default class ArticleLike {
  constructor() {
    this.like_btn = document.querySelector("[data-article-like]");
    this.like_count = document.querySelector("[data-article-like-count]");
    this.article_id = +this.like_btn?.getAttribute("data-article-id");
  }

  init() {
    if (this.like_btn) {
      this.storage = new StorageLike();

      this.like_btn.addEventListener("click", () => {
        this.like();
        this.activated();
        this.count();
      });

      this.activated();
      this.count(true);
    }
  }

  count(increment) {
    let count = +this.like_count.textContent;

    if (increment)
      count = this.storage.check(this.article_id) ? count + 1 : count;
    else count = this.storage.check(this.article_id) ? count + 1 : count - 1;
    this.like_count.textContent = count;
  }

  activated() {
    if (this.storage.check(this.article_id))
      this.like_btn.classList.add("active");
    else this.like_btn.classList.remove("active");
  }

  like() {
    this.storage.event(this.article_id);
  }
}

class StorageLike {
  constructor() {
    this.storage_key = "article-likes";
  }

  get() {
    const storage = localStorage.getItem(this.storage_key)
      ? JSON.parse(localStorage.getItem(this.storage_key))
      : [];

    return storage;
  }

  save(storage, article_id) {
    localStorage.setItem(this.storage_key, JSON.stringify(storage));

    $.ajax({
      method: "POST",
      dataType: "json",
      url: location.href,
      data: {
        ajax_action: "articleLike",
        article_id,
        increment: this.check(article_id),
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

    this.save(storage, value);
  }
}
