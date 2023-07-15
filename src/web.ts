import { WebPlugin } from '@capacitor/core';

import type { DialerPlugin } from './definitions';

export class DialerWeb extends WebPlugin implements DialerPlugin {
  async openDialer(options: { phoneNumber: string }): Promise<void> {
    window.open(`tel:${options.phoneNumber}`);
    // console.log('ECHO', options);
    // return options;
  }
}
