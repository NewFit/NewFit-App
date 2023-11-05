// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_gym_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGymList _$UserGymListFromJson(Map<String, dynamic> json) => UserGymList(
      gym_count: json['gym_count'] as int,
      gyms: (json['gyms'] as List<dynamic>)
          .map((e) => Gym.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserGymListToJson(UserGymList instance) =>
    <String, dynamic>{
      'gym_count': instance.gym_count,
      'gyms': instance.gyms,
    };
