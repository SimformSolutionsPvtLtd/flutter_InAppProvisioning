class CardData {
  CardData({
    required this.panTokenSuffix,
    required this.holderName,
  });

  String panTokenSuffix;
  String holderName;

  factory CardData.fromMap(Map<String, dynamic> json) => CardData(
        panTokenSuffix: json["panTokenSuffix"],
        holderName: json["holderName"],
      );

  Map<String, dynamic> toMap() => {
        "panTokenSuffix": panTokenSuffix,
        "holderName": holderName,
      };
}
