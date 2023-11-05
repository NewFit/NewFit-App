import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'reservation_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class ReservationService {
  factory ReservationService(Dio dio, {String baseUrl}) = _ReservationService;

  @POST('/reservations/{equipmentGymId}')
  Future<HttpResponse> reserveEquipment(@Path() int equipmentGymId);

  @PATCH('/reservations/{reservationId}')
  Future<HttpResponse> editReservation(@Path() int reservationId);

  @GET('/reservations?equipment_gym_id=1')
  Future<ReservationList> getReservationList(
      @Query('equipment_gym_id') int equipment_gym_id);

  @DELETE('reservations/{reservation_id}')
  Future<HttpResponse> deleteReservation();
}
