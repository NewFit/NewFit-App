import 'package:flutter/foundation.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/services/service/social_login.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class GoogleLogin extends SocialLogin {
  Token? newfitToken;
  GetStorage storage = GetStorage();

  @override
  Future<String> login() async {
    String idToken;

    try {
      idToken = await getGoogleUserIdToken();
      newfitToken = await getToken(idToken, AppString.provier_type_google);
      saveTokenInfo(newfitToken!);
      if (newfitToken!.id_informations.length > 1) {
        return AppString.key_authority_id;
      }
      return newfitToken!.id_informations[0].id_type;
    } catch (error) {
      printError();
      debugPrint(error.toString());
      return '';
    }
  }

  Future<String> getGoogleUserIdToken() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser;

    try {
      googleUser = await googleSignIn.signIn();
      return googleUser!.id;
    } catch (error) {
      return '';
    }
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
