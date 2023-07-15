import { registerPlugin } from '@capacitor/core';

import type { DialerPlugin } from './definitions';

const Dialer = registerPlugin<DialerPlugin>('Dialer', {
  web: () => import('./web').then(m => new m.DialerWeb()),
});

export * from './definitions';
export { Dialer };
