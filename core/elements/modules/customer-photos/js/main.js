import Swiper from "swiper";

try {
  new Swiper('[data-swiper="customer-photos"]', {
    loop: false,
    spaceBetween: 16,
    slidesPerView: "auto",
    lazy: { loadPrevNext: true },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
} catch {
  console.error("ERROR MODULE - customer-photos");
}
