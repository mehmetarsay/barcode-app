import 'package:get_it/get_it.dart';
import 'package:market/repository/UrunRepository.dart';
import 'package:market/services/FirestoreDBService.dart';

GetIt locator = GetIt.I;

void setupLocator(){
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => UrunRepository());
}