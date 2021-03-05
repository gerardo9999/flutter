import 'package:flutter/material.dart';
import 'package:software2/components/PacienteMenu.dart';

class PacienteHome extends StatefulWidget {
  final data;
  PacienteHome({this.data}); 
  
  @override
  _PacienteHomeState createState() => _PacienteHomeState();
}

class _PacienteHomeState extends State<PacienteHome> {
  
  String get data => data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text("Bienvenido"),
      ),
      drawer: PacienteMenu(),
    );
  }
}