
class ReviewsPopup{
  /*
    @param container - всплывающее окно, к которому прикрепить обработчик
    @param close - кнопка закрытия всплывашки
    @param timeout - время до появления в мс
    @param show_class, hide_class - классы для анимации показа и сокрытия
    //@param duration - время показа анимации в мс (не используется, но может в будущем)
  */
  constructor(config = {}){
    const defaultConfig = {
      container: '.js-reviews-popup',
      close: '.js-reviews-popup__close',
      timeout: 5000,
      show_class: 'reviews-popup--fade-in',
      hide_class: 'reviews-popup--fade-out'
    };
    this.config = Object.assign({}, defaultConfig, config);

    this.popup = body.querySelector(this.config.container);
    if(!this.popup)throw "Popup not found";
    this.close_btn = body.querySelector(this.config.close);
    if(!this.close_btn)throw "close_btn not found"
    const host = this;
    this.closeHandler = function(e){
      e.preventDefault();
      e.stopPropagation();
      host.hide();
    }
  }

  bind(){
    try{
      setTimeout(() => {
        this.show();
      }, this.config.timeout);
      this.close_btn.removeEventListener('click', this.closeHandler); //Чтобы не повесить дубликат обработчика при повторном вызове функции
      this.close_btn.addEventListener('click', this.closeHandler);
    }catch(t){
      console.error('Bind failed');
    }
  }

  show(){
    this.popup.classList.remove(this.config.hide_class);
    this.popup.classList.add(this.config.show_class);
  }

  hide(){
    this.popup.classList.remove(this.config.show_class);
    this.popup.classList.add(this.config.hide_class);
  }

}

export {
  ReviewsPopup
}