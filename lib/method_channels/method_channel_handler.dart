import 'dart:async';
import 'package:flutter/services.dart';
import 'package:in_app_provisioning/util/constants.dart';

class MethodChannelHandler {
  static const MethodChannel _channel = MethodChannel(methodChannel);

  Future<bool?> get isPassKitAvailable =>
      _channel.invokeMethod(isPasskitAvailable);
}
