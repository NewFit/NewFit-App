// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_models.dart';
import 'package:retrofit/retrofit.dart';

part 'routine_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1/routines")
abstract class RoutineService {
  factory RoutineService(Dio dio, {String baseUrl}) = _RoutineService;

  @GET('')
  Future<MyRoutineList> getMyRoutineList(
    @Header('authority-id') int authorityId,
    @Header('Authorization') String accessToken,
  );

  @POST('')
  Future<HttpResponse> addRoutine(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Body() PostRoutine postRoutine);

  @PATCH('/{routine_id}')
  Future<HttpResponse> editRoutineName(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path('routine_id') int routineId,
      @Body() RoutineName routineName);

  @PATCH('/equipments')
  Future<HttpResponse> editRoutineEquipments(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Query('routine-id') int routineId,
      @Body() PatchRoutineEquipments patchRoutine);

  @DELETE('')
  Future<HttpResponse> deleteRoutine(@Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken, @Body() RoutineId routineId);

  @GET('/{routine_id}')
  Future<RoutineDetail> getMyRoutineDetails(
      @Header('authority-id') int authorityId,
      @Header('Authorization') String accessToken,
      @Path() int routine_id);
}
