<script setup lang="ts">
import WaruLogo from '@/assets/logo.png'
import MinterBox from '@/components/MinterBox.vue'
import { useGlobalStore } from '@/stores/global';
import { useWalletStore } from '@/stores/wallet';
const walletStore = useWalletStore()
const globalStore = useGlobalStore()
walletStore.loadInfo()
setInterval(() => {
    walletStore.loadInfo()
}, 30000);
globalStore.$onAction(
    ({
        name, // name of the action
        store, // store instance, same as `someStore`
        args, // array of parameters passed to the action
        after, // hook after the action returns or resolves
    }) => {
        after(() => {
            if (name === 'changeChainId') {
                walletStore.loadInfo()
            }
        })
    }
)
</script>

<template>
    <div
        class="flex flex-1 lg:flex-row flex-col justify-between items-center pt-0 lg:pt-20 lg:px-20 max-w-screen-xl mx-auto">
        <div class="flex flex-1 justify-center items-center lg:w-full lg:h-full w-2/3 h-2/3 lg:mt-0 mt-8">
            <img class=" w-full h-full object-cover" :src="WaruLogo" />
        </div>
        <div class="flex flex-1 flex-col h-full lg:items-start items-center ">
            <span class="text-3xl lg:text-7xl font-medium capitalize tracking-wider ">
                Waru Protocol
            </span>
            <div class="flex flex-1 w-full items-start mt-6 justify-center">
                <MinterBox />
            </div>
        </div>
    </div>
</template>