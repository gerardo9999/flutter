import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/pages/labortorio/listMedico.dart';
import 'package:software2/widgets/inputText.dart';

class RegisterMedico extends StatefulWidget {
  final idUser;
  RegisterMedico({
    this.idUser
  });

  @override
  _RegisterMedicoState createState() => _RegisterMedicoState();
}

class _RegisterMedicoState extends State<RegisterMedico> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _nombre    = '';
  String _apellidos = '';
  String _telefono  = '';
  String _email     = '';
  String _direccion = '';
  String _carnet    = '';
  String _user      = '';
  String _password  = '';
  String _rol = 'medico';

  registrar() async{
    final ok = this._formKey.currentState.validate();
    if(ok){
      try {

        var paciente =({
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
          db.collection('medicos').add(
            paciente
          );

          db.collection('usuarios').add(
            usuario
          );

          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: this._email,
            password: this._carnet
          );

          Navigator.pushReplacement(context, MaterialPageRoute(builder: 
          (context) => ListMedico(data: widget.idUser)
          ));


        
      } on FirebaseException catch (e) {
         if(e.code == 'weak-password'){
          print('No user found for that email.');
        // }else if(e.code == 'email-already-in-use'){
          print('Wrong password provided for that user.');
        }
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          " Registrar Medico ",
          style : TextStyle(
            fontSize: 16,

          )
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                elevation: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/medico.jpg'),
                  ],
                ),
              ),
              
              Card(
                child: Column(
                  children: [

                    Container(
                      padding: EdgeInsets.all(10),
                      child: InputText(
                        label: "Nombre",
                        fontSize: responsive.hp(1.5),
                        onChanged: (text){
                          this._nombre =  text;
                          print(this._nombre);
                        },
                        validator: (text){
                          if(text.trim().length == 0 ){
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
                        onChanged: (text){
                          this._apellidos =  text;
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
                        label: "Carnet",
                        onChanged: (text){
                          this._carnet = text;
                          this._password = text;
                          print(this._carnet);

                        },
                        validator: (text){
                          if(text.trim().length == 0){
                            return "complete el campo carnet";
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: InputText(
                        label: "Telefono",
                        onChanged: (text){
                          this._telefono = text;
                          print(this._telefono);
                        },
                        validator: (text) {
                          if (text.trim().length == 0) {
                            return "complete el campo telefono";
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: InputText(
                        label: "Direccion",
                        onChanged: (text){
                          this._direccion = text;
                          print(this._direccion);
                        },
                        validator:(text){
                          if(text.trim().length == 0){
                            return "Complete el campo direccion";
                          }
                          return null;
                        } ,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: InputText(
                        label: "Email",
                        onChanged: (text){
                          this._email = text;
                          print(this._email);
                        },
                        validator: (text){
                          if(text.trim().length == 0){
                            return "Complete el campo email";
                          }
                          return null;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: InputText(
                        label: "User name",
                        onChanged: (text){
                          this._user = text;
                          print(this._user);
                        },
                        validator: (text){
                          if(text.trim().length == 0){
                            return "Complete el campo user name";
                          }
                          return null;
                        },
                      ),
                    ),


                  ], 
                ),
              ),
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: RaisedButton(
                    color : Colors.blue,
                    child: Text("Registrar"),
                    onPressed: registrar,
                  ),
                ),
              )
            ],
          )
        ),
      )
      
      ,
    );
  }

}