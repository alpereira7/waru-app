import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import legacy from '@vitejs/plugin-legacy'
import { resolve } from 'path'
import GlobalsPolyfills from '@esbuild-plugins/node-globals-polyfill';
import NodeModulesPolyfills from '@esbuild-plugins/node-modules-polyfill';
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    legacy({
      targets: ['defaults', 'not IE 11']
    }),
  ],
  optimizeDeps: {
    esbuildOptions: {
      plugins: [
        NodeModulesPolyfills(),
        GlobalsPolyfills({
          process: true,
          buffer: true,
        }),
      ],
    },
  },
  build: {
    commonjsOptions: {
      transformMixedEsModules: true,
    },
    rollupOptions: {
      preserveEntrySignatures: 'strict',
      plugins: [
        NodeModulesPolyfills(),
        GlobalsPolyfills({
          process: true,
          buffer: true,
        }),
      ]
    }
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, './src'),
      '@walletconnect/web3-provider': resolve(__dirname, './node_modules/@walletconnect/web3-provider/dist/umd/index.min.js')
    },
  },
})
