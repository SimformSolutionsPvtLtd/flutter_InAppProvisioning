import 'package:in_app_provisioning/in_app_provisioning.dart';
import 'package:in_app_provisioning/src/platform_interface/method_channels/method_channel_handler.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class InAppProvisioningPlatform extends PlatformInterface {
  InAppProvisioningPlatform() : super(token: _token);

  static final Object _token = Object();

  static InAppProvisioningPlatform _instance =
      InAppProvisioningMethodChannels();

  static InAppProvisioningPlatform get instance => _instance;

  static set instance(InAppProvisioningPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(InAppProvisioningInterface interface) async {
    throw UnimplementedError("initialize() has not been implemented.");
  }

  Future<bool?> isPassKitAvailable() {
    throw UnimplementedError("isPassKitAvailable() has not been implemented.");
  }

  Future<void> initiateEnrollment(CardData data) {
    throw UnimplementedError("initiateEnrollment() has not been implemented.");
  }
}
