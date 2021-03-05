import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:direct_select/direct_select.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/models/Examen.dart';
import 'package:software2/pages/labortorio/listConsutaPaciente.dart';

import 'package:software2/providers/ExamenProvider.dart';

class FormExamenPaciente extends StatefulWidget {

  final data;
  final idPaciente;
  final nombre;
  final apellidos;
  final telefono;
  final direccion;
  final email;
  final carnet;

  FormExamenPaciente({
    this.data,
    this.idPaciente,
    this.nombre,
    this.apellidos,
    this.telefono,
    this.direccion,
    this.email,
    this.carnet
  });

  @override
  _FormExamenPacienteState createState() => _FormExamenPacienteState();
}

class _FormExamenPacienteState extends State<FormExamenPaciente> {
  // Map<String, dynamic> data;
  Map<String, dynamic> dato;
  Examen examen;


  DateTime fecha ;
  Object length;


  
  
  
  var precio = [
    80,90,98,
    100,100,150,
    100,80,70,
    100,150,100,
    100,90,90
  ];


  var examenes = [
    "Radiografía abdominal",
    "Enema opaco",
    "Radiografía de hueso",

    "Radiografía de los dientes",
    "Radiografía de una extremidad",
    "Radiografía de la mano",

    "Radiografía de las articulaciones",
    "Radiografía de la columna lumbosacra",
    "Radiografía del cuello",

    "Radiografía de la pelvis",
    "Radiografía de los senos paranasales",
    "Radiografía del cráneo",

    "Radiografía de la columna torácica",
    "Tránsito esofagogastroduodenal",
    "Radiografía del esqueleto",
  ];

  var imagenes = [
    'assets/images/abdominal.jpg',
    'assets/images/enema.jpg',
    'assets/images/hueso.jpg',

    'assets/images/diente.jpg',
    'assets/images/extremidades.jpg',
    'assets/images/.jpg',

    'assets/images/enema.jpg',
    'assets/images/enema.jpg',
    'assets/images/enema.jpg',

    'assets/images/enema.jpg',
    'assets/images/enema.jpg',
    'assets/images/enema.jpg',
  
    'assets/images/enema.jpg',
    'assets/images/enema.jpg',
    'assets/images/enema.jpg',
  ];


  int itemIndex = 0;


  List<Widget> _buildItems2() {
    
    return examenes
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }


  @override


  void initState() { 
      CollectionReference _db = FirebaseFirestore.instance.collection('examenes');
      print("Iniciando");

      FirebaseFirestore _c = FirebaseFirestore.instance;
      _c.collection('tipos').snapshots().listen((event) {
        
      });

      print(_c);

      super.initState();
  

  }
 

  _solicitar(){

    var hoy  = DateTime.now();
    print(hoy);
    print(hoy.day);
    print(hoy.month);
    print(hoy.year);

    final examenProvider = Provider.of<ExamenProvider>(context,listen: false);
    FirebaseFirestore _add =  FirebaseFirestore.instance;
    _add.collection('consultas');

    print(examenes[this.itemIndex]);
    print(this.fecha);
    print(this.widget.data);

    examenProvider.fecha          = hoy;
    examenProvider.idPaciente     = widget.idPaciente.toString();
    examenProvider.precio         = precio[itemIndex].toDouble();
    examenProvider.tipo           = examenes[itemIndex];
    examenProvider.idEspecialista = widget.data;
    examenProvider.estado         = false; 
    examenProvider.day            = hoy.day;
    examenProvider.month          = hoy.month;
    examenProvider.year           = hoy.year;



    examenProvider.guardarExamen();
    Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => DetallePacientePage(
                      userAth    : widget.data,
                      idPaciente : widget.idPaciente,
                      nombre     : widget.nombre,
                      apellidos  : widget.apellidos,
                      telefono   : widget.telefono,
                      direccion  : widget.direccion,
                      email      : widget.email,
                      carnet     : widget.carnet
                      )
                  )
    );
    examenProvider.cargarTodo(examen);
    print("Ud ha solicitado un examen medico");

  }

  @override
  Widget build(BuildContext context) {

    var examenProvider = Provider.of<ExamenProvider>(context);
    // examenProvider.examenes;
    var now =  DateTime.now();
    var semana = now.weekday;
    return Scaffold(
      appBar: AppBar(title: Text(semana.toString()),
      // actions: <Widget>[
      //   IconButton(
      //         icon: new Icon(Icons.calendar_today),
      //         onPressed: () {
      //           showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2022)).then((value){
      //             setState((){
      //               this.fecha = value;
      //               print(fecha);
      //             });
      //           } );
      //         },
      //   ),
      // ],
      ),
      drawer: MedicoMenu(data: widget.data),
      body:  
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[

                    Container(
                      child: Card(
                          elevation: 25,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),

                          child: Column(
                            children: <Widget>[
                              ListTile(                        
                                title: Text("Paciente : " + widget.nombre + " " + widget.apellidos,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                                ),
                                subtitle:Text("") ,
                              ),

                              Image.asset('assets/images/doctor.jpg'),
                              
                              DirectSelect(
                                
                                itemExtent: 35.0,
                                selectedIndex: itemIndex,
                                child: MySelectionItem(
                                  isForList: false,
                                  title: examenes[itemIndex],
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    itemIndex = index;
                                    print(itemIndex);
                                  });
                                },
                                items: _buildItems2()
                              ),


                              Row(
                                
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  
                                  FlatButton(
                                    child: Text("Registrar Examen"),
                                    color: Colors.greenAccent,
                                    onPressed:_solicitar,
                                    
                                  ),
                                  // FlatButton(
                                  //   child: Text("Cancelar"),
                                  //   color: Colors.white12,
                                  //   onPressed: () {
                                  //     Text("Cancelar");
                                  //   }
                                  // )
                                ],
                              )
                            ],
                          ),
                      ),
                    ),
                    SizedBox(), 
                    Card(
                        elevation: 25,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        child: Column(children: <Widget>[
                          ListTile(
                              title: 
                              Text(
                                examenes[this.itemIndex].toString()
                                ,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                              ),
                              subtitle: Text(
                                  this.precio[this.itemIndex].toString() + "  Bs",
                                  style : TextStyle(
                                    fontWeight: FontWeight.w700
                                  )
                              ),
                            ),
                            
                            Image.asset(this.imagenes[this.itemIndex],
                            // height: 500,
                            fit: BoxFit.fitWidth,
                            )  
                        ],
                        
                        
                        ),
                    ),

                  ],
                ),
              ),
            ),
          )  
    );
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, 
  this.title, 
  this.isForList = true}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        title,
      )),
    );
  }
}


