# Рекомеднации

- Версия Node.js >= 24.0.0

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

Файлы css и js имеют в названии hash. Поэтому для обращения к актуальным файлам, vite при `build` автоматически сгенерирует содержимое `core/elements/vite/production/js.tpl` и `core/elements/vite/production/css.tpl`

# Начало работы

1. В корень проекта сделать git clone с заменой данных
2. В системных настройках сайта создать/изменить переменную:

- `APP_ENV=development` - Теперь JS будет подгружаться из localhost:5173. Для этого запустите `npm run dev`

3. Отключить локально https, так как `dev` режим работает по http
4. После окончания работы необходмио запустить `npm run build` в результате чего в `core/elements/vite/production/` сгенерируются новые вызовы скриптов и стилей
