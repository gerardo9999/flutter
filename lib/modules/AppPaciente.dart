import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/PacienteMenu.dart';
import 'package:software2/providers/UsuarioProvider.dart';


class AppPaciente extends StatelessWidget {
  final data;
  AppPaciente({this.data});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsuarioProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation :20.0,
          title :Text(data)
        ),
        drawer: PacienteMenu(data: this.data),
      ),
    );
  }
}


