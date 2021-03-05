import 'dart:ffi';

class Examen{
  String id;
  String tipo;
  DateTime fecha;
  double  precio;
  String idEspecialista;
  String idPaciente;
  bool estado;
  int day;
  int month;
  int year;

  Examen({
    this.id,
    this.tipo,
    this.fecha,
    this.precio,
    this.idEspecialista,
    this.idPaciente,
    this.estado,
    this.day,
    this.month,
    this.year
  });

  factory Examen.fromJson(Map<String , dynamic> json){
    return Examen(
      id              : json['id'],
      tipo            : json['tipo'],
      fecha           : json['fecha'],
      precio          : json['precio'],
      idEspecialista  : json['idEspecialista'],
      idPaciente      : json['idPaciente'],
      estado          : json['estado'],
      day             : json ['day'],
      month           : json ['month'],
      year            : json ['year'],

    );
  }

  Map<String,dynamic> toMap(){
    return {
        'id'             : id,
        'tipo'           : tipo,
        'fecha'          : fecha,
        'precio'         : precio,
        'idEspecialista' : idEspecialista,
        'idPaciente'     : idPaciente,
        'estado'         : estado,
        'day'            : day,
        'month'            : month,
        'year'            : year
    };
  }
}
