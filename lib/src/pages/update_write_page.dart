import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UpdateWPage extends StatefulWidget {
  
  
  @override
  _UpdateWPageState createState() => _UpdateWPageState();
}

class _UpdateWPageState extends State<UpdateWPage> {  
  final formKey = GlobalKey<FormState>();
  String id;
  String name;
  String usuario;
  String email;
  Future<List> obtenerUsuarios() async {
    final response = await http.get("http://192.168.1.166:80/obtenerdatos.php");
    var data = json.encode(response.body);
    var userdata = json.decode(data);
    print(userdata.toString());
    return json.decode(userdata);
  }
  Future<List> updateData() async{
    final response = await http.post("http://192.168.1.166:80/actualizadatos.php",body: {
      "id": id,
      "name" : name,
      "usuario": usuario,
      "email": email
    });
    var data = json.encode(response.body);
    var datauser = json.decode(data);
    print(datauser.toString());
  }
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> lista = ModalRoute.of(context).settings.arguments;
    if(lista != null){
      print(lista.toString());
      print(lista['name'].toString());
    }
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget> [
            Container(
              padding: EdgeInsets.all(25.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Text("Nombre"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      initialValue: lista['name'].toString(),
                      decoration: InputDecoration(
                        hintText: "nombre",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                          return null;
                      },
                      onSaved: (value) => name=value,
                    ),
                    SizedBox(height: 10.0),
                    Text("Username"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      initialValue: lista['username'].toString(),
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)
                        )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                          return null;
                      },
                      onSaved: (value) => usuario=value,
                    ),
                    SizedBox(height: 10.0),
                    Text("Correo"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      initialValue: lista['email'].toString(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "correo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                          return null;
                      },
                      onSaved: (value) => email=value,
                    ),
                    SizedBox(height: 20.0,),
              
                    RaisedButton(onPressed: (){
                      if (!formKey.currentState.validate()) return;
                            print('Todo ok');

                          formKey.currentState.save();
                             id= lista['ID'].toString();
                            print(id);
                            print(name);
                            print(usuario);
                            print(email);
                            Navigator.pushNamed(context, 'home');
                            updateData();
                          },
                    child: Text("Actualizar",style: TextStyle(color: Colors.white),),
                    ),
                  ],   
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}