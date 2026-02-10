Модуль для отображения слайдера "Фото наших покупателей"

## Логика

- У товара в ТВ поле `customer_photos_path` - записывается путь до папки с галерей
- Сниппет `customer-photos/snippets/getCustomerPhotos.php` - получает по указанному пути все картинки и отдает их массивом
- Чанк `customer-photos/chunks/wrapper.tpl` - отдает на фронт

## Установка

- Создать TV поле `customer_photos_path`
