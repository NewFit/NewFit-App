import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/gym/address_gym_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'gym_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class GymService {
  factory GymService(Dio dio, {String baseUrl}) = _GymService;

  @GET('/gyms')
  Future<AddressGymList> getGymList(@Query('gym_name') String gym_name);
}
