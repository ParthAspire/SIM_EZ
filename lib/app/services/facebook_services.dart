import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookServices {
  Future<LoginResult?> handleLogin() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        // User signed in successfully, handle the signed-in user here
        // e.g., send the user's information to a backend server
        return result;
      } else {
        print('Facebook Login failed: ${result.status}');
      }
    } catch (error) {
      print('Facebook Login error: $error');
    }
    return null;
  }
}
