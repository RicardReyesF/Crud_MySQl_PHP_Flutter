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
            final datos = snapshot.data;
            return ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context,i) => _crearItem(i,context,datos),
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
  Widget _crearItem(i,BuildContext context, List datos){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        title: Text(datos[i]['name']),
        subtitle: Text(datos[i]['email']),
      )
    );
  }
}

