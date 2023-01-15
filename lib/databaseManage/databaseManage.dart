import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseUser {
  FirebaseFirestore firestore =FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }
  UserCredential? userCredential;
  var auth =FirebaseAuth.instance;

  // function to read user data
  Future<List> read() async {
    QuerySnapshot? querySnapshot;
    List docs =  [];
    try {
      querySnapshot = await firestore.collection('User').get();
      for (var doc in querySnapshot.docs) {
       if(doc.id == auth.currentUser!.uid){
         Map a = {
           'FullName':doc['FullName'] as String,
           'Email':doc['Email'] as String,
           'password':doc['password'] as String,
           'mobileNumber':doc['mobileNumber'] as String,
           'BirthDay':doc['BirthDay'] as String,
           'Gender':doc['Gender'] as String,
           'ImageProfile':doc['ImageProfile'] as String,
           'city':doc['city'] as String,
           'country':doc['country'] as String,
           'uid':doc['uid'] as String,
         };
         docs.add(a);
       }
       }
    } catch (e) {
      print(e);
    }
    return docs;
  }


  Future<List> readAll() async {
    QuerySnapshot? querySnapshot;
    List docsAll =  [];
    try {
      String? city;
    var i =await  firestore.collection('User').doc(auth.currentUser!.uid).get().then((value) =>
    city =value['city']);

      querySnapshot =
      await firestore.collection('User').get();
      for (var doc in querySnapshot.docs) {
        if(city == doc['city']){
          Map a = {
            'FullName':doc['FullName'] as String,
            'Email':doc['Email'] as String,
            'ImageProfile':doc['ImageProfile'] as String,
            'city':doc['city'] as String,
          };
          docsAll.add(a);
        }
        }


    } catch (e) {
      print('gdgf $e');
    }
  return docsAll;
  }
  Future<void> update({
    String? id,
    String? email,
    String? fullName,
    String? imageProfile,
    String? city,
    String? country,
    String? mobileNumber,
  }) async {
    try {
      await firestore
          .collection("User")
          .doc(id)
          .update({
        'FullName': fullName,
        'Email': email,
        'mobileNumber': mobileNumber,
        'city': city,
        'country': country,
        'ImageProfile': imageProfile});
    } catch (e) {
      print('gggg  :: $e');
    }
  }

  Future<List> readFav(String idname) async {
    QuerySnapshot? querySnapshot;
    List docs =  [];
    try {
      querySnapshot =
      await firestore.collection('User').doc(auth.currentUser!.uid).collection('Favorite').get();
      for (var doc in querySnapshot.docs) {
        if(doc.id ==idname ){

          Map a = doc.data() as Map;

         docs.add(a);
        }
      }

    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> createFav(
      String CatgoryPlace,
      List dataFav
      ) async {
    try {

      print(firestore.collection("User").doc(auth.currentUser!.uid).collection('Favorite').doc('$CatgoryPlace').path);
      await firestore.collection("User").doc(auth.currentUser!.uid).collection('Favorite').doc('$CatgoryPlace').set({
          CatgoryPlace :dataFav

      });

    } catch (e) {
      print(' ggg $e');
    }
  }

  Future<void> deleteFav(String CatgoryPlace,List dataFav) async {
    try {
     await firestore.collection("User").doc(auth.currentUser!.uid).
     collection('Favorite').doc('$CatgoryPlace').update({
        CatgoryPlace : dataFav.remove(0)
      }
    );


    } catch (e) {
      print(e);
    }
  }




}