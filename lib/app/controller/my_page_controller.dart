import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
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

  Rx<MyPageInfo> myPageinfo = MyPageInfo(
    profile_file_path: 'profile_file_path',
    nickname: 'nickname',
    total_credit: 0,
    this_month_credit: 0,
    //current: AuthorityGym(authority_id: 0, gym_name: ''),
    //authority_gyms_count: 0,
    //authority_gyms: List<AuthorityGym>.empty(),
  ).obs;

  /*
  @override
  onInit() async {
    super.onInit();
    loadMyPageInfo();
  }*/

  void loadMyPageInfo() {
    myPageinfo = MyPageInfo(
      profile_file_path: getString(AppString.key_profile_file_path)!,
      nickname: getString(AppString.key_nickname)!,
      total_credit: getInt(AppString.key_total_credit)!,
      this_month_credit: getInt(AppString.key_this_month_credit)!,
    ).obs;
  }
}
