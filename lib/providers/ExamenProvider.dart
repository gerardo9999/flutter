import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:software2/models/Examen.dart';
import 'package:software2/services/ExamenService.dart';



class ExamenProvider with ChangeNotifier{
  
  final firestoreService = FirebaseExamen();

  String   id;
  String   tipo;
  DateTime fecha;
  double   precio;
  String   idEspecialista;
  String   idPaciente;
  bool     estado;
  int      day;
  int      month;
  int      year;

  String   get getId             => id;
  String   get getTipo           => tipo;
  DateTime get getFecha          => fecha;
  double   get getPrecio         => precio;
  String   get getIdEspecialista => idEspecialista;
  String   get getIdPeciente     => idPaciente;
  int      get getDay            => day;
  int      get getMonth          => month;
  int      get getYear           => year;
  bool   get getEstado           => estado;


  Stream<List<Examen>> get examenes => firestoreService.getExamen();


  set setId(String id){
    this.id = id;
    notifyListeners();
  }

  set setIdEspecialista(String idEspecialista){
    this.idEspecialista = idEspecialista;
    notifyListeners();
  }

  set setIdPaciente(String idPaciente){
    this.idPaciente = idPaciente;
    notifyListeners();
  }

  set setFecha(DateTime fecha){
    this.fecha = fecha;
    notifyListeners();
  }

  set setTipo(String tipo){
    this.tipo = tipo;
    notifyListeners();
  }

  set setPrecio(double precio){
    this.precio = precio;
    notifyListeners();
  }

  set setEstado(bool estado){
    this.estado = estado;
    notifyListeners();
  }

 set setDay(int day){
    this.day = day;
    notifyListeners();
  }

 set setMonth(int month){
    this.month = month;
    notifyListeners();
  }

 set setYear(int year){
    this.year = year;
    notifyListeners();
  }
  

  cargarTodo(Examen examen){
    if(examen != null){
      this.tipo           = examen.tipo;
      this.fecha          = examen.fecha;
      this.precio         = examen.precio;
      this.idEspecialista = examen.idEspecialista;
      this.idPaciente     = examen.idPaciente;
      this.estado         = examen.estado;
      this.day            = examen.day;   
      this.month          = examen.month;   
      this.year           = examen.year;   
    }
  }

  guardarExamen(){

      if(this.id == null){
        var examen = Examen(
                                id             : this.tipo,
                                tipo           : this.tipo,
                                fecha          : this.fecha,
                                precio         : this.precio,
                                idEspecialista : this.idEspecialista,
                                idPaciente     : this.idPaciente,
                                estado         : this.estado,
                                day            : this.day,
                                month          : this.month,
                                year           : this.year

                              );
        
        firestoreService.setExamen(examen);

      }else{
        // update
        var examen = Examen(
                                id       : this.id,
                                tipo     : this.tipo,
                                fecha     : this.fecha,
                                precio    : this.precio,
                                idEspecialista : this.idEspecialista,
                                idPaciente    : this.idPaciente,
                                estado    : this.estado,
                                day            : this.day,
                                month          : this.month,
                                year           : this.year
                              );
        
        firestoreService.setExamen(examen);
      }
    }

    eliminarExamen(String id){
      firestoreService.deleteExamen(id);
    }
}


