
import 'package:flutter/material.dart';



class MedicoPage extends StatefulWidget {
  MedicoPage({Key key}) : super(key: key);

  @override
  _MedicoPageState createState() => _MedicoPageState();
}

class _MedicoPageState extends State<MedicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar : AppBar(title : Text("Medicos"))
    );
  }
}