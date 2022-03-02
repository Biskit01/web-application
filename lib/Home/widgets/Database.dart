import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Database {
  Future<String> getData({
    @required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    try {
      final DocumentSnapshot = await reference.get();
      if (DocumentSnapshot.exists) {
        return DocumentSnapshot.data().toString();
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
