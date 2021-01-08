
import 'package:market/locator.dart';
import 'package:market/models/Urun.dart';
import 'package:market/services/FirestoreDBService.dart';
import 'package:market/services/UrunBase.dart';

enum AppMode{DEBUG,RELEASE}
class UrunRepository implements UrunBase {
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  AppMode appMode = AppMode.RELEASE;
  @override
  Future<Urun> createUrun({barkod, name, payment})async {
    if (appMode == AppMode.DEBUG) {
      return Urun.Info(barkod, name, payment);
    } else {
      Urun _urun = Urun.Info(barkod, name, payment);
      bool result = await _firestoreDBService.createUrun(_urun);
      if (result) {
        return await _firestoreDBService.readUrun(_urun.barkod);
      } else {
        return null;
      }
    }
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

}