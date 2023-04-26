// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideDTO _$RideDTOFromJson(Map<String, dynamic> json) => RideDTO(
      json['id'] as String,
      json['helper_id'] as String?,
      json['customer_id'] as String,
      $enumDecode(_$RideStatusEnumMap, json['status']),
      DateTime.parse(json['updated_at'] as String),
      json['start_address'] as String,
      json['start_place_id'] as String,
      json['start_lat'] as String,
      json['start_long'] as String,
      json['end_address'] as String,
      json['end_place_id'] as String,
      json['end_lat'] as String,
      json['end_long'] as String,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$RideDTOToJson(RideDTO instance) => <String, dynamic>{
      'id': instance.id,
      'helper_id': instance.helperId,
      'customer_id': instance.customerId,
      'start_address': instance.startAddress,
      'start_place_id': instance.startPlaceId,
      'start_lat': instance.startLat,
      'start_long': instance.startLong,
      'end_address': instance.endAddress,
      'end_place_id': instance.endPlaceId,
      'end_lat': instance.endLat,
      'end_long': instance.endLong,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'status': _$RideStatusEnumMap[instance.status]!,
    };

const _$RideStatusEnumMap = {
  RideStatus.created: '1',
  RideStatus.accepted: '2',
  RideStatus.completed: '3',
};

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      json['id'] as String,
      json['customer'] == null
          ? null
          : UserDetail.fromJson(json['customer'] as Map<String, dynamic>),
      json['helperId'] == null
          ? null
          : UserDetail.fromJson(json['helperId'] as Map<String, dynamic>),
      PlaceModel.fromJson(json['startPlace'] as Map<String, dynamic>),
      PlaceModel.fromJson(json['endPlace'] as Map<String, dynamic>),
      DateTime.parse(json['updatedAt'] as String),
      DateTime.parse(json['createdAt'] as String),
      $enumDecode(_$RideStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'helperId': instance.helperId,
      'startPlace': instance.startPlace,
      'endPlace': instance.endPlace,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$RideStatusEnumMap[instance.status]!,
    };
