import 'package:get_it/get_it.dart';
import 'services/firebase_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseService());
}
