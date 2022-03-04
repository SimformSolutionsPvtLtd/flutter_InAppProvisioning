import 'dart:async';
import 'package:flutter/services.dart';
import 'package:in_app_provisioning/src/util/constants.dart';
import 'package:in_app_provisioning/src/models/card_data.dart';

class MethodChannelHandler {
  static const MethodChannel _channel = MethodChannel(MethodChannels.methodChannel);

  MethodChannelHandler() {
    _channel.setMethodCallHandler((MethodCall call) async {

    });
  }

  Future<bool?> get isPassKitAvailable =>
      _channel.invokeMethod(MethodChannels.isPasskitAvailable);

  Future<Map<String, dynamic>?> initiateEnrollment(CardData data) async {
    return _channel.invokeMapMethod(MethodChannels.initiateEnrollment, data.toMap());
  }

}
