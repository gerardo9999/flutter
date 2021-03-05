import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/AdminMenu.dart';
import 'package:software2/providers/UsuarioProvider.dart';

class AdministradorHome extends StatefulWidget {
  static const route = 'admin-home';
  String usuario; 
  AdministradorHome({Key key,this.usuario}) : super(key: key);

  @override
  _AdministradorHomeState createState() => _AdministradorHomeState();
}

class _AdministradorHomeState extends State<AdministradorHome> {

  


  @override
  
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context,listen: false);
    
    usuarioProvider.authTenticado();
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
      drawer: AdminMenu(),
    );
  }

}