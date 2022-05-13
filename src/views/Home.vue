<script setup lang="ts">
import WaruLogo from '@/assets/logo.png'
import Tokenomics from '@/assets/tokenomics.jpg'
import Zap from '@/assets/zap.jpg'
import Rarity from '@/assets/rarity.jpg'
import Cycle from '@/assets/cycle.jpg'
import NFT from '@/assets/nft.jpg'
import WTR from '@/assets/wtr.jpg'
import Address from '@/components/Address.vue';

import Bio from '@/assets/bio.png'
import Abr from '@/assets/abraham.png'
import Tracker from '@/assets/tracker.png'
import Alex from '@/assets/alex.png'
const team = [
    {
        name: 'Biosensei',
        role: 'DAO & DEFI Researcher',
        description: 'Creates vision and strategy',
        imageUrl: Bio,
    },
    {
        name: 'Abraham',
        role: 'Community Guardian',
        description: 'Leader of our community',
        imageUrl: Abr,
    },
    {
        name: 'Tr4ck3r',
        role: 'Blockchain Developer',
        description: 'Development of Smart Contracts',
        imageUrl: Tracker,
    },
    {
        name: 'Alex',
        role: 'Blockchain Developer',
        description: 'WARU Token developer & Openswap.one developer',
        subDesc: 'Contributor for token Design',
        imageUrl: Alex,
    },
]
</script>



<template>
    <div class="flex flex-1 flex-col justify-between items-center pt-0 lg:pt-20 lg:px-20 max-w-screen-xl mx-auto">
        <div class="flex flex-1 flex-col ">
            <div class="flex flex-none justify-center flex-col items-center text-center">
                <span class="lg:text-7xl text-4xl">Waru Protocol</span>
                <p class="mt-8 text-lg font-semibold">
                    Waru Protocol is a token based protocol dedicated to governance and DEFI, our goal is to achieve
                    progressive decentralization and automation while creating multi-chain strategies that incentive and
                    reward our holders.
                </p>
            </div>
            <div class="flex flex-1 flex-col lg:flex-row lg:space-x-8 mt-8">
                <div class="flex flex-1 flex-col  items-center ">
                    <img class="object-cover" :src="WaruLogo" />
                    <span class="font-bold">WARU Token</span>
                </div>
                <div class="flex flex-1 flex-col h-full pt-16 space-y-16 ">
                    <div class="flex flex-col space-y-4">
                        <span class="text-3xl font-medium capitalize tracking-wider ">
                            Our Vision
                        </span>
                        <span class="text-lg">
                            Our vision is to bring new forms of value through Multi-chain strategies and participation
                            in
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
                            WUBI NFT Edition<br>
                            <p class="indent-4">
                                - WUBI NFT 210 Warrior’s:
                                <Address class="text-waruGreen-accent"
                                    address="0xeA380Be04a398d93030E4Bff15cBC87f6B35b5ae" :copy="true" />
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
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none justify-center">
                <span class="lg:text-7xl text-4xl">The Team</span>
            </div>
            <ul role="list"
                class="space-y-4 sm:grid sm:grid-cols-2 sm:gap-6 sm:space-y-0 lg:grid-cols-3 lg:gap-8 mt-12">
                <li v-for="teamMember in team" :key="teamMember.name"
                    class="py-10 px-6 bg-gray-400 bg-opacity-10 text-center rounded-lg xl:px-10 xl:text-left">
                    <div class="space-y-6 xl:space-y-10">
                        <img class="mx-auto h-40 w-40 rounded-lg xl:w-56 xl:h-56" :src="teamMember.imageUrl" alt="" />
                        <div class="space-y-2 xl:flex xl:items-center xl:justify-between">
                            <div class="font-medium text-lg leading-6 space-y-1">
                                <h3 class="font-semibold">{{ teamMember.name }}</h3>
                                <p class="text-waruGreen-accent">{{ teamMember.role }}</p>
                                <p class="text-sm">{{ teamMember.description }}</p>
                                <p class="text-xs" v-if="teamMember.subDesc">
                                    {{ teamMember.subDesc }}
                                </p>
                            </div>

                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none justify-center">
                <span class="lg:text-7xl text-4xl">WARU</span>
            </div>
            <div class="flex flex-none mt-12 text-center">
                <span class="text-xl">$WARU is our token for governance, it stores value through our fee mechanism and
                    makes *holders/stakers elegible to receive extra incentives through #WTC. It will be fairly
                    distributed with no whitelists or pre-sales with the idea of achieving progressive community
                    ownership and decentralization.
                    Has a 0.2% fee strategically design, backed by $FRAX $UST on #WTR</span>
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="Tokenomics" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none justify-center">
                <span class="lg:text-7xl text-4xl">WUBI</span>
            </div>
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-xl">
                <p>The 2100 W-UBI NFT Edition is a unique edition from Waru Protocol, it will give holders a passive
                    income (30% total generated) through our WTC strategies, this rewards are paid in yield tokens. We
                    are making this edition with 10 collections, 10 artists per collection and 210 NFTs per artist to
                    make the edition more unique. We are launching our initial colletion with @Yoichi has an artist to
                    make the initial 210 W-UBI WARrior’s
                </p>

            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="NFT" class="rounded-xl">
            </div>
        </div>

        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="Rarity" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-xl">
                <p>The Zap-locker (creates lp) with $WARU tokens and other assets like $DAI, $USDC etc... for the W.
                    Treasury Reserve.
                </p>
                <p>
                    This is something we want to implement with autonomous smart contracts with further development.
                </p>
                <p>
                    It will essentially, collect the swap fees and buy back $WARU
                    with customization for assets like ($DAI; $USDC etc.).
                </p>
                <p>
                    Uses 99% of the 0.1% from any swap to automatically create LP with $WARU-DAI and send it to a
                    multisig reserve (#WTR).
                </p>
                <p>
                    This removes circulation supply while growing a liquidity that progressively.
                    Until this contract and integration is fully developed we will do it manually each 30 days
                </p>
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="Cycle" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-xl">
                <p>The W. Treasury Cycle is a strategic yielding novel designed to generate value trough governance and
                    reward distribution.
                </p>
                <p>
                    * #WUBI Holders or/and Stakers of +10k $WARU will receive 30% rewards from W. Treasury Cycles. New
                    cycles and proposals can be made if there is enough fees on the #WTC, opening the possibility for
                    multiple cycles to be created if enough demand on volume is generated.
                </p>
                <p>
                    MIN: 100$ to start cycles or compound #WTC
                </p>
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="WTR" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-xl">
                <p>W. Treasury Reserve will work as a buffer for the $WARU token and help with value backing and
                    inflation. We believe that through fee locking buybacks and redistribution we don’t hold any user
                    with locked rewards and we can potentially offset a big part of inflation. This doesn’t mean that we
                    will not have deflationary aspects, beginning with Openswap.one being our power house that has
                    deflationary tokenomics.
                </p>
                <p>
                    #WTR will be kept as treasury until full depletion on mining rewards ( aprox 3 years, 1095 days). At
                    the end we will break the Lp and send the $WARU tokens accumulated again for the mining reward
                    distribution. All the other pairs will be used to create WTC cycles that will increase massively
                    after that day.
                </p>
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12 space-y-4 justify-center items-center">
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-2xl">
                <p>Launch on <a href="https://app.openswap.one/"
                        class="text-waruGreen-accent font-semibold">OpenSwap.one</a> soon!
                </p>
            </div>
            <div class="h-1 border-t border-gray-300 w-2/3">

            </div>
        </div>
    </div>
</template>

<style>
</style>
