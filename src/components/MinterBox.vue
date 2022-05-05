<script setup lang="ts">
import MintingProcessModal from '@/components/MintingProcessModal.vue'
import LoginButtons from '@/components/LoginButtons.vue'
import Address from '@/components/Address.vue'
import { returnAmounts } from '@/utility/functions'
import { storeToRefs } from 'pinia';
import { useWalletStore } from '@/stores/wallet';
import { useGlobalStore } from '@/stores/global';
import { computed } from '@vue/reactivity'
import { BigNumber, utils } from 'ethers'
const { isSigned, maxAmount, totalAmountMinted, minting, cost, idsBalance, networkSupported } = storeToRefs(useWalletStore())
const { getContract } = storeToRefs(useGlobalStore())
const walletStore = useWalletStore()
const isEnd = computed(() => {
    return BigNumber.from(totalAmountMinted.value).eq(maxAmount.value)
})
</script>



<template>
    <div
        class="flex flex-1 flex-col w-full justify-start items-start p-8 bg-gray-400 bg-opacity-20 dark:bg-opacity-5  rounded-2xl space-y-6">
        <div class="flex flex-1 flex-col space-y-2">
            <MintingProcessModal :modal-open="minting" />
            <span class="text-2xl">W-UBI Warriors Minting</span>
            <span class=" text-sm whitespace-pre-wrap">The W-UBI NFT Collection is a unique edition from Waru Protocol
                that allow holders to
                receive rewards produced with WTC strategies.
                <br>To know more click
                <router-link to="/" class="text-waruGreen-accent font-bold">here</router-link>
            </span>
        </div>
        <div class="flex flex-1 w-full flex-col space-y-1" v-if="networkSupported">
            <span v-if="isSigned" class="text-sm">Wallet balance:
                <span class="text-waruGreen-accent font-bold">
                    {{
                            idsBalance.length
                    }}
                </span>
            </span>
            <span>Contract Address:
                <Address :class="'text-waruGreen-accent font-bold text-lg'" :address="getContract" :copy="true" />
            </span>
            <span>Mint Price: <span class="text-waruGreen-accent font-bold text-lg">{{
                    returnAmounts(utils.formatUnits(cost, 18))
            }} ONE</span></span>
            <span>Minted: <span class="text-waruGreen-accent text-lg font-bold">{{ totalAmountMinted }} / {{ maxAmount
            }}</span></span>
        </div>
        <div v-else class="flex flex-1 w-full">
            <div type="button"
                class="flex-1 flex-col space-y-1 w-full bg-gray-400 bg-opacity-20 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-red-500 focus:outline-none ">
                <span class="text-base">
                    Network not available for minting
                </span>
                <span class="text-xs">Check your wallet settings</span>
            </div>
        </div>
        <div class="flex flex-1 w-full" v-if="networkSupported">
            <button type="button" v-if="isSigned && !isEnd" @click="walletStore.mint()" :disabled="minting"
                class="flex-1 w-full  bg-gray-800 bg-opacity-80 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-opacity-90 focus:outline-none ">
                <span class="text-base">
                    Mint
                </span>
            </button>
            <div type="button" v-if="isEnd"
                class="flex-1 flex-col space-y-1 w-full bg-gray-400 bg-opacity-20 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-red-500 focus:outline-none ">
                <span class="text-base">
                    Mint Ended
                </span>
                <span class="text-xs">Reached {{ maxAmount }} army ({{ totalAmountMinted }} / {{ maxAmount }})</span>
            </div>
        </div>
        <LoginButtons />
    </div>
</template>


