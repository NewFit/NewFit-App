import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1")
abstract class ReservationService {
  factory ReservationService(Dio dio, {String baseUrl}) = _ReservationService;

  @POST('/reservations/{equipmentGymId}')
  Future<HttpResponse> reserveEquipment(@Path() int equipmentGymId);

  @PATCH('/reservations/{reservationId}')
  Future<HttpResponse> editReservation(@Path() int reservationId);

  @GET('/reservations')
  Future<ReservationList> getReservationList(
      @Query('equipment_gym_id') int equipmentGymId);

  @DELETE('/reservations/{reservation_id}')
  Future<HttpResponse> deleteReservation(@Path() int reservationId);

  @GET('/reservations/{reservation_id}')
  Future<SpecificReservation> getSpecificReservation(@Path() int reservationId);
}
