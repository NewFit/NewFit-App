// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_gym_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
