class ProvisioningPayload {
  ProvisioningPayload({
    required this.activationData,
    required this.ephemeralPublicKey,
    required this.encryptedPassData,
  });

  String activationData;
  String ephemeralPublicKey;
  String encryptedPassData;

  factory ProvisioningPayload.fromMap(Map<String, dynamic> json) => ProvisioningPayload(
    activationData: json["activationData"],
    ephemeralPublicKey: json["ephemeralPublicKey"],
    encryptedPassData: json["encryptedPassData"],
  );

  Map<String, dynamic> toMap() => {
    "activationData": activationData,
    "ephemeralPublicKey": ephemeralPublicKey,
    "encryptedPassData": encryptedPassData,
  };
}
