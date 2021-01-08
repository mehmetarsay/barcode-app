import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market/models/Urun.dart';

import 'DatabaseBase.dart';

class FirestoreDBService implements DatabaseBase {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;

  @override
  Future<bool> setUrun(Urun urun) async {
    debugPrint(urun.toMap().toString());
    DocumentSnapshot _readUrun =
    await _firebaseDB.doc("urunler/${urun.barkod}").get();

    if (_readUrun.data() == null) {
      await _firebaseDB.collection("urunler").doc(urun.barkod).set(urun.toMap());
      return true;
    } else {
      return true;
    }
  }
  @override
  Future<Urun> readUrun(String barkod) async {
    DocumentSnapshot _readUrun =
    await _firebaseDB.collection("urunler").doc(barkod).get();
    Map<String, dynamic> _readUrunInfoMap = _readUrun.data();
    if (_readUrunInfoMap != null) {
      Urun _okunanUrunNesnesi = Urun.fromMap(_readUrunInfoMap);
      //print("Okunan user nesnesi :" + _okunanUserNesnesi.toString());
      return _okunanUrunNesnesi;
    } else
      return null;
  }
  @override
  Future<bool> createUrun(Urun urun) async {
    var documentReference = _firebaseDB
        .collection("urunler")
        .doc("${urun.barkod}");
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.data() == null) {
      await documentReference.set(urun.toMap());
      return true;
    } else
      return true;
  }
/*

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) {
    // TODO: implement updateUserName
    throw UnimplementedError();
  }*/

}
