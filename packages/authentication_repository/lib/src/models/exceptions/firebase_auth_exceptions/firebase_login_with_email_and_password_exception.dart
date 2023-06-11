/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
class FirebaseLogInWithEmailAndPasswordException implements Exception {
  const FirebaseLogInWithEmailAndPasswordException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory FirebaseLogInWithEmailAndPasswordException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseLogInWithEmailAndPasswordException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseLogInWithEmailAndPasswordException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const FirebaseLogInWithEmailAndPasswordException(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const FirebaseLogInWithEmailAndPasswordException(
          'Incorrect password, please try again.',
        );
      default:
        return const FirebaseLogInWithEmailAndPasswordException();
    }
  }

  /// The associated error message.
  final String message;
}
