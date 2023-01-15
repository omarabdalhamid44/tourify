import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DatabasePlaceOfEntertainment {
  FirebaseFirestore firestore =FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read(String idname) async {
    QuerySnapshot? querySnapshot;
    List docs =  [];
    try {
      querySnapshot =
      await firestore.collection('PlaceOfEntertainment').get();
      for (var doc in querySnapshot.docs) {
        if(doc.id ==idname ){

             Map a = doc.data() as Map;

        docs.add(a);
      }}
    } catch (e) {
      print(e);
    }
    return docs;
  }


}