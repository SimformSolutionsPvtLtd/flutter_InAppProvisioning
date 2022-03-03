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
    } else {
        result("Unknown method call")
    }
  }
}
