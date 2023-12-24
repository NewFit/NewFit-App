import 'package:dio/dio.dart' hide Headers;
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
  Future<AccessToken> signUp(@Header('Authorization') String accessToken,
      @Header('oauth-history-id') int historyId, @Body() User user);

  @DELETE('/api/v1/users')
  Future<HttpResponse> deleteUser(@Header('user-id') int userId,
      @Header('Authorization') String accessToken, @Body() UserEmail userEmail);

  @POST('/api/v1/logout')
  Future<HttpResponse> logout();

  @PATCH('/api/v1/users')
  Future<HttpResponse> modifyUserInfo(
      @Header('Authorization') String accessToken,
      @Header('user-id') int userId,
      @Body() ModifyUser modifyUser);

  @GET('/api/v1/users')
  Future<MyPageInfo> getMyPageInfoForNotRegistered(
    @Header('Authorization') String accessToken,
    @Header('user-id') int userId,
  );

  @GET('/api/v1/users')
  Future<MyPageInfo> getMyPageInfo(
    @Header('Authorization') String accessToken,
    @Header('authority-id') int userId,
  );

  @POST('/login')
  Future<Token> login(@Body() Attribute attribute);

  @GET('/refresh')
  Future<HttpResponse> renewAccessToken(
    @Header('refresh-token') String refreshToken,
  );
}
