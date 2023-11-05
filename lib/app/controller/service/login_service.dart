import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/user/access_token.dart';
import 'package:new_fit/app/data/model/json_models/user/user_email_model.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST('/users')
  Future<AccessToken> loginAndGetAccessToken(@Body() User user);

  @DELETE('/users')
  Future<HttpResponse> deleteUser(@Body() UserEmail userEmail);

  @DELETE('/logout')
  Future<HttpResponse> logout();
}
