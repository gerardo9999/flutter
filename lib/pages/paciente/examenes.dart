import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/components/PacienteMenu.dart';
import 'package:software2/formularios/frmExamen.dart';
import 'package:software2/providers/ExamenProvider.dart';


class ExamenPage extends StatelessWidget {
  final data;
  const ExamenPage({this.data});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => ExamenProvider(),
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ExamenList(data: this.data,),
      ),
    );
  }
}


class ExamenList extends StatefulWidget {
  final data;
  const ExamenList({this.data});
  @override
  _ExamenListState createState() => _ExamenListState();

}

class _ExamenListState extends State<ExamenList> {
  final _db = FirebaseFirestore.instance;
  @override

  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.greenAccent,
        title : Text("Examenes Medicos")
      ),
      drawer: PacienteMenu(data: widget.data,),
      body: StreamBuilder<QuerySnapshot>(
        stream: _db.collection('examenes').snapshots(),
        builder: (context,snapshot){
            if(snapshot.hasData){
              return 
                ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context,index){
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      child: ListTile(
                        title: Text(
                          ds['tipo']
                        ),
                      ),
                    );
                  },
                );
            }else if(snapshot.hasError){
              return CircularProgressIndicator();
            }else{
              return CircularProgressIndicator();
            }
        })

      ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: (){
          Navigator.pushReplacement(
                                        context, 
                                        MaterialPageRoute(
                                        builder: (context) => FormExamenPaciente(data: widget.data,)
                                        )
                      );
        },
        child: Icon(Icons.add),
      
      ),
    );
  }
}
