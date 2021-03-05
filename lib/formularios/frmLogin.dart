import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/modules/AppMedico.dart';
import 'package:software2/pages/authentication/RegisterPage.dart';
import 'package:software2/providers/UsuarioProvider.dart';
import 'package:software2/widgets/buttonSubmit.dart';
import 'package:software2/widgets/inputText.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  FirebaseFirestore auth = FirebaseFirestore.instance;


  GlobalKey<FormState> _formKey = GlobalKey();

  String _email;
  String _name;
  String _rol;
  String _id;
  String _password;
  Map<String, dynamic> data;
  Map<String, dynamic> dato;
  _submit() async {
    
    final usuarioProvider = Provider.of<UsuarioProvider>(context,listen: false);
    final ok = _formKey.currentState.validate();
    if(ok){
          var usuario ;
          var coleccion ;




          print(this._email);
          print(this._password);

          try { 





          FirebaseFirestore _db = FirebaseFirestore.instance;
          usuario = _db.collection('usuarios')
                          .where("name", isEqualTo: this._name)
                          .snapshots().listen((snapshot) {
                            
                            coleccion   =  snapshot.docs[0].data();
                            this._rol   = coleccion['rol'].toString();
                            this._email = coleccion['email'].toString();
                            this._id    = coleccion['name'].toString();

                            print(this._rol);
                            print(this._id);
                          });


            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email    : this._email,
              password : this._password
            );

            if(this._rol =='laboratorista'){

                Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context) => 
                    AppMedico(data: this._id,)
                  )
                );
                print('Laboratorio');
            }

            print('credenciales correctas');




// allow read, write : if request.auth != null;








          } on FirebaseAuthException catch (e) {

            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
              print('error en la contraseña');

            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
              print('error en el email');
            }
          } catch (e) {
            print(e);
          }
    }
  }





  @override
  Widget build(BuildContext context) {

  final usuarioProvider = Provider.of<UsuarioProvider>(context);

    final Responsive responsive = Responsive(context);
    return Positioned(
      bottom: 30,

      child :Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTable?430:300
        ),
        child: Form(
          key: this._formKey,
          child: Column(
            children: <Widget>[
              InputText(
                label: "Escribir email", 
                keyBoardType: TextInputType.emailAddress,
                fontSize: responsive.hp(2.3),
                onChanged: (text){
                  this._name = text;

                  usuarioProvider.name = text;
                  this._name = text;
                  print(this._name);

                  // print(usuarioProvider.email);
                  // print(this._email);
                },
                validator: (text){
                  if(text.length == 0){
                    return "Email invalido";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2),),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(
                  color: Colors.black26
                ))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: 
                      InputText(
                        label: "Password",
                        obscureText: true,
                        borderEnable: false,
                        fontSize: responsive.hp(2.3),
                        onChanged: (text){
                          this._password = text;
                          usuarioProvider.password = text;
                          print(usuarioProvider.password);
                          
                        }, 
                        validator: (text){
                          if(text.trim().length == 0){
                            return "password invalido";
                          }
                          return null;
                        }, 
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      onPressed: (){
                        // Navigator.popAndPushNamed(context, 'registerUser');

                      }, 
                      child: 
                      Text(
                        "Olvido su Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                  ],
                ),
              ),
              SizedBox(height: responsive.dp(5),),
              SizedBox(
                width: double.infinity,
                child: ButtonSubmit(textBoton: "Iniciar",onPressed: _submit,),
              ),
              SizedBox(height: responsive.dp(1),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Registrate?",
                  style: TextStyle(fontSize: responsive.hp(responsive.isTable ? 1.5:2)),
                  ),
                  FlatButton(
                    onPressed:(){
                      Navigator.push(context, 
                       MaterialPageRoute(
                          builder: (context) => RegisterPage()
                        )
                      );
                    },
                    child: Text("Registrarse", 
                      style: TextStyle(color: Colors.pinkAccent,fontSize: responsive.hp(responsive.isTable ? 1.5:2)),
                    )
                  )
                ],
              ),
              SizedBox(height: responsive.dp(5),),
              Text(data.toString())
            ],
          ),
        ),
      ),
    );
  }
}