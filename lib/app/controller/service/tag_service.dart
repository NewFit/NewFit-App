import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/tag/equipment_tag_model.dart';
import 'package:retrofit/retrofit.dart';

part 'tag_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class TagService {
  factory TagService(Dio dio, {String baseUrl}) = _TagService;

  @PATCH('/reservations/start')
  Future<HttpResponse> startUsingEquipment(@Body() EquipmentTag equipmentTag);
}
