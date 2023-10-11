class TExceptions implements Exception {
  /// The associated error message
  final String message;

  const TExceptions([this.message = "An unknown exception occurred."]);

  ///Create an authentication message
  ///from a firebase authentication exception code.

  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions("Email already exist");
      case 'invalid-email':
        return const TExceptions("Email is not valid or badly formatted");

      case 'weak-password':
        return const TExceptions("Please enter a strong password.");
      case 'user-disabled':
        return const TExceptions(
            "This user has been disabled. Please contact support for help.");

      case 'user-not-found':
        return const TExceptions("Invalid details. Please create an account.");
      case 'wrong-password':
        return const TExceptions("Incorrect password. Please try again.");
      case 'too-many-requests':
        return const TExceptions(
            "Too many requests. Service temporarily blocked.");
      case 'invalid-argument':
        return const TExceptions(
            "An invalid argument was provided to an Authentication method.");
      case 'invalid-password':
        return const TExceptions("Incorrect password. Please try again.");
      case 'invalid-phone-number':
        return const TExceptions("The phone number provide is invalid.");
      case 'operation-not-allowed':
        return const TExceptions(
            "The sign-in provider is disabled for your Firebase project");
      case 'session-cookie-expired':
        return const TExceptions(
            "The provided firebase session cookie has expired.");
      case 'uid-already-exist':
        return const TExceptions(
            "The provided uid is already is use by an existing use.");
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions(
            "Log in failed. Wrong email or password");

      default:
        return const TExceptions();
    }
  }
}
