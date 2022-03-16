import UIKit
import PassKit

typealias CompletionHandler = (PKAddPaymentPassRequest) ->Void
var completionHandler: CompletionHandler?

class InAppProvisioningEnrollment:NSObject {
    
    var channel: FlutterMethodChannel?
    var topController : UIViewController?
    
    init(methodChannel: FlutterMethodChannel) {
        channel = methodChannel
    }
    
    // Method to determine is device eligible for payment pass.
    public func isPassKitAvailable() -> Bool {
        return PKAddPaymentPassViewController.canAddPaymentPass()
    }
    
    // Initiate card enrollment process using card holder name and
    public func initEnrollProcess(panTokenSuffix: String, holderName: String) {
        guard let configuration = PKAddPaymentPassRequestConfiguration(encryptionScheme: .ECC_V2) else {
            print("InApp enrollment configuraton fails")
            return
        }
        configuration.cardholderName = holderName
        configuration.primaryAccountSuffix = panTokenSuffix
        guard let enrollViewController = PKAddPaymentPassViewController(requestConfiguration: configuration, delegate: self) else {
            print("InApp enrollment controller configuration fails")
            return
        }
        
        let frontViewController = UINavigationController(rootViewController: enrollViewController)
        
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
                 return
             }
             topController = rootViewController
        
             while let newTopController = topController!.presentedViewController {
                 topController = newTopController
             }
        topController!.present(frontViewController, animated: true, completion: nil)
    }
    
    
}

extension InAppProvisioningEnrollment: PKAddPaymentPassViewControllerDelegate {
    func addPaymentPassViewController(
        _ controller: PKAddPaymentPassViewController,
        generateRequestWithCertificateChain certificates: [Data],
        nonce: Data, nonceSignature: Data,
        completionHandler handler: @escaping (PKAddPaymentPassRequest) -> Void) {
        
        completionHandler = handler
        
        let nonceString: String = dataToJson(data: nonce)
        let nonceSignatureString: String = dataToJson(data: nonceSignature)
        let certificate: String = dataToJson(data: certificates[0])
        let _data = [
            "nonce" : nonceString,
            "nonceSignature" : nonceSignatureString,
            "certificate" : certificate
        ];
        channel?.invokeMethod(PASSVIEW_DATA, arguments: _data)
    }
    
    private func dataToJson(data: Data) -> String {
        do {
            let jsonData = try JSONEncoder().encode(data)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            return jsonString
        } catch {
            print(error)
            return ""
        }
    }
    
    func addPaymentPassViewController(
        _ controller: PKAddPaymentPassViewController,
        didFinishAdding pass: PKPaymentPass?,
        error: Error?) {
        topController!.dismiss(animated: true, completion: nil)
    }
}
