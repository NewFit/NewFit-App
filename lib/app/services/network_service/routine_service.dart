// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_models.dart';
import 'package:retrofit/retrofit.dart';

part 'routine_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1")
abstract class RoutineService {
  factory RoutineService(Dio dio, {String baseUrl}) = _RoutineService;

  @GET('/routines')
  Future<MyRoutineList> getMyRoutineList(
    @Header('authority-id') int authorityId,
    @Header('Authorization') String accessToken,
  );

  @POST('/routines')
  Future<HttpResponse> addRoutine(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Body() PostRoutine postRoutine);

  @PATCH('/routines/{routine_id}')
  Future<HttpResponse> editRoutine(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path() int routine_id,
      @Body() PatchRoutine patchRoutine);

  @DELETE('/routines')
  Future<HttpResponse> deleteRoutine(@Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken, @Body() RoutineId routineId);

  @GET('/routines/{routine_id}')
  Future<RoutineDetail> getMyRoutineDetails(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path() int routine_id);
}
