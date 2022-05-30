<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useGlobalStore } from '@/stores/global';
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'
import { useWalletStore } from './stores/wallet';
const { theme } = storeToRefs(useGlobalStore())
const globalStore = useGlobalStore();
const walletStore = useWalletStore();
if (globalStore.autoConnect) {
  walletStore.connectAnyWallet()
}

if (window.ethereum) {
  window.ethereum.on('chainChanged', async () => {
    const walletStore = useWalletStore()
    if (globalStore.autoConnect) {
      walletStore.setupWallet('metamask')
    }
  })
  window.ethereum.on('accountsChanged', () => {
    //window.location.reload();
  });
}

</script>

<template>
  <div :class="theme">
    <div id="root" class="antialiased bg-white dark:bg-darkShade ">
      <div
        class="flex flex-col flex-1 min-h-screen mx-auto justify-center text-gray-700 dark:text-white overflow-hidden">
        <div class="fixed top-0 right-0 left-0  z-90 bg-white dark:bg-darkShade">
          <div class="max-w-screen-xl mx-auto">
            <Header />
          </div>
        </div>
        <div class="flex flex-1 lg:py-20 mx-3 lg:mx-0 mt-14 lg:mt-0 min-h-full">
          <router-view />
        </div>
        <div class="fixed bottom-0 max-w-screen-xl right-4 ">
          <Footer />
        </div>
      </div>
    </div>
  </div>
</template>