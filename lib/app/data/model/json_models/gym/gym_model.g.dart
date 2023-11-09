// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      gym_name: json['gym_name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$AddressGymToJson(AddressGym instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'address': instance.address,
    };

AddressGymList _$AddressGymListFromJson(Map<String, dynamic> json) =>
    AddressGymList(
      gym_count: json['gym_count'] as String,
      gyms: AddressGym.fromJson(json['gyms'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressGymListToJson(AddressGymList instance) =>
    <String, dynamic>{
      'gym_count': instance.gym_count,
      'gyms': instance.gyms,
    };
