import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  isSupported(): Promise<boolean>;
  canOpenURL(url: string): Promise<boolean>;
  openURL(url: string): Promise<boolean>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('TurboDeeplink');
