import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(DialerPlugin)
public class DialerPlugin: CAPPlugin {
    private let implementation = Dialer()

    // @objc func echo(_ call: CAPPluginCall) {
    //     let value = call.getString("value") ?? ""
    //     call.resolve([
    //         "value": implementation.echo(value)
    //     ])
    // }
     @objc func openDialer(_ call: CAPPluginCall) {
        guard let phoneNumber = call.getString("phoneNumber") else {
            call.reject("Must provide a phone number")
            return
        }

        guard let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) else {
            call.reject("Unable to open phone dialer")
            return
        }

        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        call.resolve()
    }
}
