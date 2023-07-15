import Foundation

@objc public class Dialer: NSObject {
    @objc public func openDialer(_ phoneNumber: String) -> String {
        print(phoneNumber)
        return phoneNumber
    }
}
