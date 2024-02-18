import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class SettingsWidget extends StatefulWidget {
  
  const SettingsWidget({super.key});
  
  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
  
}





class _SettingsWidgetState extends State<SettingsWidget> {
  TextEditingController _serverUrlTextController = TextEditingController();
  
_saveUrl() {
    GetStorage().write('serverUrl', _serverUrlTextController.text);
}

  @override
   void  initState() {
    super.initState();
    GetStorage.init();
    // Set the initial value of the TextField
    _serverUrlTextController.text = GetStorage().read('serverUrl') ?? 'No Server Set';
  }




  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: const Center(child: Text("H1 Solar App", style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body:
        Container(
          padding: const EdgeInsets.all(20),
          child: 
            Column(
              children: 
              [
                const Text('Server URL'),
                TextField(obscureText: false, controller: _serverUrlTextController, decoration: InputDecoration( suffixIcon: IconButton(icon: const Icon(Icons.save), onPressed: (_saveUrl),)),),
                
              ],
            ),
                
   
            )
        );
  }
}