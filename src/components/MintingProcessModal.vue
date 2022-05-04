<script setup lang="ts">
import MintingVideo from '@/assets/minting.mp4';
import { useGlobalStore } from '@/stores/global';
import {
    TransitionRoot,
    TransitionChild,
    Dialog,
    DialogOverlay,
} from '@headlessui/vue'
import { storeToRefs } from 'pinia';
const { theme } = storeToRefs(useGlobalStore())
const { modalOpen } = defineProps({
    modalOpen: Boolean,
})

</script>
<template>
    <TransitionRoot appear :show="modalOpen" as="template" :class="theme">
        <Dialog as="div">
            <div class="fixed inset-0 bg-black/40" aria-hidden="true" />
            <div class="fixed inset-0 z-10 overflow-y-auto text-gray-700 dark:text-white">
                <div class="min-h-screen px-4 text-center">
                    <TransitionChild as="template" enter="duration-300 ease-out" enter-from="opacity-0"
                        enter-to="opacity-100" leave="duration-200 ease-in" leave-from="opacity-100"
                        leave-to="opacity-0">
                        <DialogOverlay class="fixed inset-0" />
                    </TransitionChild>
                    <span class="inline-block h-screen align-middle" aria-hidden="true">
                        &#8203;
                    </span>
                    <TransitionChild as="template" enter="duration-300 ease-out" enter-from="opacity-0 scale-95"
                        enter-to="opacity-100 scale-100" leave="duration-200 ease-in" leave-from="opacity-100 scale-100"
                        leave-to="opacity-0 scale-95">
                        <div
                            class="inline-block w-full max-w-md p-6 my-8 overflow-hidden text-left align-middle transition-all transform  shadow-xl rounded-2xl bg-white dark:bg-darkShade">
                            <div class="flex flex-1 justify-center items-center w-full flex-col space-y-4 text-center">
                                <video class="video rounded-lg" id="mintingVideo" width="300" height="300" autoplay loop
                                    muted>
                                    <source :src="MintingVideo" type="video/mp4">
                                </video>
                                <span class="text-2xl font-bold">Minting your W-UBI Warrior</span>
                                <span class="text-xs font-medium">*Please check your wallet and accept the transaction
                                    to
                                    proceed!</span>
                            </div>
                        </div>
                    </TransitionChild>
                </div>
            </div>
        </Dialog>
    </TransitionRoot>
</template>


