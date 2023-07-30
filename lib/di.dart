import 'package:authentication_repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DI {
  static Future<void> init() async {
    _registerRepositories();
  }

  static _registerRepositories() {
    final authRepo = AuthRepositoryFactory.create(AuthProvider.firebase);
    getIt.registerSingleton(authRepo);
  }
}
