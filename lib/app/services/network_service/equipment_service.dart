import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:retrofit/retrofit.dart';

part 'equipment_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/api/v1/")
abstract class EquipmentService {
  factory EquipmentService(Dio dio, {String baseUrl}) = _EquipmentService;

  @GET('/equipments')
  Future<EquipmentList> getAllEquipmentsInGym(
    @Header('authority-id') int authorityId,
    @Header('Authorization') String accessToken,
  );

  @GET('/equipments')
  Future<EquipmentList> getAllEquipmentsByPurpose(
      @Header('Authorization') String accessToken,
      @Query('purpose') String purpose);

  @GET('/equipments')
  Future<EquipmentList> getIdenticalEquipments(
      @Header('Authorization') String accessToken,
      @Query('equipment_id') int equipmentId);

  @GET('/equipments/{equipment_gym_id}')
  Future<EquipmentSpec> getEquipmentSpecification(
      @Header('Authorization') String accessToken, @Path() int equipmentGymId);
}
