// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String?,
      id_informations: (json['id_informations'] as List<dynamic>)
          .map((e) => IdInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'id_informations': instance.id_informations,
    };

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      access_token: json['access_token'] as String,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
    };

IdInformation _$IdInformationFromJson(Map<String, dynamic> json) =>
    IdInformation(
      id: json['id'] as int,
      id_type: json['id_type'] as String,
    );

Map<String, dynamic> _$IdInformationToJson(IdInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_type': instance.id_type,
    };
