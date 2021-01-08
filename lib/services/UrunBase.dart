import 'package:flutter/material.dart';
import 'package:market/models/Urun.dart';

abstract class UrunBase {
  Future<Urun> createUrun({
    @required barkod,
    @required name,
    @required payment,
  });

  Future<Urun> setUrun(Urun urun);

  Future<Urun> readUrun(String barkod);
}
