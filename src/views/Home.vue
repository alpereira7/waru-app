<script setup lang="ts">
import WaruLogo from '@/assets/logo.png'
import Address from '@/components/Address.vue';
</script>



<template>
    <div class="flex flex-1 flex-col justify-between items-center pt-0 lg:pt-20 lg:px-20 max-w-screen-xl mx-auto">
        <div class="flex flex-1 flex-col mainCard">
            <div class="flex flex-none justify-center">
                <span class="lg:text-7xl text-4xl">Waru Protocol</span>
            </div>
            <div class="flex flex-1 flex-col lg:flex-row">
                <div class="flex flex-1 flex-col justify-center items-center p-16">
                    <img class="object-cover" :src="WaruLogo" />
                    <span class="font-bold">WARU Token</span>
                </div>
                <div class="flex flex-1 flex-col h-full justify-center space-y-8  ">
                    <div class="flex flex-col space-y-4">
                        <span class="text-3xl font-medium capitalize tracking-wider ">
                            Our Vision
                        </span>
                        <span class="text-lg">
                            Our vision is to bring new forms of value trough Multi-chain strategies and participation in
                            governance.
                            Rewarding holders and stakers in a simple maner while we keep a fair distribution of
                            ownership,
                            value and control.
                        </span>
                    </div>
                    <div class="flex flex-col space-y-4">
                        <span class="text-3xl font-medium capitalize tracking-wider ">
                            Contracts
                        </span>
                        <span class="text-lg">
                            WARU Contract Address: Coming Soon<br>
                            WUBI NFT Contract<br>
                            <p class="indent-4">
                                - WUBI NFT 210 Warrior’s: Coming Soon
                            </p>
                            WTC Multisig Adress:
                            <Address class="text-waruGreen-accent" address="0xC4ae728aC2a0f263A44A992Fd2B97798bE4342F0"
                                :copy="true" /><br>
                            WTR Multisig Adress:
                            <Address class="text-waruGreen-accent" address="0x672CeDBCE027E51888133312AaCaC2FF8e3614e6"
                                :copy="true" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex flex-none justify-center">
            <span class="lg:text-7xl text-4xl">The Team</span>
        </div>
    </div>
</template>

<style>
.mainCard {
    min-height: 90vh;
}
</style>
