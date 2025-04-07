import type { TurboModule } from 'react-native';
export interface Spec extends TurboModule {
    isSupported(): Promise<boolean>;
    canOpenURL(url: string): Promise<boolean>;
    openURL(url: string): Promise<boolean>;
}
declare const _default: Spec;
export default _default;
