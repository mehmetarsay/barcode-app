import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Urun {
  String _barkod;
  String _name;
  double _payment;
  DateTime _publishedAt;
  Urun();


  Urun.Info(
      this._barkod,
      this._name,
      this._payment,);

  Map<String, dynamic> toMap() {
    return {
      'barkod': _barkod,
      'name': _name,
      'publishedAt': _publishedAt ?? FieldValue.serverTimestamp(),
      'payment': _payment,
    };
  }

  Urun.fromMap(Map<String, dynamic> parsedMap)
      :
        _barkod = parsedMap['barkod'],
        _name = parsedMap['name'],
        _publishedAt = (parsedMap['publishedAt'] as Timestamp).toDate(),
        _payment = parsedMap['payment'];

  @override
  String toString() {
    return 'Urun{barkod: $_barkod, name: $_name, publishedAt: $_publishedAt,payment: $_payment}';
  }
  set barkod(String value) {
    _barkod = value;
  }

  String get barkod => _barkod;
  String get name => _name;

  double get payment => _payment;

  DateTime get publishedAt => _publishedAt;

  set name(String value) {
    _name = value;
  }

  set payment(double value) {
    _payment = value;
  }

}