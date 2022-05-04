<script setup lang="ts">
import LoginButtons from '@/components/LoginButtons.vue'
import NftCard from '@/components/NftCard.vue'
import { useWalletStore } from '@/stores/wallet';
import { watch } from 'vue';
import { storeToRefs } from 'pinia'
import { useGlobalStore } from '@/stores/global';
const { nfts } = storeToRefs(useWalletStore())
const walletStore = useWalletStore()
const globalStore = useGlobalStore()
walletStore.loadNfts()
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
watch(() => walletStore.idsBalance, () => {
    walletStore.loadNfts()
})
</script>

<template>
    <div class="flex flex-1  flex-col items-center ">
        <div class="flex flex-none w-full justify-center">
            <div class="flex flex-1 max-w-md">
                <LoginButtons />
            </div>
        </div>
        <div class="flex flex-wrap justify-center mx-4 lg:mx-12 mt-12">
            <div class="flex flex-none p-2" v-for="nft in nfts">
                <NftCard :metadata-url="nft.metadata" :id="nft.id" />
            </div>
        </div>
    </div>
</template>