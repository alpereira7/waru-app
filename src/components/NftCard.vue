
<script setup lang="ts">
import axios from 'axios'
import { Ref, ref } from 'vue';
import { toastMe } from '@/utility/functions';
import useClipboard from 'vue-clipboard3'
interface NftCard {
    metadataUrl: string;
    id: string;
}
let { metadataUrl, id } = withDefaults(defineProps<NftCard>(), {
    metadataUrl: '',
    id: ''
})
let isError = ref(false)
let metadata: Ref<any> = ref({})
axios.get(metadataUrl, {}).then((result) => {
    if (result.status === 200) {
        const urlImage = result.data?.image.replace('ipfs://', 'https://ipfs.io/ipfs/')
        metadata.value = { ...result.data, image: urlImage }
    }
}).catch(() => {
    isError.value = true
})
async function copyMetadata() {
    const { toClipboard } = useClipboard()
    try {
        await toClipboard(JSON.stringify(metadata.value))
        toastMe('success', {
            title: 'Metadata Copied',
            link: false,
            href: '',
        })
    } catch (e) {
        console.error(e)
    }
}
</script>

<template>
    <div class="flex flex-1 flex-col px-4 py-2 rounded-lg bg-gray-400 bg-opacity-20 dark:bg-opacity-5 justify-center">
        <span class="text-lg text-center font-bold tracking-wider">{{ metadata.name }} </span>
        <span class="text-lg text-center text-waruGreen-accent font-semibold"># {{ id }}</span>
        <img class="nft-img rounded-md mt-2" :src="metadata?.image">
        <div class="flex flex-1 justify-center space-x-4 my-2">
            <button @click="copyMetadata()" class="outline-none">
                <i class="las la-copy text-waruGreen-accent text-lg"></i>
            </button>
            <a :href="metadata?.image" target="_blank" class="outline-none">
                <i class="las la-eye text-waruGreen-accent text-lg"></i>
            </a>
        </div>
    </div>
</template>

<style>
.nft-img {
    height: 300px;
    width: 300px;
}
</style>