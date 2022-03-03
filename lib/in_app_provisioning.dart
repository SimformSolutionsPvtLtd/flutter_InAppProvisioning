import 'dart:async';
import 'package:in_app_provisioning/method_channels/method_channel_handler.dart';

class InAppProvisioning {
  final MethodChannelHandler _channelHandler = MethodChannelHandler();

  Future<bool?> get isPasskitAvailable async =>
      _channelHandler.isPassKitAvailable;
}
