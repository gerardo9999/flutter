import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/PacienteMenu.dart';
import 'package:software2/providers/UsuarioProvider.dart';


class AppAdministrador extends StatelessWidget {
    final data;
  AppAdministrador({this.data});

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


