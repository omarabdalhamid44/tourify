import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';


class DatabasePlaceReligion {
  FirebaseFirestore firestore =FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read(String idname) async {
    QuerySnapshot? querySnapshot;
    List docs =  [];
    try {
      querySnapshot =
      await firestore.collection('PlaceReligion').get();
      for (var doc in querySnapshot.docs) {
        if(doc.id == idname ){

          Map a = doc.data() as Map;

          docs.add(a);
      }}
    } catch (e) {
      print(e);
    }
    return docs;
  }


}