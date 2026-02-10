import Swiper, { Lazy, Pagination } from "swiper";

function swiperInit() {
  // Находим все слайдеры с классом listing-gallery
  document.querySelectorAll('.listing-gallery').forEach((sliderEl, index) => {
    // Инициализируем Swiper для каждого слайдера
    const swiper = new Swiper(sliderEl, {
      loop: false,
      slidesPerView: 1,
      lazy: { loadPrevNext: true },
      pagination: {
        el: sliderEl.parentElement.querySelector('.swiper-pagination'), // ищем пагинацию рядом
        clickable: true,
      },
      direction: "horizontal",
    });

    // Создаем контейнер с зонами поверх слайдера
    // Проверяем, есть ли уже блок, чтобы не дублировать
    let zonesContainer = sliderEl.parentElement.querySelector('.hover-zones');
    if (!zonesContainer) {
      zonesContainer = document.createElement('div');
      zonesContainer.classList.add('hover-zones');
      // Помещаем блок с зонами в родительский контейнер слайдера, чтобы он был поверх
      sliderEl.parentElement.style.position = 'relative'; // чтобы absolute работал
      sliderEl.parentElement.appendChild(zonesContainer);

      // Задаём CSS для зон (можно вынести в CSS-файл)
      zonesContainer.style.position = 'absolute';
      zonesContainer.style.top = 0;
      zonesContainer.style.left = 0;
      zonesContainer.style.width = '100%';
      zonesContainer.style.height = '100%';
      zonesContainer.style.display = 'flex';
      zonesContainer.style.zIndex = 10;
    }

    // Получаем количество слайдов (без клонированных, если loop)
    const slidesCount = swiper.slides.length;

    // Очищаем контейнер с зонами
    zonesContainer.innerHTML = '';

    // Создаем зоны по количеству слайдов
    for (let i = 0; i < slidesCount; i++) {
      const zone = document.createElement('div');
      zone.classList.add('zone');
      zone.style.flex = '1';
      zone.style.cursor = 'pointer';

      // Чтобы зоны были прозрачными, но реагировали на наведение
      zone.style.background = 'transparent';

      zone.addEventListener('mouseenter', () => {
        swiper.slideTo(i);
      });

      zonesContainer.appendChild(zone);
    }
  });
}

// ajax подгрузка товаров
$(document).ajaxComplete(function (event, xhr, settings) {
  if (settings.url == "/assets/components/msearch2/action.php") {
    swiperInit();
  }
});

swiperInit();
