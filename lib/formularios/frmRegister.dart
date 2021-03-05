import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/models/Usuario.dart';
import 'package:software2/providers/UsuarioProvider.dart';
import 'package:software2/widgets/buttonSubmit.dart';
import 'package:software2/widgets/inputText.dart';




class RegisterForm extends StatefulWidget {
  


  Usuario usuario;

  RegisterForm({Key key, this.usuario}) : super(key: key);
    


  FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {



  GlobalKey<FormState> _formKey = GlobalKey();
  // final LoginApi _register = LoginApi();
  String  _email ='';
  String  _password ='';
  String  _username='';
  String  _rol='rol';

  _submit() async {
    final ok = _formKey.currentState.validate();
    final usuarioProvider = Provider.of<UsuarioProvider>(context,listen: false);
    if(ok){
      try {

        usuarioProvider.name     = this._username;
        usuarioProvider.email    = this._email;
        usuarioProvider.password = this._password;
        usuarioProvider.rol      = 'paciente';
        usuarioProvider.guardarUsuario();



        print(usuarioProvider.name);
        print(usuarioProvider.email);
        print(usuarioProvider.getPassword);
        print(usuarioProvider.rol);

        UserCredential userCredential = await 
          
          FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: this._email,
            password: this._password
          );
          
          Navigator.popAndPushNamed(context, 'login');

          // medicoProvider.guardarMedico();

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
    }
  }

  final emailLabel = "Email";
  final userNameLabel = "UserName";
  final passwordLabel = "password";
  final passwordMessage = "Olvido su password";  
  final textBoton = "Registrarse";

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
                label: this.userNameLabel, 
                keyBoardType: TextInputType.text,
                fontSize: responsive.hp(2.3),
                onChanged: (text){
                  this._username = text;
                  print(text);
                },
                validator: (text){
                  if(text.trim().length < 5){
                    return "User Name invalido";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2),),
              InputText(
                label: this.emailLabel, 
                keyBoardType: TextInputType.emailAddress,
                fontSize: responsive.hp(2.3),
                onChanged: (text){
                  this._email = text;
                  print(text);
                  
                },
                validator: (text){
                  if(!text.contains("@")){
                    return "Email invalido";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2),),
              
              InputText(
                label: this.passwordLabel, 
                keyBoardType: TextInputType.emailAddress,
                fontSize: responsive.hp(2.3),
                onChanged: (text){
                  this._password = text;
                  print(text);
                },
                validator: (text){
                  if(text.trim().length < 8){
                    return "Password invalido";
                  }
                  return null;
                },
              ),
              
              SizedBox(height: responsive.dp(5),),
              SizedBox(
                width: double.infinity,
                child: ButtonSubmit(textBoton: this.textBoton,onPressed: _submit,),
              ),
              SizedBox(height: responsive.dp(1),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Estas registrado?",
                  style: TextStyle(fontSize: responsive.hp(responsive.isTable ? 1.5:2)),
                  ),
                  FlatButton(
                    onPressed:(){
                      Navigator.popAndPushNamed(context, 'login');
                    },
                    child: Text("Inicia Sesion", 
                      style: TextStyle(color: Colors.pinkAccent,fontSize: responsive.hp(responsive.isTable ? 1.5:2)),
                    )
                  )
                ],
              ),
              SizedBox(height: responsive.dp(5),),
            ],
          ),
        ),
      ),
    );
  }
}