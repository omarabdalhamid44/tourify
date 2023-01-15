import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseCity {
  FirebaseFirestore firestore =FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot? querySnapshot;
    List docs =  [];
    try {
      querySnapshot =
      await firestore.collection('Cities').get();
      for (var doc in querySnapshot.docs) {
        Map a = {
          'Name':doc['Name'] as String,
          'DesCrption':doc['DesCrption'] as String,
          'Images':doc['Images'] as List,
          'Rate':doc['Rate'] as String,
          'CreatedAt':doc['CreatedAt'] as String
        };
        docs.add(a);
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }




}