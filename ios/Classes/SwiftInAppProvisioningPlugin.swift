import PassKit
import Flutter
import UIKit

public class SwiftInAppProvisioningPlugin: NSObject, FlutterPlugin {
    
    var channel: FlutterMethodChannel?
    
    var inAppProvisioning:InAppProvisioningEnrollment?
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let _channel = FlutterMethodChannel(name: CHANNEL_NAME, binaryMessenger: registrar.messenger())
    
    
    let instance = SwiftInAppProvisioningPlugin()
    instance.channel = _channel
    registrar.addMethodCallDelegate(instance, channel: _channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    inAppProvisioning = InAppProvisioningEnrollment(methodChannel: channel!)
    if(call.method == IS_PASSKIT_AVAILABLE) {
        result(inAppProvisioning!.isPassKitAvailable())
    } else if(call.method == INIT_ENROLLMENT) {
        guard let args = call.arguments as? [String : Any] else {return}
        let panToken = args["panTokenSuffix"] as! String
        let name = args["holderName"] as! String
        inAppProvisioning!.initEnrollProcess(panTokenSuffix: panToken, holderName: name)
        result(["" : ""])
    } else if(call.method == PROVISIONING_PAYLOAD) {
        guard let args = call.arguments as? [String : Any] else {return}
        let activationData = args["activationData"] as! String
        let ephemeralPublicKey = args["ephemeralPublicKey"] as! String
        let encryptedPassData = args["encryptedData"] as! String
        let request : PKAddPaymentPassRequest = PKAddPaymentPassRequest()
        request.activationData = Data(base64Encoded: activationData, options: [])
        request.encryptedPassData = Data(base64Encoded: encryptedPassData, options: [])
        request.ephemeralPublicKey = Data(base64Encoded: ephemeralPublicKey, options: [])
        completionHandler!(request)
    }
  }
    
    deinit {
        channel?.setMethodCallHandler(nil);
        channel = nil;
    }
}
