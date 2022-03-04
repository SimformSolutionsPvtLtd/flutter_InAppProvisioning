class SecurizeData {
  SecurizeData({
    required this.nonce,
    required this.nonceSignature,
    required this.certificate,
  });

  String nonce;
  String nonceSignature;
  String certificate;

  factory SecurizeData.fromMap(Map<String, dynamic> json) => SecurizeData(
    nonce: json["nonce"],
    nonceSignature: json["nonceSignature"],
    certificate: json["certificate"],
  );

  Map<String, dynamic> toMap() => {
    "nonce": nonce,
    "nonceSignature": nonceSignature,
    "certificate": certificate,
  };
}
