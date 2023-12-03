// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAuthorityGym _$RegisterAuthorityGymFromJson(
        Map<String, dynamic> json) =>
    RegisterAuthorityGym(
      gym_id: json['gym_id'] as int,
    );

Map<String, dynamic> _$RegisterAuthorityGymToJson(
        RegisterAuthorityGym instance) =>
    <String, dynamic>{
      'gym_id': instance.gym_id,
    };

AuthorityGym _$AuthorityGymFromJson(Map<String, dynamic> json) => AuthorityGym(
      authority_id: json['authority_id'] as int,
      gym_name: json['gym_name'] as String,
    );

Map<String, dynamic> _$AuthorityGymToJson(AuthorityGym instance) =>
    <String, dynamic>{
      'authority_id': instance.authority_id,
      'gym_name': instance.gym_name,
    };

AddressGym _$AddressGymFromJson(Map<String, dynamic> json) => AddressGym(
      gym_id: json['gym_id'] as int,
      gym_name: json['gym_name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$AddressGymToJson(AddressGym instance) =>
    <String, dynamic>{
      'gym_id': instance.gym_id,
      'gym_name': instance.gym_name,
      'address': instance.address,
    };

AddressGymList _$AddressGymListFromJson(Map<String, dynamic> json) =>
    AddressGymList(
      gym_count: json['gym_count'] as int,
      gyms: (json['gyms'] as List<dynamic>)
          .map((e) => AddressGym.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressGymListToJson(AddressGymList instance) =>
    <String, dynamic>{
      'gym_count': instance.gym_count,
      'gyms': instance.gyms,
    };

GymId _$GymIdFromJson(Map<String, dynamic> json) => GymId(
      gym_id: json['gym_id'] as int,
    );

Map<String, dynamic> _$GymIdToJson(GymId instance) => <String, dynamic>{
      'gym_id': instance.gym_id,
    };
