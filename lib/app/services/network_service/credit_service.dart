import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/credit/credit_model.dart';
import 'package:retrofit/retrofit.dart';

part 'credit_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1/")
abstract class CreditService {
  factory CreditService(Dio dio, {String baseUrl}) = _CreditService;

  @GET('/credit')
  Future<ScoreBoard> getScoreBoardList(
    @Header('authority-id') int authorityId,
    @Header('Authorization') String accessToken,
  );
}
