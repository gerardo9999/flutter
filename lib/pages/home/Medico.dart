import 'package:flutter/material.dart';

class MedicoHome extends StatefulWidget {
  static const route = 'medico-home';
  MedicoHome({Key key}) : super(key: key);

  @override
  _MedicoHomeState createState() => _MedicoHomeState();
}

class _MedicoHomeState extends State<MedicoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Medico"),
      ),
    );
  }
}