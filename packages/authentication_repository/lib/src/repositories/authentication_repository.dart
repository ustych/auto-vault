import 'package:authentication_repository/authentication_repository.dart';

abstract class AuthenticationRepository {
  /// Stream of a [User] which will emit the current user when the authentication state changes.
  Stream<User> get user;

  /// Creates a new user with the provided [email] and [password].
  Future<void> signUp({required String email, required String password});

  /// Starts the Sign In with Google Flow.
  // Future<void> logInWithGoogle();

  /// Signs in with the provided [email] and [password].
  Future<void> logInWithEmailAndPassword({required String email, required String password});

  /// Signs out the current user which will emit
  Future<void> logOut();
}
