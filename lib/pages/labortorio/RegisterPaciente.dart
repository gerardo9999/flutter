import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software2/components/MedicoMenu.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/models/Paciente.dart';
import 'package:software2/pages/labortorio/ListPaciente.dart';
import 'package:software2/widgets/inputText.dart';

class RegistePacientePage extends StatefulWidget {

  final userAuth;
  RegistePacientePage({this.userAuth});

  @override
  _RegistePacientePageState createState() => _RegistePacientePageState();
}

class _RegistePacientePageState extends State<RegistePacientePage> {
  Paciente paciente = new Paciente();
  
  GlobalKey<FormState> _formKey =  GlobalKey();

  String _nombre    = '';
  String _apellidos = ''; 
  String _telefono  = ''; 
  String _email     = ''; 
  String _direccion = ''; 
  String _carnet    = ''; 
  String _user      = ''; 
  String _password  = ''; 
  String _rol       = 'paciente'; 
  




  registrar() async{
    final ok = this._formKey.currentState.validate();
    if(ok){
      try {
        

          print("Registrando paciente");
          

          var paciente = ({
            'nombre'   : this._nombre,
            'apellidos': this._apellidos,
            'carnet'   : this._carnet,
            'telefono' : this._telefono,
            'email'    : this._email,
            'direccion': this._direccion,
            'name'     : this._user
          });

          var usuario = ({
            'name'     : this._user,
            'id'       : this._user,
            'email'    : this._email,
            'password' : this._password,
            'rol'      : this._rol
          });



          FirebaseFirestore db = FirebaseFirestore.instance;
          db.collection('pacientes').add(
            paciente
          );

          db.collection('usuarios').add(
            usuario
          );

          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password
          );

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListPaciente(data: widget.userAuth)
          ));
      
      } on FirebaseException catch (e) {
        if(e.code == 'weak-password'){
          print('No user found for that email.');
        }else if(e.code == 'email-already-in-use'){
          print('Wrong password provided for that user.');
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    return Scaffold(
       drawer: MedicoMenu(data: widget.userAuth,),
       appBar: AppBar(
         centerTitle: true,
         title: Text("Registrar Paciente",
           style: TextStyle(fontSize: 14),

         ),
       ),
       body: 
       
       SingleChildScrollView(
          
          child: Form(
              key: this._formKey,
              child: Column(
                children: <Widget>[
                  Card(
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/medico.jpg'),
                        ],
                      ),
                  ),
                  
                  Card(
                    child :
                    Column(children: [

                        Container(
                          padding: EdgeInsets.all(10),
                          child: InputText(
                            label: "Nombre",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._nombre = text;
                              print(this._nombre);
                            },
                            validator: (text){
                              if(text.trim().length == 0){
                                return "Complete el campo nombre";
                              }
                              return null;
                            },
                           
                          ),
                        ),



                        Container(
                          padding: EdgeInsets.all(10),
                          child: InputText(
                            label: "Apellidos",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._apellidos = text;
                              print(this._apellidos);
                            },
                            validator: (text){
                              if(text.trim().length == 0){
                                return "Complete el campo apellidos";
                              }
                              return null;
                            },
                          ),
                        ),
                        
                        Container(
                          padding: EdgeInsets.all(10),
                          child: InputText(
                            label: "Carnet Identidad",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._carnet = text;
                              this._password = text;
                              print(this._carnet);
                              print(this._password);
                            },
                            validator: (text){
                              if(text.trim().length==0){
                                return "El campo es requerido";
                              }
                              return null;
                            },
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(10),
                          child: InputText(
                            label: "Telefono",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._telefono = text;
                              print(this._telefono);
                            },
                            validator: (text){
                              if(text.trim().length == 0){
                                return "El campo es requerido";
                              }
                            },
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(10),
                          child: InputText(
                            label: "Direccion",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._direccion = text;
                              print(this._direccion);
                            },
                            validator: (text){
                              if(text.trim().length == 0){
                                return "Campo requerido";
                              }
                              return null;
                            },
                          ), 
                        ),

                        Container(
                          padding: EdgeInsets.only(top:10,right: 10,left: 10,bottom: 10),
                          child : InputText(
                            label: "Email",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._email = text;
                              print(this._email);
                            },
                            validator: (text){
                              if (text.trim().length == 0){
                                return "Campo requerido";
                              }
                              return null;
                            },
                          )
                        ),

                        Container(
                          padding: EdgeInsets.all(10),
                          child: InputText(
                            label: "User Name",
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              this._user = text;
                              print(this._user);
                            },
                            validator: (text){
                              if(text.trim().length == 0){
                                return "Campo requerido";
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    )
                      
                  ),
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1, // Will take 50% of screen space
                      child: RaisedButton(
                        color: Colors.blue[300],
                        child: Text('Registrar'),
                        onPressed: registrar
                      ),
                    )
                    
                    ,
                  )

                ],
              )

            )



      )
    );
  }


}

