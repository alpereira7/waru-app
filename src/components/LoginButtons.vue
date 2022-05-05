<script setup lang="ts">
import { useWalletStore } from '@/stores/wallet';
import { storeToRefs } from 'pinia';
import Address from '@/components/Address.vue'
import Metamask from '@/assets/metamask.svg'
import WalletConnect from '@/assets/wallet-connect.svg'
const walletStore = useWalletStore()
const { isSigned, userAddress } = storeToRefs(useWalletStore())
</script>



<template>
    <div class="flex flex-none  w-full flex-col space-y-2">
        <button type="button" @click="walletStore.disconnect()" v-if="isSigned"
            class="  bg-waruGreen-accent bg-opacity-80 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-opacity-90 focus:outline-none ">
            <span class="text-base">
                Connected with
                <Address :address="userAddress" />
            </span>
        </button>
        <template v-else>
            <button type="button" @click="walletStore.connect()"
                class=" bg-metamask bg-opacity-80 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-opacity-90 focus:outline-none ">
                <img class="w-7 h-7 mr-2" :src="Metamask">
                <span class="text-base">MetaMask</span>
            </button>
            <!-- <button type="button" @click="walletStore.connectWalletConnect()"
                class=" bg-walletconnect text-white bg-opacity-80 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium  hover:bg-opacity-90 focus:outline-none ">
                <img class="w-7 h-7 mr-2" :src="WalletConnect">
                <span class="text-base">WalletConnect</span>
            </button> -->
        </template>
    </div>
</template>


