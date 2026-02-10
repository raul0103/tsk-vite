import { defineConfig } from 'vite'
import path from 'path'

// -----------------------------
// Изменяемые параметры
// -----------------------------
const SRC_DIR = '_src-vite'               // исходники Vite
const DIST_DIR = 'dist'                   // папка сборки
const MAIN_FILE = 'js/main.js'            // входной файл
const HOST = 'localhost'                  // хост dev-сервера
const PORT = 5173                         // порт dev-сервера
const WATCH_DIR = 'core/elements'         // папка, за которой следим
const ENTRY_FILE_NAME = 'main.js'         // итоговое имя JS
const ASSET_FILE_NAME = '[name].[ext]'    // имена ассетов
// -----------------------------

export default defineConfig({
  build: {
    outDir: path.resolve(__dirname, DIST_DIR),
    emptyOutDir: true,
    rollupOptions: {
      input: path.resolve(__dirname, SRC_DIR, MAIN_FILE),
      output: {
        entryFileNames: ENTRY_FILE_NAME,
        assetFileNames: ASSET_FILE_NAME,
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
