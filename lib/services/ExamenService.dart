import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:software2/models/Examen.dart';

class FirebaseExamen{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String table = 'examenes';



  getIdExamen(){
    return _db.collection(this.table).id;
  } 
  // Obtener
  Stream <List<Examen>> getExamen(){
    return _db
      .collection(this.table)
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((doc) => Examen.fromJson(doc.data()))
          .toList()
      );
  }
  // Insertar o modificar
  Future<void> setExamen(Examen examen){
    var options = SetOptions(merge: true);

    return _db
    .collection(this.table)
    .doc(examen.id)
    .set(examen.toMap(),options);
  }

  Future<void> deleteExamen(String id){
    return _db
    .collection(this.table)
    .doc(id).delete();
  }

   
}