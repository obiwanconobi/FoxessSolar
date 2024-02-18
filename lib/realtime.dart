import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solar_flutter/models/h1model.dart';
class Realtime extends StatefulWidget {
  const Realtime({super.key});

  @override
  State<Realtime> createState() => _RealtimeState();
}

class _RealtimeState extends State<Realtime> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  H1Model? dataFromAPI;
  _getData() async {
    try {
      String url = "https://solar.connerpanaro.com/api/GetLatest";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var rrr = res.body.toString();
        dataFromAPI = H1Model.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: const Center(child: Text("H1 Solar App", style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: 
       _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :
        Column(
         children:[
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: 
            [
           
              //1st card
           
              Container(
                height:180,
                width:180,
                decoration: BoxDecoration(
                  color:Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Card(
                color: Colors.orange[200],
                elevation: 0,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text('PV1', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.solar_power),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text( 'Current: ${dataFromAPI!.pV1Amps}A'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Voltage: ${dataFromAPI!.pV1Voltage}V'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Power: ${dataFromAPI!.pvPower1}w', style: const TextStyle(fontSize: 20)),
                    ),
                  ],
                )),
              ),
           
             
           
           
              //2nd card
              Container(
                height:180,
                width:180,
                decoration: BoxDecoration(
                  color:Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Card(
                color: Colors.orange[200],
                elevation: 0,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text('PV2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.solar_power),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Current: ${dataFromAPI!.pV2Amps}A'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Voltage: ${dataFromAPI!.pV2Voltage}V'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Power: ${dataFromAPI!.pvPower2}w', style: const TextStyle(fontSize: 20)),
                    ),
                  ],
                ))
              )
           
           
            ],),
            Container(
                height:180,
                width:380,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                decoration: BoxDecoration(
                  color:Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Card(
                color: Colors.orange[200],
                elevation: 0,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text('Inverter', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.solar_power),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Solar Total: ${dataFromAPI!.pvPowerTotal}w', style: const TextStyle(fontSize: 20)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('From Grid: ${dataFromAPI!.fromGrid}w'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('To Grid: ${dataFromAPI!.feedIn}w'),
                    ),
                  ],
                ))
              
            ),
            Container(
                height:180,
                width:380,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                decoration: BoxDecoration(
                  color:Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Card(
                color: Colors.orange[200],
                elevation: 0,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text('Battery', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.battery_full),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Battery Charge: ${dataFromAPI!.batteryCharge}w'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Battery Discharge: ${dataFromAPI!.batteryDischarge}w'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('Battery SOC: ${dataFromAPI!.batterySoc}%', style: const TextStyle(fontSize: 20)),
                    ),
                  ],
                ))
              
            )
         ],
       )
                     
     );     
  }
}