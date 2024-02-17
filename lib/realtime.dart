import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solar_flutter/models/h1model.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
class Realtime extends StatefulWidget {
  const Realtime({Key? key}) : super(key: key);

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
        title: Center(child: const Text("H1 Solar App")),
      ),
      body: 
       _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :
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
                ListTile(
                  title: Text('PV1'),
                  trailing: Icon(Icons.favorite_outline),
                ),
                Container(
                  child: Text(dataFromAPI!.pV1Amps.toString()),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(dataFromAPI!.pV1Voltage.toString()),
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
                ListTile(
                  title: Text('PV1'),
                  trailing: Icon(Icons.favorite_outline),
                ),
                Container(
                  child: Text(dataFromAPI!.pV2Amps.toString()),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(dataFromAPI!.pV2Voltage.toString()),
                ),
              ],
            ))
          )


        ],)
                     
     );     
  }
}