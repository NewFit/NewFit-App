import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/attribute_model.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/services/service/social_login.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GoogleLogin extends SocialLogin with StorageUtil {
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
      debugPrint("정보 보내고 유저 토큰 받기");
      newfitToken = await userService
          .login(Attribute(attribute_name: idToken, provider_type: "GOOGLE"));
      saveString('access-token', newfitToken!.access_token);
      saveInt('oauth-history-id', newfitToken!.id);
      return newfitToken!.id_type;
    } catch (error) {
      printError();
      debugPrint(error.toString());
      return "";
    }
  }

  Future<String> getGoogleUserIdToken() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser;

    try {
      googleUser = await googleSignIn.signIn();
      return googleUser!.id;
    } catch (error) {
      return "false";
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
