import 'package:dio/dio.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/db_models/user_info_model.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
import 'package:new_fit/app/data/model/json_models/user/attribute_model.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class SocialLogin with StorageUtil {
  Future<String> login();
  Future<bool> logout();

  Dio dio = Dio();
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 500,
  );
  DBManager dbManager = DBManager();
  UserInfo userInfo = UserInfo();
  MyPageInfo myPageInfo = MyPageInfo();

  Future<Token> getToken(String attributeName, String providerType) async {
    dio.interceptors.add(prettyDioLogger);

    return await UserService(dio).login(
      Attribute(
        attribute_name: attributeName,
        provider_type: providerType,
      ),
    );
  }

  saveTokenInfo(Token newfitToken) {
    saveString(AppString.key_access_token, newfitToken.access_token);
    checkListIdTypeAndSave(newfitToken.id_informations);
    getMyPageInfo();
    saveTokenToDB(newfitToken);
  }

  checkListIdTypeAndSave(List<IdInformation> idInformations) {
    for (final idInformation in idInformations) {
      checkIdTypeAndSave(idInformation);
    }
  }

  checkIdTypeAndSave(IdInformation idInformation) {
    if (idInformation.id_type == AppString.key_user_id) {
      saveInt(AppString.key_user_id, idInformation.id);
      userInfo.user_id = idInformation.id;
    } else if (idInformation.id_type == AppString.key_oauth_history_id) {
      saveInt(AppString.key_oauth_history_id, idInformation.id);
      userInfo.oauth_history_id = idInformation.id;
    } else if (idInformation.id_type == AppString.key_authority_id) {
      saveInt(AppString.key_authority_id, idInformation.id);
      userInfo.authority_id = idInformation.id;
    }
  }

  Future<void> saveTokenToDB(Token newfitToken) async {
    userInfo.access_token = newfitToken.access_token;
    userInfo.refresh_token = newfitToken.refresh_token;

    dbManager.saveToken(userInfo);
  }

  getMyPageInfo() async {
    if (getInt(AppString.key_authority_id) != 0 &&
        getInt(AppString.key_authority_id) != null) {
      myPageInfo = await UserService(dio).getMyPageInfo(
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token) ?? 'hello'}',
        getInt(AppString.key_authority_id)!,
      );
    } else {
      myPageInfo = await UserService(dio).getMyPageInfoUserId(
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token) ?? 'hello'}',
        getInt(AppString.key_user_id)!,
      );
    }
    saveUserInfo();
  }

  saveUserInfo() {
    saveString(AppString.key_nickname, myPageInfo.nickname ?? "hello");
    saveInt(AppString.key_total_credit, myPageInfo.total_credit ?? 0);
    saveInt(AppString.key_this_month_credit, myPageInfo.this_month_credit ?? 0);
    saveInt(AppString.key_gym_id, myPageInfo.current?.authority_id ?? 0);
  }
}
