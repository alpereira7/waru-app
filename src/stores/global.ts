import { returnNetwork } from '@/utility/harmony';
import { defineStore } from 'pinia'

interface globalStore {
    theme: string;
    autoConnect: boolean;
    networkId: number;
    typeWallet: 'metamask' | 'walletconnect';
}

export const useGlobalStore = defineStore('global', {
    state: () => ({
        theme: 'light',
        networkId: 1666600000,
        typeWallet: 'metamask',
        autoConnect: false
    } as globalStore),
    persist: true,
    getters: {
        getDarkMode: (state): boolean => {
            if (state.theme == 'dark') {
                return true;
            } else {
                return false
            }
        },
        getContract(): string | undefined {
            return returnNetwork(this.networkId)?.yoichiNft
        }
    },
    actions: {
        changeTheme() {
            if (this.theme == 'dark') {
                this.theme = 'light'
            } else if (this.theme == 'light') {
                this.theme = 'dark'
            };
        },
        changeChainId(newChainId: number) {
            this.networkId = newChainId
        },
        changeAutoConnect(bool: boolean) {
            this.autoConnect = bool
        },
        changeTypeWallet(newType: 'metamask' | 'walletconnect') {
            this.typeWallet = newType
        }
    }
})
