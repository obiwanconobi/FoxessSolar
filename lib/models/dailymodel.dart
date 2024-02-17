// To parse this JSON data, do
//
//     final DailyModel = DailyModelFromJson(jsonString);

import 'dart:convert';

List<DailyModel> DailyModelFromJson(String str) => List<DailyModel>.from(json.decode(str).map((x) => DailyModel.fromJson(x)));

String DailyModelToJson(List<DailyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DailyModel {
    String entryId;
    DateTime entryDate;
    double solar;
    double grid;
    double feed;
    double batteryCharge;
    double batteryDischarge;
    double yield;
    double load;

    DailyModel({
        required this.entryId,
        required this.entryDate,
        required this.solar,
        required this.grid,
        required this.feed,
        required this.batteryCharge,
        required this.batteryDischarge,
        required this.yield,
        required this.load,
    });

    factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
        entryId: json["entryId"],
        entryDate: DateTime.parse(json["entryDate"]),
        solar: json["solar"]?.toDouble(),
        grid: json["grid"]?.toDouble(),
        feed: json["feed"]?.toDouble(),
        batteryCharge: json["batteryCharge"]?.toDouble(),
        batteryDischarge: json["batteryDischarge"]?.toDouble(),
        yield: json["yield"]?.toDouble(),
        load: json["load"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "entryId": entryId,
        "entryDate": entryDate.toIso8601String(),
        "solar": solar,
        "grid": grid,
        "feed": feed,
        "batteryCharge": batteryCharge,
        "batteryDischarge": batteryDischarge,
        "yield": yield,
        "load": load,
    };
}
