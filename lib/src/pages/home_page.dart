import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  TextEditingController name = new TextEditingController();
  TextEditingController usuario = new TextEditingController();
  TextEditingController email = new TextEditingController();

  Future<List> sendData() async{
    final response = await http.post("http://192.168.1.166:80/inserdata.php",body: {
      "name" : name.text,
      "usuario": usuario.text,
      "email": email.text
    });
    var data = json.encode(response.body);
    var datauser = json.decode(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ListView(
          children: <Widget> [
            Container(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Text("Nombre"),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: "nombre",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text("Username"),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: usuario,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)
                      )
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text("Correo"),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "correo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      RaisedButton(
                    onPressed: (){
                      sendData();
                      name.text = '';
                      usuario.text = '';
                      email.text = '';
                    },
                    color: Colors.blue,
                    child: Text("Registro",style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'view');
                    },
                    color: Colors.blue,
                    child: Text("Ver",style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'update');
                    },
                    color: Colors.blue,
                    child: Text("Editar",style: TextStyle(color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'delete');
                    },
                    color: Colors.blue,
                    child: Text("Eliminar",style: TextStyle(color: Colors.white),),
                  ),
                    ],  
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}