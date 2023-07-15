export interface DialerPlugin {
  openDialer(options: { phoneNumber: string }): Promise<void>;
}
