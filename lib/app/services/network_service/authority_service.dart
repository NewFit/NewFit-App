import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/data/model/json_models/tag/entrance_tag_model.dart';
import 'package:retrofit/retrofit.dart';

part 'authority_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1/")
abstract class AuthorityService {
  factory AuthorityService(Dio dio, {String baseUrl}) = _AuthorityService;

  @GET('/authority')
  Future<AddressGym> getMyGymList(
    @Header('authority-id') String authorityId,
    @Header('Authorization') String accessToken,
  );

  @POST('/authority')
  Future<HttpResponse> registerMyGym(
      @Header('user-id') int userId,
      @Header('Authorization') String accessToken,
      @Body() RegisterAuthorityGym gym);

  @GET('/authority/reservations')
  Future<ReservationList> getMyReservationList(
    @Header('authority-id') String authorityId,
    @Header('Authorization') String accessToken,
  );

  @PATCH('/authority/entry')
  Future<HttpResponse> enterGym(
      @Header('authority-id') String authorityId,
      @Header('Authorization') String accessToken,
      @Body() EntranceTag entranceTag);
}
