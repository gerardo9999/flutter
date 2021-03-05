import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:software2/models/Usuario.dart';

class FirebaseUsuario{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String table = 'usuarios';

  Future<bool> userAutn(){
    _auth.authStateChanges().listen((User user) { 
      bool sw = true;
      if(user == null){
        sw = false;
      }
      return sw;
    });
  }

  getIdUser(){
    
    return _db.collection(this.table).id;
    
  } 

  //   var document = await Firestore.instance.collection('COLLECTION_NAME').document('TESTID1');
  // document.get() => then(function(document) {
  //     print(document('name'));
  // }
  
  // FirebaseAuth.instance
  //   .authStateChanges()
  //   .listen((User user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  // });

  // FirebaseAuth.instance.AuthCredential;

  Future<String> getCurrentUID() async {
    return _auth.currentUser.uid;
  }

  // Obtener
  Stream <List<Usuario>> getUsuarios(){
    
    return _db
      .collection(this.table)
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((doc) => Usuario.fromJson(doc.data()))
          .toList()
      );
  }







  // Insertar o modificar
  Future<void> setUsuario(Usuario user){
    var options = SetOptions(merge: true);

    return _db
    .collection(this.table)
    .doc(user.id)
    .set(user.toMap(),options);
  }

  Future<void> deleteUsuario(String id){
    return _db
    .collection(this.table)
    .doc(id).delete();
  }

   
}