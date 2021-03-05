import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/pages/administrador/Medicopage.dart';
import 'package:software2/providers/UsuarioProvider.dart';
import 'package:software2/widgets/avatar.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    

    
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
                 
                 Text("Rol",
                  style: TextStyle(
                      fontSize: responsive.hp(1.8),
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                 Text("Administrador",
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
                  title: Text("Usuarios"),
                ),

                ListTile(
                  onTap: (){
                      Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                      builder: (context) => MedicoPage()

                  )
                );
                  },
                  leading: Icon(Icons.supervised_user_circle_rounded, color:Colors.black,),
                  title: Text("Medicos"),
                ),

                ListTile(
                  onTap: (){

                    },
                  leading: Icon(Icons.supervised_user_circle, color:Colors.black,),
                  title: Text("Pacientes"),
                ),


                ListTile(
                  onTap: (){},
                  leading: Icon(Icons.settings, color:Colors.black,),
                  title: Text("Configuracion"),
                )


              ],),
          ),
        )
      ],), 
    );
  }
}