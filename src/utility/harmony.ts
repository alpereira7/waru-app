import { Networks } from "./networks.interface";

export const harmonyNetworks: Networks[] = [
    {
        chainId: 1666600000,
        rpcURL: 'https://api.harmony.one',
        explorer: 'https://explorer.harmony.one/',
        name: 'Harmony Mainnet',
        yoichiNft: '0xeA380Be04a398d93030E4Bff15cBC87f6B35b5ae',
        multicall: '0x34b415f4d3b332515e66f70595ace1dcf36254c5'
    },
    {
        chainId: 1666700000,
        rpcURL: 'https://api.s0.b.hmny.io',
        explorer: 'https://explorer.pops.one/',
        name: 'Harmony Testnet',
        yoichiNft: '0x3C23c9B0F1e1DA555411b63dE96a703228BbF606',
        multicall: '0xd078799c53396616844e2fa97f0dd2b4c145a685'
    },
    {
        chainId: 31337,
        rpcURL: 'http://localhost:8545',
        explorer: 'https://explorer.pops.one/',
        name: 'Localhost Net',
        yoichiNft: '0x5FbDB2315678afecb367f032d93F642f64180aa3',
        multicall: '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512'
    }
]
export function returnNetwork(networkId: number) {
    return harmonyNetworks.find((network) => network.chainId === networkId)
}