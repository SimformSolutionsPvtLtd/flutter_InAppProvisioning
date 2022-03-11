import PassKit
import Flutter
import UIKit

public class SwiftInAppProvisioningPlugin: NSObject, FlutterPlugin {
    
    var channel: FlutterMethodChannel?
    
    let inAppProvisioning:InAppProvisioningEnrollment = InAppProvisioningEnrollment()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let _channel = FlutterMethodChannel(name: CHANNEL_NAME, binaryMessenger: registrar.messenger())
    
    
    let instance = SwiftInAppProvisioningPlugin()
    instance.channel = _channel
    registrar.addMethodCallDelegate(instance, channel: _channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == IS_PASSKIT_AVAILABLE) {
        result(inAppProvisioning.isPassKitAvailable())
    } else if(call.method == INIT_ENROLLMENT) {
        guard let args = call.arguments as? [String : Any] else {return}
        let panToken = args["panTokenSuffix"] as! String
        let name = args["holderName"] as! String
        inAppProvisioning.initEnrollProcess(panTokenSuffix: panToken, holderName: name, methodChannel: channel!)
        result(["" : ""])
    }
  }
    
    deinit {
        channel?.setMethodCallHandler(nil);
        channel = nil;
    }
}
