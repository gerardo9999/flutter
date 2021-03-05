import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/pages/paciente/examenes.dart';
import 'package:software2/providers/UsuarioProvider.dart';
import 'package:software2/widgets/avatar.dart';

class PacienteMenu extends StatelessWidget {
  // final userId ;
  final data ;
  PacienteMenu({this.data});



  @override
  Widget build(BuildContext context) {


    Responsive responsive = Responsive(context);

    final usuarioProvider = Provider.of<UsuarioProvider>(context,listen: false);

    

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
                 
                 Text(data,
                  style: TextStyle(
                      fontSize: responsive.hp(1.8),
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                 Text("Paciente",
                  style: TextStyle(
                   fontSize: responsive.hp(1.2),
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                 ),
                SizedBox(height: responsive.dp(2),),
                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.person, color:Colors.black,),
                  title: Text("Perfil"),
                ),

                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.supervised_user_circle_rounded, color:Colors.black,),
                  title: Text("Consultas"),
                ),

                ListTile(
                  onTap: (){
                      Navigator.pushReplacement(
                                        context, 
                                        MaterialPageRoute(
                                        builder: (context) => ExamenPage(data: this.data,)
                                        )
                      );

                  },
                  leading: Icon(Icons.supervised_user_circle, color:Colors.black,),
                  title: Text("Examenes"),
                ),


                ListTile(
                  onTap: (){


                  },
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