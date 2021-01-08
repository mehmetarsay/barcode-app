
import 'package:market/models/Urun.dart';

abstract class DatabaseBase {
  Future<bool> setUrun(Urun urun);
  Future<Urun> readUrun(String barkod);
  Future<bool> createUrun(Urun urun);
}