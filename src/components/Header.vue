<script setup lang="ts">
import WaruLogo from '@/assets/logo.png'
const routes = [
    {
        icon: 'las la-pen',
        name: 'Minter',
        url: '/minter'
    },
    {
        icon: 'las la-user',
        name: 'My Nfts',
        url: '/my-nfts'
    },
]

</script>

<template>
    <header class="max-w-screen-xl mx-auto w-full flex justify-between h-14 py-9 xl:px-0 px-3 items-center">
        <router-link to="/">
            <div class="ss:hidden xs:flex flex-none">
                <img alt="OpenSwap" :src="WaruLogo" class="ss:h-6 xs:h-10" />
            </div>
            <div class="ss:flex xs:hidden flex-none">
                <img alt="OpenSwap" :src="WaruLogo" class="ss:h-6" />
            </div>
        </router-link>
        <div class="flex items-center lg:space-x-0 space-x-1 text-gray-500 ">
            <router-link v-for="route in routes" :to="route.url"
                class="flex items-center space-x-2 p-2 px-1 md:px-3 rounded-lg  outline-none hover:text-waruGreen-accent">
                <i :class="route.icon" class="text-xl "></i>
                <p class="text-sm hidden md:block ">{{ route.name }}</p>
            </router-link>
        </div>
    </header>
</template>