import { defineConfig } from 'vite'
import path from 'path'
import fs from 'fs'

// -----------------------------
// Изменяемые параметры
// -----------------------------
const SRC_DIR = '_src-vite' // исходники Vite
const DIST_DIR = 'dist' // папка сборки
const MAIN_FILE = 'js/main.js' // входной файл
const HOST = 'localhost' // хост dev-сервера
const PORT = 5173 // порт dev-сервера
const WATCH_DIR = 'core/elements' // папка, за которой следим и перезагружаем страницу при изменении
const IGNORE_ASSETS = `${DIST_DIR}/ignore-assets` // папка куда будут скопированы файлы после build. vite делает это автоматом и данные файлы не нужны

const CSS_FILE_NAME = 'css/[name]-[hash].[ext]'
const ENTRY_FILE_NAME = 'js/[name]-[hash].js'
const CHUNK_FILE_NAME = 'js/[name]-[hash].js'
const IGNORE_FILE_NAME = 'ignore-assets/[name]'

const CSS_TEMPLATE = 'core/elements/vite/production/css.tpl' // Шаблон для вывода стилей
const JS_TEMPLATE = 'core/elements/vite/production/js.tpl' // Шаблон для вывода стилей
// -----------------------------

export default defineConfig({
  base: `/${DIST_DIR}/`,
  build: {
    outDir: path.resolve(__dirname, DIST_DIR),
    emptyOutDir: true,
    rollupOptions: {
      input: path.resolve(__dirname, SRC_DIR, MAIN_FILE),
      output: {
        entryFileNames: ENTRY_FILE_NAME,
        chunkFileNames: CHUNK_FILE_NAME,

        assetFileNames: (assetInfo) => {
          if (/\.(css)$/.test(assetInfo.name ?? '')) return CSS_FILE_NAME;

          return IGNORE_FILE_NAME
        }
      },
    },
  },

  resolve: {
    alias: {
      '@': path.resolve(__dirname, SRC_DIR),
    },
  },

  server: {
    host: HOST,
    port: PORT,
    strictPort: true,
    cors: true,
  },

  plugins: [
    {
      hotUpdate({ file, server }) {
        utils.fileWatcher(file, server)
      }
    },
    {
      generateBundle(options, bundle) {
        utils.generateBundleTpls(bundle)
      }
    },
    {
      closeBundle() {
        utils.deleteIgnoreAssets()
      }
    }
  ]
})

const utils = {
  // Обновит вывод файлов на сайте с актуальным хэшем
  generateBundleTpls: (bundle) => {
    const css_files = [];
    const js_files = [];

    // Собираем JS и CSS файлы
    for (const fileName in bundle) {
      if (fileName.endsWith('.css')) css_files.push(fileName);
      // Подгружаем только файл main.js
      // остальные скрипты подтягиваться чанками вызванными из main.js
      if (fileName.indexOf('main') > -1 && fileName.endsWith('.js')) js_files.push(fileName);
    }

    // Генерируем строки <link> и <script>
    const css_items = css_files.map(f => `<link rel="stylesheet" href="/${DIST_DIR}/${f}">`).join('\n');
    const js_items = js_files.map(f => `<script type="module" src="/${DIST_DIR}/${f}"></script>`).join('\n');

    // Пишем шаблоны
    const css_tpl = path.resolve(__dirname, CSS_TEMPLATE);
    const js_tpl = path.resolve(__dirname, JS_TEMPLATE);

    fs.writeFileSync(css_tpl, css_items, 'utf-8');
    fs.writeFileSync(js_tpl, js_items, 'utf-8');
  },
  // Удалить скопированные vite файлы. Они не нужны
  deleteIgnoreAssets: () => {
    const dir = path.resolve(__dirname, IGNORE_ASSETS)
    fs.rmSync(dir, { recursive: true, force: true })
  },
  fileWatcher: (file, server) => {
    // Действия при изменении файлов в core/elements
    if (file.indexOf(WATCH_DIR) > -1) {
      // Перезагрузка страницы
      server.ws.send({ type: 'full-reload' })
    }
  }
}