// To parse this JSON data, do
//
//     final H1Model = H1ModelFromJson(jsonString);

import 'dart:convert';

H1Model H1ModelFromJson(String str) => H1Model.fromJson(json.decode(str));

String H1ModelToJson(H1Model data) => json.encode(data.toJson());

class H1Model {
    String entryId;
    int pvPower1;
    double pV1Amps;
    double pV1Voltage;
    int pvPower2;
    double pV2Amps;
    double pV2Voltage;
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
        required this.pV1Amps,
        required this.pV1Voltage,
        required this.pvPower2,
        required this.pV2Amps,
        required this.pV2Voltage,
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
        pV1Amps: json["pV1Amps"]?.toDouble(),
        pV1Voltage: json["pV1Voltage"]?.toDouble(),
        pvPower2: json["pvPower2"],
        pV2Amps: json["pV2Amps"]?.toDouble(),
        pV2Voltage: json["pV2Voltage"]?.toDouble(),
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
        "pV1Amps": pV1Amps,
        "pV1Voltage": pV1Voltage,
        "pvPower2": pvPower2,
        "pV2Amps": pV2Amps,
        "pV2Voltage": pV2Voltage,
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
