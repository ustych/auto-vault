/// Thrown during the sign up process if a failure occurs.
class FirebaseSignUpWithEmailAndPasswordException implements Exception {
  const FirebaseSignUpWithEmailAndPasswordException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory FirebaseSignUpWithEmailAndPasswordException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseSignUpWithEmailAndPasswordException(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const FirebaseSignUpWithEmailAndPasswordException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const FirebaseSignUpWithEmailAndPasswordException(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const FirebaseSignUpWithEmailAndPasswordException(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const FirebaseSignUpWithEmailAndPasswordException(
          'Please enter a stronger password.',
        );
      default:
        return const FirebaseSignUpWithEmailAndPasswordException();
    }
  }

  /// The associated error message.
  final String message;
}
