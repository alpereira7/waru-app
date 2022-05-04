<script setup lang="ts">


interface Toaster {
    title?: string,
    link?: string,
    msg: string,
    href?: string
}
const { title, link, msg, href } = withDefaults(defineProps<Toaster>(), {
    title: '',
    link: '',
    msg: '',
    href: '',
})
</script>

<template>
    <div class="flex flex-col ml-3 space-y-1 my-1 break-all">
        <div v-if="title" class="flex">
            <p class="text-sm">{{ title }}</p>
        </div>
        <div v-if="link" class="flex items-start space-x-1 px-2 rounded-lg bg-opacity-100 hover:bg-opacity-5 ">
            <i class="las la-link pt-2"></i>
            <a target="_blank" :href="href" class="text-xs p-1 px-2 rounded-lg" v-html="msg"></a>
        </div>
        <div v-else class="flex">
            <div v-html="msg" class="text-xs"></div>
        </div>
    </div>
</template>