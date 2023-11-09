// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_models.dart';
import 'package:retrofit/retrofit.dart';

part 'routine_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class RoutineService {
  factory RoutineService(Dio dio, {String baseUrl}) = _RoutineService;

  @GET('/routines')
  Future<MyRoutineList> getMyRoutineList();

  @POST('/routines')
  Future<HttpResponse> addRoutine(@Body() PostRoutine postRoutine);

  @PATCH('/routines/{routine_id}')
  Future<HttpResponse> editRoutine(
      @Path() int routine_id, @Body() PatchRoutine patchRoutine);

  @DELETE('/routines')
  Future<HttpResponse> deleteRoutine(@Body() RoutineId routineId);

  @GET('/routines/{routine_id}')
  Future<RoutineDetail> getMyRoutineDetails(@Path() int routine_id);

  @POST('/routines/{routine_id}')
  Future<HttpResponse> reserveWithRoutine(@Body() StartAt startAt);
}
