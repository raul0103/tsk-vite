import { defineConfig } from 'vite'
import path from 'path'

// -----------------------------
// Изменяемые параметры
// -----------------------------
const SRC_DIR = '_src-vite' // исходники Vite
const DIST_DIR = 'dist' // папка сборки
const MAIN_FILE = 'js/main.js' // входной файл
const HOST = 'localhost' // хост dev-сервера
const PORT = 5173 // порт dev-сервера
const WATCH_DIR = 'core/elements' // папка, за которой следим и перезагружаем страницу при изменении

const CSS_FILE_NAME = 'css/[name]-[hash].[ext]'
const ENTRY_FILE_NAME = 'js/[name]-[hash].js'
const CHUNK_FILE_NAME = 'js/[name]-[hash].[ext]'
const IGNORE_FILE_NAME = 'ignore-assets/[name]'
// -----------------------------

export default defineConfig({
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

          return IGNORE_FILE_NAME // vite копирует не нужные нам асеты (картинки, шрифты и тд)
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
        // Действия при изменении файлов в core/elements
        if (file.indexOf(WATCH_DIR) > -1) {
          // Перезагрузка страницы
          server.ws.send({ type: 'full-reload' })
        }
      }
    }
  ]
})
