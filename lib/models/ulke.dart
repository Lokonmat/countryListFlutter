class Ulke {
  String ulkeKodu;
  String isim;
  String baskent;
  String bolge;
  int nufus;
  String bayrak;
  String dil;

  Ulke.fromJson(Map<String, dynamic> json)
      : ulkeKodu = json["cca2"] ?? "",
        isim = json["name"]?["common"] ?? "",
        baskent = (json["capital"] as List<dynamic>).isNotEmpty
            ? json["capital"][0]
            : "",
        bolge = json["region"] ?? "",
        nufus = json["population"],
        bayrak = json["flags"]?["png"] ?? "",
        dil = (json["languages"] as Map<String, dynamic>).isNotEmpty
            ? (json["languages"] as Map<String, dynamic>)
                .entries
                .toList()[0]
                .value
            : "";
}
