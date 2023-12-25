import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SettingPageController extends BaseController with StorageUtil {
  DBManager dbManager = DBManager();
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

  logout() {
    UserService(dio).logout(
      '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}',
      getInt(AppString.key_user_id)!,
    );
    dbManager.delete();
    Get.toNamed(AppPages.LOGIN);
  }
}
