import Swiper, {Navigation,  Thumbs, Autoplay, Lazy} from 'swiper';

class CatalogSideBanner {
  constructor() {
    this.config = {
      swiperContainer: '.catalog-side-carousel .swiper',
      nextEl: '.catalog-side-carousel .swiper-button-next', //кнопки навигации слайдера
      prevEl: '.catalog-side-carousel .swiper-button-prev',
    };
  }

  initSlider(){
      Swiper.use([Navigation,  Autoplay, Lazy]);
      this.swiper = new Swiper(this.config.swiperContainer, {
        loop: true,
        autoplay: {
          delay: 3000,
        },
        slidesPerView: 1, 
        lazy: {loadPrevNext: true},
        observer: true,
        observeParents: true,
        navigation: {
            nextEl: this.config.nextEl,
            prevEl: this.config.prevEl
        },
        /*pagination: {
            el: ".sect-otzyvy .swiper-pagination",
            clickable: true
        },*/
        /*scrollbar: {draggable: true, el: ".sect-otzyvy .swiper-scrollbar"},*/
        /*breakpoints: { 
        }*/
      }); 
  }
  run() {
    this.initSlider();
  }
}

export {
  CatalogSideBanner
}
