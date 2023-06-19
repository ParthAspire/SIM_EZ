import 'package:google_sign_in/google_sign_in.dart';

class GmailServices {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<GoogleSignIn?> handleSignIn() async {
    try {
      await googleSignIn.signIn();
      print(
          'data ::: ${googleSignIn.currentUser?.email} ::: ${googleSignIn.currentUser?.displayName} ::: ${googleSignIn.currentUser}');
      // User signed in successfully, handle the signed-in user here
      // e.g., send the user's information to a backend server
      return googleSignIn;
    } catch (error) {
      print('Google Sign-In error: $error');
    }
    return null;
  }
}
