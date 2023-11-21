import 'package:dio/dio.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
import 'package:new_fit/app/data/model/json_models/user/attribute_model.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service.g.dart';

@RestApi(
    baseUrl:
        "http://ec2-13-209-25-150.ap-northeast-2.compute.amazonaws.com:8080/")
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('/api/v1/users')
  Future<AccessToken> signUp(@Body() User user);

  @DELETE('/users')
  Future<HttpResponse> deleteUser(@Body() UserEmail userEmail);

  @POST('/logout')
  Future<HttpResponse> logout();

  @PATCH('/users')
  Future<HttpResponse> modifyUserInfo(@Body() ModifyUser modifyUser);

  @GET('/users')
  Future<MyPage> getMyPageInfo();

  @POST('/login')
  Future<Token> login(@Body() Attribute attribute);
}
