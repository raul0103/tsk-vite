# Структура

```
_src-vite/          # исходники проекта
dist/               # папка сборки
core/elements/vite/production/
  ├─ css.tpl        # сгенерированные теги <link>
  └─ js.tpl         # сгенерированные теги <script>
core/elements/vite/development/
  └─ js.tpl         # вывод тегов для режима development <script>
```

#### core/elements/vite/production/

Файлы css и js имеют в названии hash. Поэтому для верного отображения ссылки на сайте необходимо после build обновлять файлы в core/elements/vite/production/ и так же деплоить на сервер

Файлы обновляет vite при build

# Начало работы

1. В корень проекта сделать git clone с заменой данных
2. В системных настройках сайта создать/изменить переменную - `APP_ENV=development`
3. Отключить локально https - dev режим работает по http
