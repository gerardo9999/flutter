
import 'package:flutter/material.dart';

Widget myGridView(String titulo, String imagen, Color color1, Color color2){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      gradient: new LinearGradient(colors: [
        color1,
        color2
      ],
      begin: Alignment.centerLeft,
      end : Alignment(1.0, 1.0)
      )
    ),
    child: Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage(imagen),
                fit: BoxFit.fill
              )
            ),
          )
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Consultas Medicas", style: TextStyle(color: Colors.white, fontSize: 16,)),
                  )
                ],

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(titulo, style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold ),), 
            
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: GestureDetector(
                  onTap: () { 
                      print("Tapped a Container"); 
                  },
                  child: Container(

                    child: FlatButton(
                    child: Text('Ver Consultas'),
                    color: color1,
                    textColor: Colors.white,
                    onPressed: () {
                      print("Ver consultas diarias");
                    },
                  ),





                    // Icon(Icons.access_alarm_rounded),
                  ),
              ),
            )

          ],
        )
      ],
    ),
  );
}
