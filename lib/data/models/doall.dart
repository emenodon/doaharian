import 'dart:convert';

// List<DoAll> doAllFromJson(dynamic str) =>
//     List<DoAll>.from(json.decode(str).map((x) => DoAll.fromJson(x)));
// DoAll doallListFromJson(String str) => DoAll.fromJson(json.decode(str));
dynamic doAllToJson(List<DoAll> data) =>
    json.encode(List<DoAll>.from(data.map((x) => x.toJson())));

class DoAll {
  DoAll({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });
  dynamic id;
  dynamic doa;
  dynamic ayat;
  dynamic latin;
  dynamic artinya;

  factory DoAll.fromJson(Map<String, dynamic> json) => DoAll(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
      };
}
