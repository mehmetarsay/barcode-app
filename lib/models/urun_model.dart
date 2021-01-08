import 'dart:io';

import 'package:flutter/material.dart';
import 'package:market/repository/UrunRepository.dart';
import 'package:market/services/UrunBase.dart';

import '../locator.dart';
import 'Urun.dart';
enum ViewState { Idle, Busy }//busy meşgul / ıdle bos

class UrunModel with ChangeNotifier implements UrunBase {
  ViewState _state = ViewState.Idle;
  UrunRepository _urunRepository = locator<UrunRepository>();
  Urun _urun;

  Urun get urun => _urun;
  set urun(Urun value) {
    _urun = value;
  }
  ViewState get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }


  @override
  Future<Urun> readUrun(String barkod) {
    // TODO: implement readUrun
    throw UnimplementedError();
  }

  @override
  Future<Urun> setUrun(Urun urun) {
    // TODO: implement setUrun
    throw UnimplementedError();
  }

  @override
  Future<Urun> createUrun({barkod, name, payment}) async {
    try {
      state = ViewState.Busy;
      _urun =
          await _urunRepository.createUrun(
        barkod: barkod,
        name: name,
        payment: payment
      );
      return urun;
    } finally {
      state = ViewState.Idle;
    }
  }
}
