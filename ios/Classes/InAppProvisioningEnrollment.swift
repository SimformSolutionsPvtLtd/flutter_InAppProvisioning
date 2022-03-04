import UIKit
import PassKit

class InAppProvisioningEnrollment:NSObject {
    
    // Method to determine is device eligible for payment pass.
    public func isPassKitAvailable() -> Bool {
        return PKAddPaymentPassViewController.canAddPaymentPass()
    }
    
    // Initiate card enrollment process using card holder name and
    public func initEnrollProcess(panTokenSuffix: String, holderName: String) {
        print(panTokenSuffix)
        print(holderName)
        print("Initiating enrollment");
        guard let configuration = PKAddPaymentPassRequestConfiguration(encryptionScheme: .ECC_V2) else {
            print("InApp enrollment configuraton fails")
//            showPassKitUnavailable(message: "InApp enrollment configuraton fails")
            return
        }
        configuration.cardholderName = holderName
        configuration.primaryAccountSuffix = panTokenSuffix
        guard let enrollViewController = PKAddPaymentPassViewController(requestConfiguration: configuration, delegate: self) else {
            print("InApp enrollment controller configuration fails")
            // showPassKitUnavailable(message: "InApp enrollment controller configuration fails")
            return
        }
        
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
                 return
             }
             var topController = rootViewController
        
             while let newTopController = topController.presentedViewController {
                 topController = newTopController
             }
        topController.present(enrollViewController, animated: true, completion: nil)
    }
    
    
}

extension InAppProvisioningEnrollment: PKAddPaymentPassViewControllerDelegate {
    func addPaymentPassViewController(
        _ controller: PKAddPaymentPassViewController,
        generateRequestWithCertificateChain certificates: [Data],
        nonce: Data, nonceSignature: Data,
        completionHandler handler: @escaping (PKAddPaymentPassRequest) -> Void) {
        print("nonce")
        print(nonce)
        print("nonceSignature")
        print(nonceSignature)
        print("certificates")
        print(certificates.count)
    }
    
    func addPaymentPassViewController(
        _ controller: PKAddPaymentPassViewController,
        didFinishAdding pass: PKPaymentPass?,
        error: Error?) {
    }
}
