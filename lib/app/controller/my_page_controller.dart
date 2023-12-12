import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MyPageController extends BaseController with StorageUtil {
  Dio dio = Dio();
  var isLoading = true.obs;
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );

  final mainFuture = Future.wait([]).obs;
  final myPageInfo = MyPageInfo().obs;
  final myPageInfoFuture = Future.value(MyPageInfo()).obs;

  @override
  onInit() {
    super.onInit();
    updateMainFuture();
  }

  updateMainFuture() {
    getMyPageInfo();
    mainFuture.value = Future.wait([myPageInfoFuture.value]);
  }

  assignFutures(List data) {
    final datas = [myPageInfo];
    for (var element in data) {
      datas[data.indexOf(element)].value = element;
    }
  }

  void getMyPageInfo() {
    isLoading(true);
    try {
      dio.interceptors.add(prettyDioLogger);
      myPageInfoFuture.value = UserService(dio).getMyPageInfo(
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
        getInt(AppString.key_authority_id)!,
      );

      //saveUserInfo();
    } finally {
      isLoading(false);
    }
  }

  void saveUserInfo() {
    saveString(
        AppString.key_profile_file_path, myPageInfo.value.profile_file_path!);
    saveString(AppString.key_nickname, myPageInfo.value.nickname!);
    saveInt(AppString.key_total_credit, myPageInfo.value.total_credit!);
    saveInt(
        AppString.key_this_month_credit, myPageInfo.value.this_month_credit!);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
