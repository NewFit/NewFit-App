import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/user/access_token.dart';
import 'package:new_fit/app/data/model/json_models/user/modify_user_model.dart';
import 'package:new_fit/app/data/model/json_models/user/user_email_model.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('/users')
  Future<AccessToken> loginAndGetAccessToken(@Body() User user);

  @DELETE('/users')
  Future<HttpResponse> deleteUser(@Body() UserEmail userEmail);

  @DELETE('/logout')
  Future<HttpResponse> logout();

  @PATCH('/users')
  Future<HttpResponse> modifyUserInfo(@Body() ModifyUser modifyUser);
}
