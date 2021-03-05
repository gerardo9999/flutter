import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software2/components/MedicoMenu.dart';

class RegisterConsultaPage extends StatefulWidget {

  final userAth;
  final idPaciente;
  RegisterConsultaPage({this.userAth,this.idPaciente});

  @override
  _RegisterConsultaPageState createState() => _RegisterConsultaPageState();
}

class _RegisterConsultaPageState extends State<RegisterConsultaPage> {
  String nombre;
  String apellidos;
  String telefono; 

  var paciente;
  var coleccion;
  
  @override
  void initState() { 
    super.initState();
      
      FirebaseFirestore _db = FirebaseFirestore.instance;
      

      paciente = _db.collection('paciente').where('name',isEqualTo: widget.userAth).snapshots().listen((snapshot) { 
        coleccion = snapshot.docs[0].data();
          this.nombre = coleccion['nombre'] ;
      });

      


  }




 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.greenAccent,
         centerTitle: true,
         elevation: 20.0,
         title: Text("Registrar Consulta",
         style: TextStyle(fontSize: 14),
         ),
       ),
       drawer: MedicoMenu(data: widget.userAth,),
       body: Container(
         child: Text("Formulario 1 crear consulta")
         ),
    );
  }
}