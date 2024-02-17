// To parse this JSON data, do
//
//     final H1Model = H1ModelFromJson(jsonString);

import 'dart:convert';

H1Model H1ModelFromJson(String str) => H1Model.fromJson(json.decode(str));

String H1ModelToJson(H1Model data) => json.encode(data.toJson());

class H1Model {
    String entryId;
    int pvPower1;
    int pvPower2;
    int pvPowerTotal;
    int batteryCharge;
    int batteryDischarge;
    int batterySoc;
    int batteryTemp;
    int inverterTemp;
    int feedIn;
    int fromGrid;
    DateTime loggedDateTime;

    H1Model({
        required this.entryId,
        required this.pvPower1,
        required this.pvPower2,
        required this.pvPowerTotal,
        required this.batteryCharge,
        required this.batteryDischarge,
        required this.batterySoc,
        required this.batteryTemp,
        required this.inverterTemp,
        required this.feedIn,
        required this.fromGrid,
        required this.loggedDateTime,
    });

    factory H1Model.fromJson(Map<String, dynamic> json) => H1Model(
        entryId: json["entryId"],
        pvPower1: json["pvPower1"],
        pvPower2: json["pvPower2"],
        pvPowerTotal: json["pvPowerTotal"],
        batteryCharge: json["batteryCharge"],
        batteryDischarge: json["batteryDischarge"],
        batterySoc: json["batterySoc"],
        batteryTemp: json["batteryTemp"],
        inverterTemp: json["inverterTemp"],
        feedIn: json["feedIn"],
        fromGrid: json["fromGrid"],
        loggedDateTime: DateTime.parse(json["loggedDateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "entryId": entryId,
        "pvPower1": pvPower1,
        "pvPower2": pvPower2,
        "pvPowerTotal": pvPowerTotal,
        "batteryCharge": batteryCharge,
        "batteryDischarge": batteryDischarge,
        "batterySoc": batterySoc,
        "batteryTemp": batteryTemp,
        "inverterTemp": inverterTemp,
        "feedIn": feedIn,
        "fromGrid": fromGrid,
        "loggedDateTime": loggedDateTime.toIso8601String(),
    };
}
