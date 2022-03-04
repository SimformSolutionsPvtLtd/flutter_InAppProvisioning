import 'dart:async';
import 'package:in_app_provisioning/src/models/securize_data.dart';
import 'package:in_app_provisioning/src/models/card_data.dart';
import 'package:in_app_provisioning/src/method_channels/method_channel_handler.dart';

class InAppProvisioning {
  final MethodChannelHandler _channelHandler = MethodChannelHandler();

  Future<bool?> get isPasskitAvailable async =>
      _channelHandler.isPassKitAvailable;

  Future<SecurizeData> initiateCardEnrollment(CardData data) async {
    Map<String, dynamic>? _securizeMap = await _channelHandler.initiateEnrollment(data);
    if(_securizeMap != null) {
      return SecurizeData.fromMap(_securizeMap);
    } else {
      throw "Something went wrong";
    }
  }

}
