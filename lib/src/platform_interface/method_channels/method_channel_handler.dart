import 'dart:async';
import 'package:flutter/services.dart';
import 'package:in_app_provisioning/in_app_provisioning.dart';
import 'package:in_app_provisioning/src/platform_interface/interfaces/in_app_provisioning_platform.dart';
import 'package:in_app_provisioning/src/util/constants.dart';

const MethodChannel _channel = MethodChannel(MethodChannels.methodChannel);

class InAppProvisioningMethodChannels extends InAppProvisioningPlatform {

  MethodChannel get channel => _channel;

  late InAppProvisioningInterface _interface;

  @override
  Future<void> initialize(InAppProvisioningInterface interface) async {
    _interface = interface;
    channel.setMethodCallHandler((call) async {
      switch(call.method) {
        case MethodChannels.passviewData:
          _interface.initiateEnrollment(
            call.arguments["nonce"],
            call.arguments["nonceSignature"],
            call.arguments["certificate"],
          );
          break;
      }
    });
  }

  @override
  Future<bool?> isPassKitAvailable() {
    return channel.invokeMethod(MethodChannels.isPasskitAvailable);
  }

  @override
  Future<void> initiateEnrollment(CardData data) async {
    channel.invokeMapMethod(MethodChannels.initiateEnrollment, data.toMap());
    return;
  }

  @override
  Future<void> passProvisioningPayload(ProvisioningPayload payload) async {
    channel.invokeMapMethod(MethodChannels.provisioninigPayload, payload.toMap());
  }

}
