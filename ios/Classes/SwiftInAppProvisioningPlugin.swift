import Flutter
import UIKit

public class SwiftInAppProvisioningPlugin: NSObject, FlutterPlugin {
    
    let inAppProvisioning:InAppProvisioningEnrollment = InAppProvisioningEnrollment()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: flutterMethodChannelName, binaryMessenger: registrar.messenger())
    let instance = SwiftInAppProvisioningPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == isPasskitAvailable) {
        result(inAppProvisioning.isPassKitAvailable())
    } else if(call.method == initiateEnrollment) {
        guard let args = call.arguments as? [String : Any] else {return}
        let panToken = args["panTokenSuffix"] as! String
        let name = args["holderName"] as! String
        inAppProvisioning.initEnrollProcess(panTokenSuffix: panToken, holderName: name)
        result(["data1" : "data", "data2" : "data"])
    }
  }
}
