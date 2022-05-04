
<script setup lang="ts">
import { toastMe } from '@/utility/functions';
import useClipboard from 'vue-clipboard3'
interface Address {
    address: string;
    copy: boolean;
}
let { address } = withDefaults(defineProps<Address>(), {
    address: '',
    copy: false
})
async function copyToken1() {
    const { toClipboard } = useClipboard()
    try {
        await toClipboard(address)
        toastMe('success', {
            title: 'Sucessfully Copied',
            link: false,
            href: '',
        })
    } catch (e) {
        console.error(e)
    }
}
</script>

<template>
    <span @click="copy ? copyToken1() : ''" :class="copy ? 'cursor-pointer' : ''">{{ address && address.slice(0, 6) +
            '...' +
            address.slice(38, 42)
    }}</span>
</template>