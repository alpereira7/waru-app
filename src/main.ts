import { createApp } from 'vue';
import App from './App.vue';
import router from './router/index';
import { createPinia } from 'pinia';
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
import '@/assets/tailwind.postcss'
import Toast, { PluginOptions } from "vue-toastification";
// Import the CSS or use your own!
import "@/assets/toast.scss";
const options: PluginOptions = {
    transition: "Vue-Toastification__fade",
    maxToasts: 20,
    newestOnTop: true
};

const app = createApp(App)
const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)
app.use(Toast, options);
app.use(pinia).use(router).mount('#app')
