import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:retrofit/retrofit.dart';

part 'equipment_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class EquipmentService {
  factory EquipmentService(Dio dio, {String baseUrl}) = _EquipmentService;

  @GET('/api/v1/equipments')
  Future<EquipmentList> getAllEquipmentsInGym(
    @Header('Authorization') String accessToken,
    @Header('authority-id') int authorityId,
  );

  @GET('/equipments')
  Future<EquipmentList> getAllEquipmentsByPurpose(
      @Header('Authorization') String accessToken,
      @Query('purpose') String purpose);

  @GET('/equipments')
  Future<EquipmentList> getIdenticalEquipments(
      @Header('Authorization') String accessToken,
      @Query('equipment_id') int equipment_id);

  @GET('/equipments/{equipment_gym_id}')
  Future<EquipmentSpec> getEquipmentSpecification(
      @Header('Authorization') String accessToken,
      @Path() int equipment_gym_id);
}
