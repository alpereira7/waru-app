<script setup lang="ts">
import WaruLogo from '@/assets/logo.png'
import Tokenomics from '@/assets/tokenomics.jpg'
import Zap from '@/assets/zap.jpg'
import Rarity from '@/assets/rarity.jpg'
import Cycle from '@/assets/cycle.jpg'
import NFT from '@/assets/nft.jpg'
import WTR from '@/assets/wtr.jpg'
import Address from '@/components/Address.vue';
const team = [
    {
        name: 'Biosensei',
        role: 'DAO & DEFI Researcher',
        description: 'Creates vision and strategy',
        imageUrl: 'src/assets/bio.png',
    },
    {
        name: 'Abraham',
        role: 'Community Guardian',
        description: 'Leader of our community',
        imageUrl: 'src/assets/abraham.png',
    },
    {
        name: 'Tr4ck3r',
        role: 'Blockchain Developer',
        description: 'Development of Smart Contracts',
        imageUrl: 'src/assets/tracker.png',
    },
    {
        name: 'Alex',
        role: 'Blockchain Developer',
        description: 'WARU Token developer & Openswap.one developer',
        subDesc: 'Contributor for token Design',
        imageUrl: 'src/assets/alex.png',
    },
]
</script>



<template>
    <div class="flex flex-1 flex-col justify-between items-center pt-0 lg:pt-20 lg:px-20 max-w-screen-xl mx-auto">
        <div class="flex flex-1 flex-col mainCard">
            <div class="flex flex-none justify-center">
                <span class="lg:text-7xl text-4xl">Waru Protocol</span>
            </div>
            <div class="flex flex-1 flex-col lg:flex-row lg:space-x-8">
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
                <span class="text-xl">WARU is a governance token that stores value. It’s one of the ways to participate
                    in the WTC
                    rewards and it’s our governance token. It has a 0.2% fee strategically design. Backed by $FRAX $UST
                    $ONE and other assets on WTR.</span>
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
                <p>The 2100 W-UBI NFT Collection is a unique edition from Waru Protocol that allow
                    holders to receive rewards produced with WTC strategies. We will have 10 collections of 210 NFTs per
                    artist making a more special and diversified edition.
                </p>
                <p>
                    We are launching our initial colletion with @Yoichi_NFT to make the initial:
                </p>
                <p class="text-waruGreen-accent">210 W-UBI WARrior</p>

            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="NFT" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-xl">
                <p>The 2100 W-UBI NFT Collection is a unique edition from Waru Protocol , it will give holders a passive
                    income trough our WTC strategies.
                </p>
                <p>
                    We will create 10 collections of 210 NFTs per artist having multiple artists to participate in. We
                    are launching our initial colletion with @Yoichi_NFT has an artist to make the initial 210 W-UBI
                    WARrior’s
                </p>
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="Rarity" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-16">
            <div class="flex flex-none justify-center">
                <img :src="Zap" class="rounded-xl">
            </div>
        </div>
        <div class="flex flex-1 flex-col mt-12">
            <div class="flex flex-none flex-col mt-12 text-center space-y-4 text-xl">
                <p>The Zap-locker (creates lp) with $WARU tokens and other asset like $FRAX and $UST for the W. Treasury
                    Reserve.
                </p>
                <p>
                    This treasury will accumulate $WARU LP overtime until all the Mining rewards Allocation is depleted
                    (12600000 $WARUs)
                </p>
                <p>
                    When this happens the LP will be split, all the $WARUs will be sent to incentivize Mining Liquidity
                    again while the other asssets will be sent to WTC and initiate several Cycles.
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
                <p>The W. Treasury Cycle is a strategic yielding novel designed to generate value through governance and
                    reward distribution.
                </p>
                <p>
                    W-UBI Holders or/and Stakers of +10k $WARU will receive 30% rewards from W. Treasury Cycles.
                </p>
                <p>
                    New cycles and proposals can be made if there is enough fees on the WTC, opening the possibility for
                    multiple cycles to be created if enough demand on volume is generated.
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
                <p>The W. Treasury Reserve is where the Lp that comes from the Zap-locker is kept. This Liquidity is
                    built while removing supply from circulation and create a backing for the value of $WARU token. Once
                    Mining rewads are depleted, this Lp will be split and $WARU will be sent to a new Mining rewards
                    incentive while other assets will be sent to WTC.
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
@media only screen and (min-width: 1026px) {
    .mainCard {
        min-height: 100vw;
    }
}
</style>
