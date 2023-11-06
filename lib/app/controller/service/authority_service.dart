import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';
import 'package:new_fit/app/data/model/json_models/gym/address_gym_list_model.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'authority_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class AuthorityService {
  factory AuthorityService(Dio dio, {String baseUrl}) = _AuthorityService;

  @GET('/authority')
  Future<AddressGym> getMyGymList();

  @GET('/authority/reservations')
  Future<ReservationList> getMyReservationList();
}
