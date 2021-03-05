import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software2/components/MedicoMenu.dart';
// @import 'packages/font_awesome/css/all.css';


import 'package:software2/widgets/myGridView.dart';class MenuConsultas extends StatefulWidget {
  final userAuth;
  MenuConsultas({this.userAuth});

  @override
  _MenuConsultasState createState() => _MenuConsultasState();
}

class _MenuConsultasState extends State<MenuConsultas> {
  @override
  var c;
  var m;
  var y;
  var diarias;
  var mensuales;
  var anuales;
  var collection;
  final DateTime now = DateTime.now();


  void initState() { 
    


    FirebaseFirestore db = FirebaseFirestore.instance;




    diarias = db.collection("examenes").where('day',isEqualTo: now.day).
    snapshots().listen((event) {
      setState(() {
        this.c = event.docs.length;
        print(c);  
      });
    });


    mensuales = db.collection("examenes").where('month',isEqualTo: now.month).snapshots().listen((event) {
      setState(() {
        this.m = event.docs.length;
        print(c);  

      });
    });

    anuales = db.collection("examenes").where('year',isEqualTo: now.year).snapshots().listen((event) {
      setState(() {
        this.y = event.docs.length;
        print(c);  

      });
    });


    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Examenes Medicos",
        style: TextStyle(
          fontSize: 16
        ),
        ),
      ),
      drawer: MedicoMenu(data:widget.userAuth),
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: Container(
          child: Column(
            children: [
              

                  Flexible(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft : Radius.circular(40),
                          bottomRight: Radius.circular(40)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(5),
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xff4d9eff),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Row(
                                      
                                      children: [
                                        Text("Hoy dia : " ,
                                          style: TextStyle(
                                            color: Colors.white
                                          )
                                        ),
                                        Text(
                                          c.toString(),
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff4d9eff),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Row(
                                    
                                    children: [
                                      Text("Este Mes : " ,
                                        style: TextStyle(
                                          color: Colors.white
                                        )
                                      ),
                                      Text(
                                        m.toString(),
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      )
                                      
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff4d9eff),
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Row(
                                    
                                    children: [
                                      Text("Este Año : " ,
                                        style: TextStyle(
                                          color: Colors.white
                                        )
                                      ),
                                      Text(
                                        m.toString(),
                                        style: TextStyle(
                                          color: Colors.white
                                        ),
                                      )
                                      
                                    ],
                                  ),
                                )
                              
                              ],
                            )
                          
                           
                          ],
                        ),
                      ),
                    )
                  ),
                
              


              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(16),
                  childAspectRatio: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                    
                    myGridView("Diarias","assets/images/doctor.jpg",Colors.red, Colors.green[400]),
                    myGridView("Mensuales","assets/images/doctor.jpg",Colors.blue, Colors.yellow),
                    myGridView("Anual","assets/images/medica.png",Colors.pink,Colors.purple),

                  ],

                )
              )
              // Contai
            ],
          ),
        )
        
          

      ),
    );
  }
}


