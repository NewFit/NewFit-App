import 'package:dio/dio.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/db_models/user_info_model.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/attribute_model.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class SocialLogin {
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

  Future<Token> getToken(String attributeName, String providerType) async {
    dio.interceptors.add(prettyDioLogger);

    return await UserService(dio).login(
      Attribute(
        attribute_name: attributeName,
        provider_type: providerType,
      ),
    );
  }

  void saveTokenInfo(Token newfitToken) {
    StorageUtil.saveString(
        AppString.key_access_token, newfitToken.access_token);
    checkListIdTypeAndSave(newfitToken.id_informations);
    saveTokenToDB(newfitToken);
  }

  void checkListIdTypeAndSave(List<IdInformation> idInformations) {
    for (final idInformation in idInformations) {
      checkIdTypeAndSave(idInformation);
    }
  }

  void checkIdTypeAndSave(IdInformation idInformation) {
    if (idInformation.id_type == AppString.key_user_id) {
      StorageUtil.saveInt(AppString.key_user_id, idInformation.id);
      userInfo.user_id = idInformation.id;
    } else if (idInformation.id_type == AppString.key_oauth_history_id) {
      StorageUtil.saveInt(AppString.key_oauth_history_id, idInformation.id);
      userInfo.oauth_history_id = idInformation.id;
    } else if (idInformation.id_type == AppString.key_authority_id) {
      StorageUtil.saveInt(AppString.key_authority_id, idInformation.id);
      userInfo.authority_id = idInformation.id;
    }
  }

  void saveTokenToDB(Token newfitToken) {
    userInfo.access_token = newfitToken.access_token;
    userInfo.refresh_token = newfitToken.refresh_token;

    dbManager.saveToken(userInfo);
  }
}
