import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/dev/feature_model.dart';
import 'package:retrofit/retrofit.dart';

part 'dev_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1/dev")
abstract class DevService {
  factory DevService(Dio dio, {String baseUrl}) = _DevService;

  @POST('/feature')
  Future<HttpResponse> submitFeatureSuggestion(
    @Header('user-id') int userId,
    @Header('Authorization') String accessToken,
    @Body() Feature feature,
  );
}
