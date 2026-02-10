import Swiper, {Navigation, Pagination, Scrollbar, Thumbs, Autoplay, Lazy} from 'swiper';
try{
  Swiper.use([Navigation, Pagination, Scrollbar, Thumbs, Autoplay, Lazy]);
  
  // Галерея на странице товара без перелинковки и с перелинковкой с кнопками
  new Swiper(".main_slider_type1", {
      loop: true,
      spaceBetween: 0,
      autoHeight: 1,
      lazy: {loadPrevNext: true},
      centeredSlides: true,
        autoplay: {
          delay: 5000,
          disableOnInteraction: false,
        },
    
      grabCursor: true,
      
      navigation: {
          nextEl: ".main_slider_type1_next",
          prevEl: ".main_slider_type1_prev"
      },
      pagination: {
          el: ".pagination_row",
        },
  });
}
catch(e){
  console.error("Ошибка модуля MainBanner: " + e);
}
