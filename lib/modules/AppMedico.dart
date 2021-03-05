import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/providers/UsuarioProvider.dart';

class AppMedico extends StatelessWidget {
  final data;
  AppMedico({this.data});
@override
Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsuarioProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation :20.0,
          backgroundColor: Colors.blue,
          title :Text("Bienvenido"),
        ),
        drawer: MedicoMenu(data: this.data),
        body: Center(
          child : Card(
            child: Image.asset('assets/images/medica.png',
              width: double.infinity,
              height: double.infinity,
            ),
          )
        ),
      ),
     
    );
  }
}