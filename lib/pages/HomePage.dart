import 'package:flutter/material.dart';
import 'package:software2/pages/authentication/LoginPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() { 


    Future.delayed(
      Duration(
        milliseconds: 4500),
      () => Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => LoginPage()
        )
      )
    );
    
    
    super.initState();
    
  }

  Widget build(BuildContext context) {
    
    return Scaffold(
     
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(),
              
              Center(
                child: FractionallySizedBox(
                  widthFactor: .6,
                  child: FlutterLogo(
                    size: 400,),
                ),
              ),
              Spacer(),
              CircularProgressIndicator(),
              Spacer(),
              Text("Bienvenido",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.blue,
                  
                  fontWeight: FontWeight.w500 
                  ),),
              Spacer(),
            ],
          ),

      ),

    );
  }
}


