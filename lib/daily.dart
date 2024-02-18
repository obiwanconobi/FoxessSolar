import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:solar_flutter/models/dailymodel.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  List<DailyModel>? dataFromAPI;
  _getData() async {
    try {
      String url = "https://solar.connerpanaro.com/api/GetDaily";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var result = json.decode(res.body);
        dataFromAPI = (result as List).map((e) => DailyModel.fromJson(e)).toList();
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String _twoDigits(int n) {
  if (n >= 10) {
    return "$n";
  } else {
    return "0$n";
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
      ListView.builder( 
        itemCount: dataFromAPI?.length,
        itemBuilder: (context, index) {
          var dailyModel = dataFromAPI?[index];
          var originalDateTime = dailyModel?.entryDate ?? DateTime.now();
          var stringDate = DateFormat('EEEE d MMMM').format(originalDateTime);
          var stringTime = DateFormat('jms').format(originalDateTime);
          return Card(
            color: Colors.orange[200],
            // Customize the Card as per your model
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: [
                  ListTile(
                  title:  Tooltip(
                              message: '$stringTime',
                              child: Text('$stringDate', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold),),
                            ),
                    // Add more widgets based on your model properties
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: 
                  [
                    //Solar
                    Container(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child:
                          Column(children: 
                          [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text('Solar',style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Row(
                            children: [
                              const Tooltip(
                                message: 'Total Solar Generation',
                                child: Icon(
                                  Icons.solar_power,
                                ),
                              ),
                              Text( '${dailyModel!.solar}kw', style: const TextStyle(fontWeight: FontWeight.bold)),
                      
                          ],),]),
                      ),
                    ),
                    //Inverter
                    Container(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                       // margin: const EdgeInsets.fromLTRB(50,0 ,0 , 0),
                        child:
                          Column(children: 
                          [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text('Inverter', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Row(
                            children: [
                              const Tooltip(
                                message: 'From Grid',
                                child: Icon(
                                  Icons.grid_on,
                                ),
                              ),
                              Text( '${dailyModel.grid}kw', style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Tooltip(
                                message: 'Feed in',
                                child: Icon(
                                  Icons.energy_savings_leaf,
                                ),
                              ),
                              Text( '${dailyModel.feed}kw', style: const TextStyle(fontWeight: FontWeight.bold)),
                      
                          ],),]),
                      
                      ),
                    ),
                    //Battery
                    Container(
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                       // margin: const EdgeInsets.fromLTRB(20,0 ,0 , 0),
                        child:
                          Column(children: 
                          [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text('Battery', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Row(
                            children: [
                              const Tooltip(
                                message: 'Battery Charge',
                                child: Icon(
                                  Icons.battery_charging_full,
                                ),
                              ),
                              Text( '${dailyModel.batteryCharge}kw', style: const TextStyle(fontWeight: FontWeight.bold)),
                              const Tooltip(
                                message: 'Battery Discharge',
                                child: Icon(
                                  Icons.battery_0_bar,
                                ),
                              ),
                              Text( '${dailyModel.batteryDischarge}kw', style: const TextStyle(fontWeight: FontWeight.bold)),
                      
                          ],),]),
                      
                      ),
                    ),
              
                  ],)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}