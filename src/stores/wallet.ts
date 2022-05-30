import { returnProvider, toastMe } from '@/utility/functions';
import { BigNumber, ethers } from 'ethers';
import { defineStore } from 'pinia'
import { useGlobalStore } from './global';
import { harmonyNetworks, returnNetwork } from '@/utility/harmony';
import WaruNFT from '@/assets/WaruNFT.json'
import { createWatcher } from '@makerdao/multicall'
interface walletStore {
    isSigned: boolean;
    provider: any;
    userAddress: string;
    totalAmountMinted: string;
    maxAmount: string;
    idsBalance: string[];
    cost: string;
    minting: boolean;
    networkSupported: boolean;
    nfts: any[]
}

export const useWalletStore = defineStore('wallet', {
    state: () => ({
        isSigned: false,
        provider: null,
        userAddress: '',
        totalAmountMinted: '0',
        maxAmount: '0',
        cost: '0',
        idsBalance: [],
        minting: false,
        networkSupported: true,
        nfts: []
    } as walletStore),
    getters: {

    },
    actions: {
        async setupWallet(typeWallet: 'metamask' | 'walletconnect') {
            const globalStore = useGlobalStore()
            const sourceProvider = await returnProvider(typeWallet);
            const provider = new ethers.providers.Web3Provider(sourceProvider);
            switch (typeWallet) {
                case 'metamask':
                    await provider.send("eth_requestAccounts", []);
                    break;
            }
            const signer = await provider.getSigner();
            const { chainId } = await provider.getNetwork()
            if (!chainId) {
                toastMe('error', {
                    title: 'Wallet:',
                    msg: "We don't support the network you are connected to.",
                    link: false,
                })
                this.disconnect()
                return false
            } else {
                const accounts = await signer.getAddress();
                globalStore.autoConnect = true;
                globalStore.changeTypeWallet(typeWallet)
                if (accounts !== this.userAddress || globalStore.networkId !== chainId) {
                    toastMe('success', {
                        title: 'Wallet :',
                        msg: `Succesfully connected to : ` + accounts,
                        link: false,
                    })
                    if (globalStore.networkId !== chainId) {
                        globalStore.changeChainId(chainId)
                    }
                    this.loadInfo(accounts)
                    this.provider = provider
                    this.userAddress = accounts
                    this.isSigned = true;
                }
                return true
            }
        },
        disconnect() {
            const globalStore = useGlobalStore()
            globalStore.changeChainId(1666600000)
            globalStore.changeAutoConnect(false)
            this.networkSupported = true
            this.provider = null
            this.userAddress = ''
            this.isSigned = false;
            this.nfts = []
            this.idsBalance = []
            return false
        },
        async connectAnyWallet() {
            const globalStore = useGlobalStore()
            switch (globalStore.typeWallet) {
                case 'walletconnect':
                    this.setupWallet('walletconnect')
                    break;
                default:
                    this.connect()
                    break;
            }
        },
        async connectWalletConnect() {
            return await this.setupWallet('walletconnect')
        },
        async connect() {
            if (window.ethereum !== undefined) {
                return await this.setupWallet('metamask')
            }
            else if (window.ethereum == undefined) {
                toastMe('warning', {
                    title: 'Wallet',
                    msg: "It seems you don't have Metamask installed! try switching Wallet Mode",
                    link: false,
                })
                return false
            }
        },
        async loadNfts() {
            const globalStore = useGlobalStore()
            const network = returnNetwork(globalStore.networkId)
            if (!network || !this.isSigned) {
                return false
            }
            this.nfts = []
            const CALLS = this.idsBalance.map((id) => ({
                target: network.yoichiNft,
                call: ['tokenURI(uint256)(string)', id],
                returns: [[`${id}`, (val: string) => val]]
            }))
            const config = {
                rpcUrl: network.rpcURL,
                multicallAddress: network.multicall
            };
            const watcher = createWatcher(
                CALLS,
                config
            );
            watcher.subscribe((result: any) => {
                this.nfts.push({ id: result.type, metadata: result.value })
            });
            watcher.start();
            await watcher.awaitInitialFetch();
            watcher.stop();
            return true
        },
        async loadInfo(userAddress = '') {
            const globalStore = useGlobalStore()
            const network = returnNetwork(globalStore.networkId)
            if (!network) {
                this.networkSupported = false
                return false
            }
            this.networkSupported = true
            let CALL = [];
            CALL.push({
                target: network.yoichiNft,
                call: ['totalSupply()(uint256)'],
                returns: [["minted", (val: BigNumber) => val]]
            })
            CALL.push({
                target: network.yoichiNft,
                call: ['maxSupply()(uint256)'],
                returns: [["max", (val: BigNumber) => val]]
            })
            CALL.push({
                target: network.yoichiNft,
                call: ['cost()(uint256)'],
                returns: [["cost", (val: BigNumber) => val]]
            })
            if (userAddress) {
                CALL.push({
                    target: network.yoichiNft,
                    call: ['walletOfOwner(address)(uint256[])', userAddress],
                    returns: [["balance", (val: BigNumber[]) => val]]
                })
            }
            const config = {
                rpcUrl: network.rpcURL,
                multicallAddress: network.multicall
            };
            const watcher = createWatcher(
                CALL,
                config
            );
            watcher.subscribe((result: any) => {
                if (result.type === 'minted') {
                    this.totalAmountMinted = result.value
                }
                if (result.type === 'max') {
                    this.maxAmount = result.value
                }
                if (result.type === 'cost') {
                    this.cost = result.value
                }
                if (result.type === 'balance') {
                    this.idsBalance = result.value
                }
            });
            watcher.start();
            await watcher.awaitInitialFetch();
            watcher.stop();
            return true
        },
        async mint() {
            if (!this.isSigned) {
                return false
            }
            this.minting = true
            const abi = WaruNFT.abi;
            const user = this.userAddress
            const globalStore = useGlobalStore()
            const sourceProvider = await returnProvider(globalStore.typeWallet);
            const provider = new ethers.providers.Web3Provider(sourceProvider);
            const signer = provider.getSigner();
            const network = returnNetwork(globalStore.networkId)
            if (!network) {
                return false
            }
            const contract = new ethers.Contract(network.yoichiNft, abi, signer);
            const overrides = { value: this.cost.toString() }
            const tx = await contract.mint(user, BigNumber.from(1), overrides).catch((err: any) => {
                let message;
                if (!err.data?.message) {
                    message = err.message
                } else {
                    message = err.data.message
                }
                toastMe('error', {
                    title: 'Error',
                    msg: message,
                    link: false
                })
                return
            })
            if (tx !== undefined) {
                let explorer = 'https://explorer.harmony.one/#/tx/'
                let transaction = tx.hash
                toastMe('info', {
                    title: 'Transaction Sent',
                    msg: "Mint request sent to network. Waiting for confirmation",
                    link: false,
                    href: `${explorer}${transaction}`
                })
                await tx.wait(1)
                toastMe('success', {
                    title: 'Tx Successful',
                    msg: "Explore: " + transaction,
                    link: true,
                    href: `${explorer}${transaction}`
                })
                this.loadInfo(user)
                this.minting = false
                return true
            }
            this.minting = false
            return false
        },

    }
})
