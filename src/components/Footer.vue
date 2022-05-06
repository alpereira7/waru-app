<script setup lang="ts">
import DarkSwitch from '@/components/DarkSwitch.vue';
import Linktree from '@/assets/linktree.svg';
const linktreeUrl = 'http://linktr.ee/WaruProtocol'
</script>



<template>
    <div class="flex p-3 py-8 xl:px-0 px-3 flex-none relative ">
        <div class="flex flex-none flex-col space-y-2">
            <a :href="linktreeUrl" target="_blank"
                class="relative h-8 flex items-center rounded-full p-1 duration-300 cursor-pointer">
                <div
                    class="flex shadow-md  dark:shadow-dark-level w-6 h-6 items-center justify-center rounded-full  transform duration-300">
                    <img class="w-5 h-5 text-waruGreen-accent" :src="Linktree">
                </div>
            </a>
            <DarkSwitch />
        </div>
    </div>
</template>


