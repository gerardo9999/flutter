import 'package:flutter/material.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/formularios/frmExamen.dart';
import 'package:software2/pages/labortorio/listConsutaPaciente.dart';
import 'package:software2/pages/labortorio/listaConsultaMedico.dart';
import 'package:software2/pages/labortorio/modificarPaciente.dart';


class InfoMedico extends StatefulWidget {
  
  final userAuth;
  final nombre;
  final apellidos;
  final telefono;
  final direccion;
  final email;
  final name;
  final carnet;
  final idu;

  InfoMedico({
    this.userAuth,
    this.nombre,
    this.apellidos,
    this.telefono,
    this.direccion,
    this.email,
    this.name,
    this.carnet,
    this.idu
  });

  @override
  _InfoPacienteState createState() => _InfoPacienteState();
}

class _InfoPacienteState extends State<InfoMedico> {

    String  nombre; 
    String  apellidos;
    String  carnet;
    String  direccion;
    String  telefono;
    String  name;
    String  email;

    var data;
    var dato;

// ¡
    
      @override
      Widget build(BuildContext context) {
     
        return Scaffold(
           appBar: AppBar(
             centerTitle: true,
             title: Text("Perfil Medico",
             style: TextStyle(
               fontSize: 14,
             ),
             ),
             elevation: 0,
             actions: [
               IconButton(
                 icon: Icon(Icons.edit), 
                 onPressed: (){
                  //  Navigator. push(context, MaterialPageRoute(builder: 
                  //   (context) => UpdatePaciente( 
                  //     idMedico: widget.idu,
                  //     userAuth: widget.userAuth,
                  //     nombre : widget.nombre,
                  //     apellidos : widget.apellidos,
                  //     carnet : widget.carnet,
                  //     telefono : widget.telefono,
                  //     direccion : widget.direccion,
                  //     email: widget.email,
                  //     name :widget.name
                  //   )
                  //  ));
                   }
                 )
             ],
           ),
            drawer: MedicoMenu(data: widget.userAuth ,),
            body:
           
              Column(
    
                children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        )
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  children: [
                                    Text(
                                      widget.name ?? '',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text("User",style: TextStyle(color: Colors.white),)
    
                                  ],
                                ),
                              ),
                                ClipOval(
                                  child: Image.network(
                                    'https://png.pngtree.com/png-vector/20190710/ourlarge/pngtree-user-vector-avatar-png-image_1541962.jpg',
                                    width: 120,
                                    height: 120,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Column(
                                    children: [
                                      Text("Telefono",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        widget.telefono ?? '', 
                                        style: TextStyle(color: Colors.white),)
                                    ],
                                ),
                              ),
                            ],
                          ),
                          
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                             this.carnet ?? '',
                             style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12
                              ),
                            ),
                          ),
    
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text( 
                              widget.email ?? '',
                            style: TextStyle(color: Colors.white54,
                              fontSize: 16
                            ),
                            ),
                          ),
    
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text( widget.nombre ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800
                                  ),
                                ),
                                Text(" "),
                                Text( widget.apellidos ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800
                                  ),
                                ),


                              ],
                            ),
                          ),
    
    
                        ],
                      )
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Consultas Medicas",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                
                                Padding(
                                    padding: const EdgeInsets.all(30),
                                    
                                    child: InkWell(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.grey,
                                          ),
                                        
                                            Text("Lista",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          
                                        ],
                                      ),
                                      onTap: (){

                                        Navigator.pushReplacement(context, 
                                          MaterialPageRoute(builder: (context) => 
                                            ListConsulta(
                                              userAuth: widget.userAuth,
                                              idEspecialista: widget.idu,
                                          ))
                                        );
                                        // print("click listo");
                                      },
                                    ),
                                  ),
                              
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: InkWell(
                                    onTap: (){
                                      //     Navigator.pushReplacement(
                                      //     context, 
                                      //     MaterialPageRoute(
                                      //         builder: (context) => FormExamenPaciente(
                                      //           data: widget.userAuth,
                                      //           idMedico: widget.name,
                                      //           nombre: widget.nombre,
                                      //           apellidos: widget.apellidos,
                                      //           telefono: widget.telefono,
                                      //           direccion: widget.direccion,
                                      //           email: widget.email,
                                      //           carnet : widget.carnet

                                                

                                      //           )
                                      //     )
                                      // );
                                      // print("Click");
                                    },
                                    child: Column(
                                        children: [
                                          Icon(
                                            Icons.add_alarm_rounded,
                                            color: Colors.grey,
                                          ),
                                          Text("Realizar",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                  ),
                                )
                              ],
                            )
                          ],),
                      ),
                    )
                    

                ],
               
              )
           ,
        );
      }
}





