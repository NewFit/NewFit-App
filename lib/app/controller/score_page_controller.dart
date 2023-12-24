import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/credit/credit_model.dart';
import 'package:new_fit/app/services/network_service/credit_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ScoreboardPageController extends BaseController {
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
  final scoreBoard = ScoreBoard().obs;
  final scoreBoardFuture = Future.value(ScoreBoard()).obs;

  @override
  onInit() {
    super.onInit();
    updateMainFuture();
  }

  updateMainFuture() {
    getScoreboardInfo();
    mainFuture.value = Future.wait([scoreBoardFuture.value]);
  }

  assignFutures(List data) {
    final datas = [scoreBoard];
    for (var element in data) {
      datas[data.indexOf(element)].value = element;
    }
  }

  getScoreboardInfo() {
    isLoading(true);
    try {
      dio.interceptors.add(prettyDioLogger);
      scoreBoardFuture.value = CreditService(dio).getScoreBoardList(
        StorageUtil.getInt(AppString.key_authority_id)!,
        '${AppString.jwt_prefix} ${StorageUtil.getString(AppString.key_access_token)!}',
      );
    } finally {
      isLoading(false);
    }
  }
}
