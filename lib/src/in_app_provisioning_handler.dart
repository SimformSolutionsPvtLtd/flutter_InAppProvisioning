import 'package:in_app_provisioning/in_app_provisioning.dart';
import 'package:in_app_provisioning/src/platform_interface/interfaces/in_app_provisioning_platform.dart';

class InAppProvisioning {

  InAppProvisioning(InAppProvisioningInterface interface) {
    InAppProvisioningPlatform.instance.initialize(interface);
  }

  Future<bool> isPassKitAvailable() async {
    bool? isPassKitAvailable = await InAppProvisioningPlatform.instance.isPassKitAvailable();
    return isPassKitAvailable ?? false;
  }

  Future<void> initiateEnrollment(CardData data) =>
      InAppProvisioningPlatform.instance.initiateEnrollment(data);

  Future<void> passProvisioningPayload(ProvisioningPayload payload) =>
      InAppProvisioningPlatform.instance.passProvisioningPayload(payload);
}
