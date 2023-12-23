import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

abstract class SocialLogin with StorageUtil {
  Future<String> login();
  Future<bool> logout();

  void checkIdTypeAndSave(IdInformation idInformation) {
    if (idInformation.id_type == AppString.key_user_id) {
      saveInt(AppString.key_user_id, idInformation.id);
    } else if (idInformation.id_type == AppString.key_oauth_history_id) {
      saveInt(AppString.key_oauth_history_id, idInformation.id);
    } else if (idInformation.id_type == AppString.key_authority_id) {
      saveInt(AppString.key_authority_id, idInformation.id);
    }
  }
}
