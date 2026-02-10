import { defineConfig } from 'vite'
import path from 'path'

export default defineConfig({
  build: {
    outDir: path.resolve(__dirname, 'dist'),
    emptyOutDir: true,
    rollupOptions: {
      input: '_src-vite/js/main.js',
      output: {
        entryFileNames: 'main.js',
        assetFileNames: '[name].[ext]',
      },
    },
  },

  resolve: {
    alias: {
      '@': path.resolve(__dirname, '_src-vite'),
    },
  },

  server: {
    host: 'localhost',
    port: 5173,
    strictPort: true,
    cors: true,
  },


  plugins: [
    {
      hotUpdate({ file, server }) {
        // Действия при изменении файлов в core/elements
        if (file.indexOf('core/elements') > -1) {
          // Перезагрузка страницы
          server.ws.send({ type: 'full-reload' })
        }
      }
    }
  ]
})
