import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> { 
  Future<List> obtenerUsuarios() async {
    final response = await http.get("http://192.168.1.166:80/obtenerdatos.php");
    var data = json.encode(response.body);
    var userdata = json.decode(data);
    print(userdata.toString());
    return json.decode(userdata);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: obtenerUsuarios(),
        builder: (context,snapshot){
          print(snapshot.hasData.toString());
          if(snapshot.hasData){
            return Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            );
          }else if(snapshot.hasError){
            return Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            );
          }else{
            return Center(
              child: CircularProgressIndicator(

              ),
            );
          }
        },
        ),
      );
  }
}