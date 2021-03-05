import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/pages/labortorio/listConsultas.dart';


class AsignarEspecialista extends StatefulWidget {



  final idConsulta;
  // final estado;
  final fecha;
  // final id;
  // final idEspecialista;
  final idPaciente;
  final precio;
  final tipo;
  final userAuth;
  final day;
  final month;
  final year;

  AsignarEspecialista({
    this.idConsulta,
    // this.estado,
    this.fecha,
    // this.id,
    // this.idEspecialista,
    this.idPaciente,
    this.precio,
    this.tipo,
    this.userAuth,
    this.day,
    this.month,
    this.year
  });



  @override
  _AsignarEspecialistaState createState() => _AsignarEspecialistaState();
}

class _AsignarEspecialistaState extends State<AsignarEspecialista> {

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
                      // .where("fecha", isEqualTo: widget.fecha)
                      .snapshots();
  }

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Seleccione un Especialista",
        style: TextStyle(
          fontSize: 16 ),),
      ),
      body: 

      // Text(widget.idConsulta),
        
        
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
                                                      
                          print(ds.id);
                          // new Timestamp ( seconds :  number ,  nanoseconds :   ) : Timestamp
                          print(widget.fecha);

                                      var consulta = ({
                                      'estado'   : true,
                                      'fecha': widget.fecha,
                                      'idEspecialista' : ds.id,
                                      'id' : widget.tipo,
                                      'idPaciente': widget.idPaciente,
                                      'precio'     : widget.precio,
                                      'tipo'    : widget.tipo,
                                      'day'    : widget.day,
                                      'month'    : widget.month,
                                      'year'    : widget.year
                                    });

                                    print(consulta);
                                    
                              

                                    FirebaseFirestore db = FirebaseFirestore.instance;
                                    db.collection('examenes').doc(widget.idConsulta).set(
                                     consulta
                                    );
                                    

                                    Navigator.push(context, 
                                        MaterialPageRoute(builder: 
                                          (_) => ListConsulta(userAuth: widget.userAuth)
                                        )
                                    );
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
      
      drawer: MedicoMenu(data : widget.userAuth),
      
    );
  }
}