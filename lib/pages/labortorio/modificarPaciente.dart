import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:software2/helpers/responsive.dart';
import 'package:software2/pages/labortorio/ListPaciente.dart';
import 'package:software2/widgets/inputText.dart';

class UpdatePaciente extends StatefulWidget {
  final idPaciente;
  final userAuth;
  final nombre;
  final apellidos;
  final carnet;
  final telefono;
  final direccion;
  final email;
  final name;

  
  UpdatePaciente({
    this.idPaciente,
    this.userAuth,
    this.nombre,
    this.apellidos,
    this.carnet,
    this.telefono,
    this.direccion,
    this.email,
    this.name,

  });

  @override
  _UpdatePacienteState createState() => _UpdatePacienteState();
}

class _UpdatePacienteState extends State<UpdatePaciente> {

  GlobalKey<FormState> _formKey =  GlobalKey();
  String _nombre    ;
  String _apellidos ; 
  String _telefono  ; 
  String _email     ; 
  String _direccion ; 
  String _carnet    ; 
  String _user      ; 
  String _password  ; 
  String _rol       = 'paciente'; 
  String _idPaciente ;


  

  actualizar() async{
    final ok = this._formKey.currentState.validate();
    if(ok){
     
        

          print("Registrando paciente");
          

          var paciente = ({
            'nombre'   : this._nombre,
            'apellidos': this._apellidos,
            'carnet'   : this._carnet,
            'telefono' : this._telefono,
            'direccion': this._direccion,
            'name'     : widget.name,
            'email'    : widget.email,
          });
          
          //  'nombre'   : widget.nombre,
          //   'apellidos': widget.apellidos,
          //   'carnet'   : wi,
          //   'telefono' : "79940828",
          //   'direccion': "C/5 B/Urkupiña",
          //   'name'     : widget.name,
          //   'email'    : widget.email

          // var usuario = ({
          //   'id'       : this._idPaciente,
          //   'name'     : this._user,
          //   'id'       : this._user,
          //   'email'    : this._email,
          //   'password' : this._password,
          //   'rol'      : this._rol
          // });



          FirebaseFirestore db = FirebaseFirestore.instance;
          db.collection('pacientes').doc(widget.idPaciente).set(
           paciente
          );



          // db.collection('usuarios').add(
          //   usuario
          // );

          // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //   email: _email,
          //   password: _password
          // );

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListPaciente(data: widget.userAuth)
          ));
      
     
    }
  }



  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);


    return Scaffold(
       appBar: 
       AppBar(
         centerTitle: true,
         title: Text("Modificar Paciente",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800


            ),         
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
                            label: "Nombre : " + widget.nombre ,
                            
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){

                              if(text.trim().length == 0){
                                this._nombre = widget.nombre;
                                // this._idPaciente = widget.idPaciente;
                                print(this._nombre);
                              }else{
                                this._nombre = text;
                              }

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
                            label: "Apellidos : "+ widget.apellidos,
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){

                              if(text.trim().length == 0){
                                this._apellidos = widget.apellidos;
                                // this._idPaciente = widget.idPaciente;
                                print(this._apellidos);
                              }else{
                                this._apellidos = text;
                              }
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
                            label: "Carnet Identidad : " + widget.carnet ,
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                             if(text.trim().length == 0){
                                this._carnet = widget.carnet;
                                // this._idPaciente = widget.idPaciente;
                                print(this._carnet);
                              }else{
                                this._carnet= text;
                              }
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
                            label: "Telefono : "+widget.telefono,
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              if(text.trim().length == 0){
                                this._telefono = widget.telefono;
                                // this._idPaciente = widget.idPaciente;
                                print(this._telefono);
                              }else{
                                this._telefono = text;
                              }
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
                            label: "Direccion : "+widget.direccion,
                            fontSize: responsive.hp(1.5),
                            onChanged: (text){
                              if(text.trim().length == 0){
                                this._direccion = widget.direccion;
                                // this._idPaciente = widget.idPaciente;
                                print(this._direccion);
                              }else{
                                this._direccion = text;
                              }
                            },
                            validator: (text){
                              if(text.trim().length == 0){
                                return "Campo requerido";
                              }
                              return null;
                            },
                          ), 
                        ),

                      
                      ],
                    )
                      
                  ),
                  Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1, // Will take 50% of screen space
                      child: RaisedButton(
                        color: Colors.blue[300],
                        child: Text('Actualizar'),
                        onPressed: actualizar
                      ),
                    )
                    
                    ,
                  )

                ],
              )

            )

      ),
       
    );
  }
}