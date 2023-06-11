import 'package:authentication_repository/src/models/exceptions/firebase_auth_exceptions/firebase_login_with_email_and_password_exception.dart';
import 'package:authentication_repository/src/models/exceptions/firebase_auth_exceptions/firebase_logout_exception.dart';
import 'package:authentication_repository/src/models/exceptions/firebase_auth_exceptions/firebase_sign_up_exception.dart';
import 'package:authentication_repository/src/models/user.dart';
import 'package:authentication_repository/src/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  @override
  Future<void> logInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw FirebaseLogInWithEmailAndPasswordException.fromCode(e.code);
    } catch (_) {
      throw const FirebaseLogInWithEmailAndPasswordException();
    }
  }

  // @override
  // Future<void> logInWithGoogle() {
  //   // TODO: implement logInWithGoogle
  //   throw UnimplementedError();
  // }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {
      throw FirebaseLogOutException();
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw FirebaseSignUpWithEmailAndPasswordException.fromCode(e.code);
    } catch (_) {
      throw const FirebaseSignUpWithEmailAndPasswordException();
    }
  }

  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null
          ? User.empty
          : User(id: firebaseUser.uid, email: firebaseUser.email, name: firebaseUser.displayName);

      return user;
    });
  }
}
