## Галерея для карточки товара

- getProductGallery.php - Кэшируемый сниппет, получает по id товара его галерею
- product-gallery.tpl - Вызывать в карточке товара передав его ID

### Зависимости

- core\elements\modules\custom-cache\CustomCache.php

### Примечания

НЕ ДЕЛАТЬ ПЛАГИН ФАЙЛОВЫМ! ПРЕДПОЛОЖИТЕЛЬНО ЧТО СОБЫТИЕ OnMediaSourceGetProperties ПОЛУЧАЕТ ФАЙЛ И ПЕРЕБИВАЕТ ОСТАЛЬНЫЕ

- Установить плагин plugins/rmCustomCacheListingGallery.php на события:
  - EmodImportStart
  - OnDocFormSave
