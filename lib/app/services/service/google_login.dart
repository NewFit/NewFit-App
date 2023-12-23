import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_fit/app/data/model/json_models/user/attribute_model.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/services/service/social_login.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GoogleLogin extends SocialLogin {
  Token? newfitToken;
  GetStorage storage = GetStorage();
  Dio dio = Dio();
  final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );

  @override
  Future<String> login() async {
    dio.interceptors.add(logger);
    UserService userService = UserService(dio);
    String idToken;

    try {
      idToken = await getGoogleUserIdToken();
      newfitToken = await userService.login(Attribute(
          attribute_name: idToken,
          provider_type: AppString.provier_type_google));
      saveString(AppString.key_access_token, newfitToken!.access_token);
      for (final idInformation in newfitToken!.id_informations) {
        checkIdTypeAndSave(idInformation);
      }
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
