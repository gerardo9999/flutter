import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software2/formularios/frmRegister.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/models/Usuario.dart';
import 'package:software2/widgets/avatar.dart';
import 'package:software2/widgets/circle.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register'; 
  
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive(context);
    final double blueSize = responsive.wp(80);
    final double pinkSize = responsive.wp(50);
    final String welcome = "Hola amigo\n Registrate";

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
                  top: -blueSize*0.3,
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
                  top: -pinkSize* 0.2,
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
                  top: blueSize*0.2,
                  child: Column(
                    children: <Widget>[
                      
                      Text(welcome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsive.dp(2.5),
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: responsive.dp(5),),
                      Avatar(
                        sizeImage: responsive.wp(20),
                      )
                    ],
                  )
                ),
                RegisterForm(),
                Positioned(
                  top: 15,
                  left: 10,
                  child: SafeArea(
                    child:  CupertinoButton(
                      color: Colors.black12,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(Icons.arrow_back),
                      onPressed: (){
                         Navigator.popAndPushNamed(context, 'login');
                      },
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}