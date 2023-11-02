import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_fit/app/controller/service/social_login.dart';

class GoogleLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final GoogleSignInAccount? googleUser;

    try {
      googleUser = await _googleSignIn.signIn();
    } catch (error) {
      return false;
    }

    try {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
    } catch (error) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> logout() async {
    try {
      await GoogleSignIn().signOut();
    } catch (error) {
      return false;
    }
    return true;
  }
}
