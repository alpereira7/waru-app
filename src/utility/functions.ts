import { toasterOptions } from "@/constants";
import Toaster from '@/components/Toaster.vue'
import { ToasterOptions } from "./toaster.interface";
import { useToast } from "vue-toastification";
import numeral from "numeral";
import { harmonyNetworks } from '@/utility/harmony';
import WalletConnectProvider from "@walletconnect/web3-provider";

export function returnAmounts(value: any) {
    return numeral(value).format('0[.]0')
}
export function optToast(value: keyof ToasterOptions) {
    return toasterOptions[value]
}

export function toastMe(type: keyof ToasterOptions, props: any) {

    let content = {
        component: Toaster,
        props: { ...props }
    }

    switch (type) {
        case 'success':
            useToast().success(content, optToast(type))
            break
        case 'info':
            useToast().info(content, optToast(type))
            break
        case 'warning':
            useToast().warning(content, optToast(type))
            break
        case 'error':
            useToast().error(content, optToast(type))
            break
        default:
            useToast()(content, optToast(type))
    }
}

export async function returnProvider(walletMode: string) {
    let sourceProvider: any;
    switch (walletMode) {
        case 'walletconnect':
            const networks = harmonyNetworks
            const sources: any = {}
            networks.forEach((network) => { sources[network.chainId] = network.rpcURL })
            sourceProvider = new WalletConnectProvider({
                rpc: sources
            })
            await sourceProvider.enable();
            break;

        default:
            sourceProvider = window.ethereum
            break;
    }
    return sourceProvider
}