import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:solar_flutter/models/dailymodel.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: Center(child: const Text("H1 Solar App", style: TextStyle(fontWeight: FontWeight.bold))),
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

          return Card(
            color: Colors.orange[200],
            // Customize the Card as per your model
            child: Column(
              children: [
                ListTile(
                title: Text(dailyModel?.entryDate.toString() ?? "Loading..."),
                  // Add more widgets based on your model properties
                ),
                Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text( 'Solar Total: ' + dailyModel!.solar.toString() + 'w'),
                ),
                Row(
                  children: [
                    Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text( 'Feed In: ' + dailyModel!.feed.toString() + 'w'),
                    ),
                    Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Text( 'From Grid: ' + dailyModel!.grid.toString() + 'w'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
                          alignment: Alignment.centerLeft,
                          child: Text( 'Battery Charge: ' + dailyModel!.batteryCharge.toString() + 'w'),
                    ),
                    Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
                          alignment: Alignment.centerLeft,
                          child: Text( 'Battery Discharge: ' + dailyModel!.batteryDischarge.toString() + 'w'),
                    ),
                  ],
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}