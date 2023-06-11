import 'package:authentication_repository/src/auth_providers/auth_provider.dart';
import 'package:authentication_repository/src/repositories/authentication_repository.dart';
import 'package:authentication_repository/src/repositories/firebase_auth/firebase_authentication_repository.dart';

class AuthRepositoryFactory {
  static AuthenticationRepository create(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.firebase:
        return FirebaseAuthenticationRepository();
    }
  }
}
