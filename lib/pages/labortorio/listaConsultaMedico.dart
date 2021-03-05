import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/pages/labortorio/asignarMedico.dart';

class ListConsulta extends StatefulWidget {
  
  final userAuth;
  final idEspecialista;


  ListConsulta({
    this.userAuth,
    this.idEspecialista
  });
  

  @override
  _ListConsultaState createState() => _ListConsultaState();
}

class _ListConsultaState extends State<ListConsulta> {
  var consultas;
  final DateTime now = DateTime.now();
  
  void initState(){

    FirebaseFirestore _db = FirebaseFirestore.instance;
    consultas = _db.collection('examenes')
                    .where("idEspecialista", isEqualTo: widget.idEspecialista)
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
      drawer: MedicoMenu(data: widget.userAuth,),
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
                            ds['day'] 
                            // widget.apellidos
                          ),
                          leading: Icon(Icons.supervised_user_circle),
                          tileColor: _estado(ds['estado']),
                          onTap: (){
                            if(ds['estado']){
                             //
                            }else{
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                               (context) => AsignarEspecialista(
                                  
                                  idConsulta      : ds.id,
                                  // estado          : ds['estado'],
                                  fecha           : ds['fecha'],
                                  // id              : ds['id'],
                                  // idEspecialista  : ds['idEspecialista'],
                                  idPaciente      : ds['idPaciente'],
                                  precio          : ds['precio'],
                                  tipo            : ds['tipo'],
                                  
                                  userAuth        : widget.userAuth,
                                 )
                               ));
                            }
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
            
          },

        ),
    );
  }
  _estado(d) {
    if(d){
      return Colors.white70;
    }else{
      return Colors.blue;
    }
  }
}