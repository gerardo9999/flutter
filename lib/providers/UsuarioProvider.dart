import 'package:flutter/cupertino.dart';
import 'package:software2/models/Usuario.dart';
import 'package:software2/services/UsuarioService.dart';
import 'package:uuid/uuid.dart';


class UsuarioProvider with ChangeNotifier{
  
  final firestoreService = FirebaseUsuario();

  String id;
  String name;
  String email;
  String password;
  String rol;
  var uuid = Uuid();

  String get getId       => id;
  String get getName     => name;
  String get getEmail    => email;
  String get getPassword => password;
  String get getRol      => rol;

  set setId(String id){
    this.id = id;
    notifyListeners();
  }

  set setNombre(String name){
    this.name = name;
    notifyListeners();
  }

  set setApellidos(String email){
    this.email = email;
    notifyListeners();

  }

  set setDireccion(String password){
    this.password = password;
    notifyListeners();
  }

  set setEmail(String rol){
    this.rol = rol;
    notifyListeners();
  }

  cargarTodo(Usuario user){
    if(user != null){
      this.name     = user.name;
      this.email    = user.email;
      this.password = user.password;
      this.rol      = user.rol;
    }
  }

  guardarUsuario(){
      if(this.id == null){
        var usuario = Usuario(
                                id       : this.name,
                                name     : this.name,
                                email    : this.email,
                                password : this.password,
                                rol      : this.rol
                              );
        
        firestoreService.setUsuario(usuario);

      }else{
        // update
        var usuario = Usuario(
                                id       : this.id,
                                name     : this.name,
                                email    : this.email,
                                password : this.password,
                                rol      : this.rol,
                              );
        
        firestoreService.setUsuario(usuario);
      }
    }

    eliminarUsuario(String id){
      firestoreService.deleteUsuario(id);
    }

    buscarUsuario(String email){
      
    }

    authTenticado(){
      return  true;
    }



}