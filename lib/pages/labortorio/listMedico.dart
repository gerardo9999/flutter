import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/pages/labortorio/infoMedico.dart';
import 'package:software2/pages/labortorio/registerMedico.dart';

class ListMedico extends StatefulWidget {
  
  
  final data;
  ListMedico({
    this.data 
  });

  @override
  _ListMedicoState createState() => _ListMedicoState();
}

class _ListMedicoState extends State<ListMedico> {
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
      usuarios = _db.collection('medicos')
                      // .where("", isEqualTo: "paciente")
                      .snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         elevation: 20.0,
         title : Text("Medicos",
         style: TextStyle(
            fontSize: 16,
          ),
         )
       ),
       drawer: MedicoMenu(
         data: widget.data,
       ),
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
                            ds['email']
                          ),
                          leading: Icon(Icons.supervised_user_circle),


                          onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: 
                              (context) => InfoMedico(
                                userAuth  : widget.data,
                                nombre    : ds['nombre'],
                                apellidos : ds['apellidos'],
                                direccion : ds['direccion'],
                                email     : ds['email'],
                                name      : ds['name'],
                                telefono  : ds['telefono'],
                                carnet    : ds['carnet'],
                                idu       : ds.id
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
            // Navigator.pushReplacement(
            //       context, 
            //       MaterialPageRoute(
            //         builder: (context) => RegistePacientePage(userAuth: widget.data,)
            //       )
            //     );
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (_) => RegisterMedico())
            );
          },
        ),    
    );
  }
}