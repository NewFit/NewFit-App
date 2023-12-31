import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/data/model/json_models/tag/equipment_tag_model.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1/")
abstract class ReservationService {
  factory ReservationService(Dio dio, {String baseUrl}) = _ReservationService;

  @POST('/reservations/{equipmentGymId}')
  Future<HttpResponse> reserveEquipment(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path('equipmentGymId') int equipmentGymId,
      @Body() Reservation reservation);

  @PATCH('/reservations/{reservationId}')
  Future<HttpResponse> editReservation(@Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken, @Path() int reservationId);

  @GET('/reservations')
  Future<ReservationList> getReservationList(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Query('equipment_gym_id') int equipmentGymId);

  @DELETE('/reservations/{reservation_id}')
  Future<HttpResponse> deleteReservation(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path('reservation_id') int reservationId);

  @GET('/reservations/{reservation_id}')
  Future<SpecificReservation> getSpecificReservation(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path('reservation_id') int reservationId);

  @GET('/reservations/equipments/{equipmentId}')
  Future<SpecificEquipmentsReservation> getSpecificEquipmentsReservation(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path('reservation_id') int equipmentId);

  @PATCH('/reservations/start')
  Future<HttpResponse> startUsingEquipment(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Body() EquipmentTag equipmentTag);

  @POST('reservations/routines/{routine_id}')
  Future<HttpResponse> reserveWithRoutine(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Body() StartAt startAt);

  @PATCH('/reservations/start')
  Future<HttpResponse> endUsingEquipment(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Body() EndAt endAt);
}
