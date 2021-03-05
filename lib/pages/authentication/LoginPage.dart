import 'package:flutter/material.dart';
import 'package:software2/formularios/frmLogin.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/models/Usuario.dart';
import 'package:software2/widgets/circle.dart';
import 'package:software2/widgets/iconoLogo.dart';

class LoginPage extends StatefulWidget {

  Usuario usuario;

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    
    Responsive responsive = Responsive(context);
    final double blueSize = responsive.wp(80);
    final double pinkSize = responsive.wp(50);
    final String welcome = "Hola amigo\n Bienvenido";
    
    
    return Scaffold(
        body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },

        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[


                Positioned(
                  top: -blueSize*0.4,
                  right: -blueSize*0.15,
                  child: Circle(
                    size:blueSize,
                    colors: [
                      Colors.blue,
                      Colors.blueAccent
                    ],
                  ),
                ),

                Positioned(
                  top: -pinkSize* 0.4,
                  left: -pinkSize* 0.10,
                  child: Circle(
                    size: pinkSize,
                    colors: [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                  ),
                ),

                Positioned(
                  top: blueSize*0.35,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        size : responsive.wp(20)
                      ),

                      SizedBox(height: 30),
                      Text(welcome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(1.5)
                        ),
                      ),

                    ],
                  )
                ),

                LoginForm(
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}