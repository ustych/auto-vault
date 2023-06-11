/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
class FirebaseLogInWithGoogleException implements Exception {
  const FirebaseLogInWithGoogleException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory FirebaseLogInWithGoogleException.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const FirebaseLogInWithGoogleException(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const FirebaseLogInWithGoogleException(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const FirebaseLogInWithGoogleException(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const FirebaseLogInWithGoogleException(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const FirebaseLogInWithGoogleException(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const FirebaseLogInWithGoogleException(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const FirebaseLogInWithGoogleException(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const FirebaseLogInWithGoogleException(
          'The credential verification ID received is invalid.',
        );
      default:
        return const FirebaseLogInWithGoogleException();
    }
  }

  /// The associated error message.
  final String message;
}
