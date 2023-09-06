import 'dart:io';
import 'dart:typed_data';
import 'package:adopt_me/autentication.dart';
import 'package:adopt_me/pets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:adopt_me/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Petition{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<bool> checkIfEmailExist(String email) async{
    final QuerySnapshot snapshot = await firestore
        .collection('User')
        .where('email', isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  Future<void> addUser(User user){
    return firestore
      .collection('User')
      .add({
        'name' : user.nombre,
        'cedula' : user.cedula,
        'email' : user.email,
        'phone' : user.phone,
        'bornDate' : user.bornDate,
        'address' : user.address
      })
      .then((value) => print("añadido"))
      .catchError((error) => print("Error: " + error));
  }

  Future<void> loadPhoto(File? file, String filename) async {
    final ref = await FirebaseStorage.instance.ref().child('uploads/$filename');
    ref.putFile(file!);
  }
  Future<String?> checkName() async {
    try{
      CollectionReference user = firestore.collection('User');
      QuerySnapshot querySnapshot = await user.where('email', isEqualTo: Authentication.correo).get();
      if (querySnapshot.docs.isNotEmpty) {
        var nombre = querySnapshot.docs.first['name'];
        return nombre.toString();
      } else {
        return null;
      }
    }catch(e){
      print("Error al consultar Firestore: $e");
      return null;
    }
  }

  Future<void> addPet(Pets pet){
    bool check = false;
    return firestore
    .collection('Pets')
    .add({
      'name' : pet.nombre,
      'age' : pet.edad,
      'raza' : pet.raza,
      'address' : pet.address,
      'phone' : pet.phone,
      'department' : pet.departament,
      'city' : pet.city,
      'url' : pet.url
    })
    .then((value) => print("exitoso"))
    .catchError((error)=> print("Error: " + error));
  }
}
