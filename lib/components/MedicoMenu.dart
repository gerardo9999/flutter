import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/pages/labortorio/ListPaciente.dart';
import 'package:software2/pages/labortorio/listConsultas.dart';
import 'package:software2/pages/labortorio/listMedico.dart';
import 'package:software2/pages/labortorio/menuListaConsulta.dart';
import 'package:software2/widgets/avatar.dart';

class MedicoMenu extends StatelessWidget {
  
  final data;
  
  const MedicoMenu({this.data});

                     

  @override
  Widget build(BuildContext context) {

    
    Responsive responsive = Responsive(context);


    return Drawer(
      child:   Column(children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 
                 Avatar(
                  sizeImage: responsive.wp(20),
                 ),
                 
                 SizedBox(height: responsive.dp(2),),
                 
                 Text("Usuario",
                  style: TextStyle(
                      fontSize: responsive.hp(1.8),
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                 Text(this.data,
                  style: TextStyle(
                   fontSize: responsive.hp(1.2),
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                 ),
                SizedBox(height: responsive.dp(2),),
                ListTile(
                  onTap: (){
                    //   var count;
                    //     FirebaseFirestore dls = FirebaseFirestore.instance;

                    //       dls.collection('examenes')
                    //                     // .where("fecha", isEqualTo: now)
                    //                     .snapshots();

                    //       // dls.collectionGroup(collectionPath)
                    // print(count);
                    Navigator.push(context, 
                                          MaterialPageRoute(builder: 
                                            (_) => MenuConsultas(userAuth: this.data,)
                                          )
                    );
                  },
                  leading: Icon(Icons.person, color:Colors.black,),
                  title: Text("Consultas"),
                ),

                ListTile(
                  onTap: (){
                    Navigator.push(context, 
                      MaterialPageRoute(builder: 
                        (_) => ListMedico(data: this.data,)
                      )
                    );
                  },
                  leading: Icon(Icons.supervised_user_circle_rounded, color:Colors.black,),
                  title: Text("Medicos"),
                ),

                ListTile(
                  onTap: (){
                     Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => PacienteHome(data: this.data,)
                        )
                      );
                  },
                  leading: Icon(Icons.supervised_user_circle, color:Colors.black,),
                  title: Text("Pacientes"),
                ),


                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.settings, color:Colors.black,),
                  title: Text("Salir"),
                )


              ],),
          ),
        )
      ],), 
    );
  }
}