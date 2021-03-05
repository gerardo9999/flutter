import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/pages/labortorio/RegisterPaciente.dart';

import 'package:software2/providers/ExamenProvider.dart';

import 'infoPaciente.dart';

class PacienteHome extends StatelessWidget {
  final data;
  PacienteHome({this.data});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExamenProvider(),
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPaciente(data: this.data,),
      ),
    );
  }
}


class ListPaciente extends StatefulWidget {
  final data;
  const ListPaciente({this.data});
  @override
  _ListPacienteState createState() => _ListPacienteState();
}


class _ListPacienteState extends State<ListPaciente> {
  
  var usuarios;
  var paciente;
  var dato;



  String  idPaciente;


  @override
  void initState(){
    getUsuario();
    super.initState();  
  }
  
  getUsuario(){
      FirebaseFirestore _db = FirebaseFirestore.instance;
      usuarios = _db.collection('pacientes')
                      // .where("", isEqualTo: "paciente")
                      .snapshots();
  }


  getPaciente(name) async {
        FirebaseFirestore _db = FirebaseFirestore.instance;
          dato = _db.collection('pacientes')
          .where("name", isEqualTo: name)
          .snapshots().listen((event) {
          print(event.docs[0].data());
          paciente = event.docs[0].data();
      });
  }
  



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 20.0,
       backgroundColor: Colors.blue,
       centerTitle: true,
       title: Text("Lista de Pacientes",
       style: TextStyle(
         fontSize: 16
       ),
       ),),
      drawer: MedicoMenu(data: widget.data,),
      body: 
        StreamBuilder<QuerySnapshot>(
        stream: usuarios,
      
        builder: (context,snapshot){
            if(snapshot.hasData){
              return 
                ListView.builder(
                  itemCount: 
                  snapshot.data.docs.length,
                  itemBuilder: (context,index){
                    
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    this.idPaciente = ds['name'];

                    return Container(
                      
                      child: Card(
                        child: ListTile(
                          title: Text(
                            ds['name'],style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            ds.id
                          ),
                          leading: Icon(Icons.supervised_user_circle),


                          onTap: (){

                            this.getPaciente(ds['name']);
                            // print("Pacientes");
                            // print(this.paciente);

                            Navigator.push(context, MaterialPageRoute(builder: 
                              (context) => InfoPaciente(
                                userAuth: widget.data,
                                nombre : ds['nombre'],
                                apellidos : ds['apellidos'],
                              direccion: ds['direccion'],
                                email: ds['email'],
                                name : ds['name'],
                                telefono : ds['telefono'],
                                carnet : ds['carnet']
                              )
                            ));
                          },
                           trailing:
                          Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).accentColor),
              

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
                    builder: (context) => RegistePacientePage(userAuth: widget.data,)
                  )
                );
          },

        ),
    
    );
  }
}