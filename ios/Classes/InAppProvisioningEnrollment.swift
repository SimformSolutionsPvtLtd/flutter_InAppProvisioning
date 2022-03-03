import UIKit
import PassKit

class InAppProvisioningEnrollment {
    
    // Method to determine is device eligible for payment pass.
    public func isPassKitAvailable() -> Bool {
        return PKAddPaymentPassViewController.canAddPaymentPass()
    }
    
    // Initiate card enrollment process using card holder name and
    public func initEnrollProcess(panTokenSuffix: String, holder: String) {
        
        print("Initiating enrollment");
    }
}
