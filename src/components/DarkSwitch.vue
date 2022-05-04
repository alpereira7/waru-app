<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { useGlobalStore } from '@/stores/global';
const globalStore = useGlobalStore()
const { getDarkMode } = storeToRefs(useGlobalStore())

</script>

<template>
    <div class="relative h-8 flex items-center rounded-full p-1 duration-300 cursor-pointer"
        :class="{ '': !getDarkMode }" :aria-checked="!getDarkMode.toString()" @click="globalStore.changeTheme()">
        <div
            class="flex shadow-md  dark:shadow-dark-level w-6 h-6 items-center justify-center rounded-full  transform duration-300">
            <transition name="fade-in-and-rotate" appear>
                <i :class="getDarkMode ? 'la-sun' : 'la-moon'" class="las text-lg text-darkShade dark:text-white"></i>
            </transition>
        </div>
    </div>
</template>