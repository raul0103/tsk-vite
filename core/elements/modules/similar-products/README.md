Похожие товары по опциям

## Вызов

```code
  {set $similar_products = "@FILE modules/similar-products/snippets/getSimilarProducts.php" | snippet : [
    'selection_option' => 'item_thickness',
    'main_options' => ['collection', 'item_width', 'item_length', 'produktovaya-lineyka'],
    'reserve_options' => ['plotnost'],
  ]}
```

## Доступные поля в JSON

```json
{
  "selection_option": "item_thickness", // Опция по которой будет выборка (список значений например толщин)
  "main_options": [
    "collection",
    "item_width",
    "item_length",
    "produktovaya-lineyka"
  ], // Опции по которым будет поиск похожих товаров
  "reserve_options": ["plotnost"], // Опции по которым будет поиск похожих товаров если первой выборки будет не достаточно
  "show_current": true // Показать ли в списке текущий ресурс
}
```
