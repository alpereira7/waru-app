<script setup lang="ts">
const timeline = [
    {
        content: `
        <p>First WUBI NFT collection</p><br>
        <p>Launch of $WARU Token</p><br>
        <p>Airdrop Claim</p><br>
        <p>#WTC first cycle</p><br>
        <p>$WARU - $OpenX LP</p><br>
    `,
        date: '2022 Q3',
        progress: true,
    },
    {
        content: `
        <p>3 New collections for #WUBI</p><br>
        <p>Solo Stake pool For #WTC</p><br>
        <p>Mining Rewards and LP start </p><br>
        <p>Start updating our page to have a more intuitive proposal management for #WTC</p><br>
    `,
        date: '2022 Q4',
        progress: false,
    },
    {
        content: `
        <p>3 New collections for #WUBI </p><br>
        <p>Create level Pools on our page integrated with Openswap for swaps</p><br>
        <p>Create analytics that track our treasury and cycle strategies</p><br>
    `,
        date: '2023 Q1',
        progress: false,
    },
    {
        content: `
        <p>Deploy on multichains (EVM) with bridge integration like Anycall, Xassets, Omnichain</p><br>
        <p>Create a seamless integration of our page with this said chains</p><br>
    `,
        date: '2023 Q2',
        progress: false,
    },
]
</script>



<template>
    <div class="flex flex-1 flex-col justify-between items-center pt-0 lg:pt-20 lg:px-20 max-w-screen-xl mx-auto">
        <div class="flex flex-1 flex-col ">
            <div class="flex flex-none justify-center flex-col items-center text-center">
                <span class="lg:text-7xl text-4xl">Waru Protocol's Roadmap</span>
            </div>
            <div class="flow-root mt-12">
                <ul role="list" class="-mb-8">
                    <li v-for="(event, eventIdx) in timeline" :key="event.date">
                        <div class="relative pb-8">
                            <span v-if="eventIdx !== timeline.length - 1"
                                class="absolute top-4  left-4 -ml-px h-full self-center w-0.5  bg-waruGreen-accent"
                                aria-hidden="true" />
                            <div class="relative flex space-x-3 ">
                                <div>
                                    <span
                                        :class="event.progress ? 'bg-waruGreen-primary' : ' bg-white dark:bg-darkShade ring-2 ring-gray-500'"
                                        class="h-8 w-8 rounded-full flex items-center justify-center ">
                                    </span>
                                </div>
                                <div class="min-w-0 flex-1 pt-1.5 flex justify-between space-x-4">
                                    <div>
                                        <p class="text-sm " v-html="event.content">
                                        </p>
                                    </div>
                                    <div
                                        class="text-right items-center text-lg whitespace-nowrap text-waruGreen-accent">
                                        <time :datetime="event.date">{{ event.date }}</time>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<style>
</style>
