import 'dart:convert';

ProvisioningPayload activationPayloadFromMap(String str) => ProvisioningPayload.fromMap(json.decode(str));

String activationPayloadToMap(ProvisioningPayload data) => json.encode(data.toMap());

class ProvisioningPayload {
  ProvisioningPayload({
    required this.activationData,
    required this.ephemeralPublicKey,
    required this.encryptedData,
  });

  String activationData;
  String ephemeralPublicKey;
  String encryptedData;

  factory ProvisioningPayload.fromMap(Map<String, dynamic> json) => ProvisioningPayload(
    activationData: json["activationData"],
    ephemeralPublicKey: json["ephemeralPublicKey"],
    encryptedData: json["encryptedData"],
  );

  Map<String, dynamic> toMap() => {
    "activationData": activationData,
    "ephemeralPublicKey": ephemeralPublicKey,
    "encryptedData": encryptedData,
  };
}
