// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentList _$EquipmentListFromJson(Map<String, dynamic> json) =>
    EquipmentList(
      gym_name: json['gym_name'] as String,
      equipments_count: json['equipments_count'] as int,
      equipments: (json['equipments'] as List<dynamic>)
          .map((e) => Equipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EquipmentListToJson(EquipmentList instance) =>
    <String, dynamic>{
      'gym_name': instance.gym_name,
      'equipments_count': instance.equipments_count,
      'equipments': instance.equipments,
    };
