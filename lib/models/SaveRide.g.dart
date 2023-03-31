// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaveRide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveRide _$SaveRideFromJson(Map<String, dynamic> json) => $checkedCreate(
      'SaveRide',
      json,
      ($checkedConvert) {
        final val = SaveRide(
          id: $checkedConvert('id', (v) => v as String?),
          helperId: $checkedConvert('helper_id', (v) => v as String?),
          isActive: $checkedConvert('is_active', (v) => v as String?),
          customerId: $checkedConvert('customer_id', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
          lng: $checkedConvert('lng', (v) => (v as num?)?.toDouble()),
          lat: $checkedConvert('lat', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'helperId': 'helper_id',
        'isActive': 'is_active',
        'customerId': 'customer_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$SaveRideToJson(SaveRide instance) => <String, dynamic>{
      'helper_id': instance.helperId,
      'is_active': instance.isActive,
      'id': instance.id,
      'customer_id': instance.customerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'lat': instance.lat,
      'lng': instance.lng,
    };
