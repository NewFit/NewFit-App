import 'package:dio/dio.dart' hide Headers;
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';
import 'package:retrofit/retrofit.dart';

part 'gym_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class GymService {
  factory GymService(Dio dio, {String baseUrl}) = _GymService;

  @GET('/api/v1/gyms')
  Future<AddressGymList> getGymList(@Header('Authorization') String accessToken,
      @Header('user-id') int user_id, @Query('gym_name') String gym_name);

  @POST('/api/v1/authority')
  Future<HttpResponse> registerGym(@Header('user-id') int user_id,
      @Header('Authorization') String accessToken, @Body() GymId gym_id);

}
