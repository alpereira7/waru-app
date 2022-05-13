import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  { path: "/", name: 'Home', component: () => import('@/views/Home.vue'), },
  { path: "/minter", name: 'Minter', component: () => import('@/views/Minter.vue'), },
  { path: "/roadmap", name: 'Roadmap', component: () => import('@/views/Roadmap.vue'), },
  { path: "/my-nfts", name: 'My Nfts', component: () => import('@/views/MyNfts.vue'), },
];

const router = createRouter({
  scrollBehavior() {
    return { left: 0, top: 0, behavior: 'smooth' };
  },
  history: createWebHistory(),
  routes,
});

export default router;
