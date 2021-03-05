import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:software2/components/MedicoMenu.dart';
// import 'package:timeago/timeago.dart' as timeago;
import 'package:software2/formularios/frmExamen.dart';
import 'package:software2/pages/labortorio/detalleConsulta.dart';

class DetallePacientePage extends StatefulWidget {

  final userAth;
  final idPaciente;
  final nombre;
  final apellidos;
  final telefono;
  final direccion;
  final email;
  final carnet;

  DetallePacientePage({
    this.userAth,
    this.idPaciente,
    this.nombre,
    this.apellidos,
    this.telefono,
    this.direccion,
    this.email,
    this.carnet
    });
  

  @override
  _DetallePacientePageState createState() => _DetallePacientePageState();
}

class _DetallePacientePageState extends State<DetallePacientePage> {
  var consultas;

  void initState(){
    FirebaseFirestore _db = FirebaseFirestore.instance;
    consultas = _db.collection('examenes')
                    .where("idPaciente", isEqualTo: widget.idPaciente)
                    .snapshots();

    print(consultas);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :AppBar(
        backgroundColor: Colors.blue,
        elevation: 20.0,
        centerTitle: true,
        title: Text("Lista de Consultas",
        style: TextStyle(
          fontSize: 16,
        ),),
      ),
      // drawer: MedicoMenu(data: widget.userAth,),
      body:
      StreamBuilder<QuerySnapshot>(
        stream: consultas,
      
        builder: (context,snapshot){
            if(snapshot.hasData){
              return 
                ListView.builder(
                  itemCount: 
                  snapshot.data.docs.length,
                  itemBuilder: (context,index){
                    
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Container(
                      
                      child: Card(
                        child: ListTile(
                          title: 
                          Text(
                            DateFormat.yMMMd().add_jm().format(DateTime.parse(ds['fecha'].toDate().toString())) 
                            ,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            // ds['precio']""
                            ds['tipo']
                            // widget.apellidos
                          ),
                          leading: Icon(Icons.supervised_user_circle),
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleConsulta(
                              
                              fecha: ds['fecha'],
                              precio: ds['precio'],
                              tipo: ds['tipo'],
                              nombre: widget.nombre,
                              apellidos: widget.apellidos,
                              telefono: widget.telefono,
                              direccion: widget.direccion,
                              email: widget.email,
                              carnet : widget.carnet

                              )
                              
                            ));
                          },
                           trailing:
                          Icon(Icons.more_vert, color: Theme.of(context).accentColor),
              

                        ),
                      ),
                    );
                  },
                );
            }else if(snapshot.hasError){
              return CircularProgressIndicator();
            }else{
              return CircularProgressIndicator();
            }
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                    builder: (context) => FormExamenPaciente(
                      data: widget.userAth,
                      idPaciente: widget.idPaciente,
                      nombre: widget.nombre,
                      apellidos: widget.apellidos,
                      telefono: widget.telefono,
                      direccion: widget.direccion,
                      email: widget.email,
                      carnet : widget.carnet
                      )
                )
            );
          },
        ),
    );
  }
}