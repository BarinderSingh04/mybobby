// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserDetail',
      json,
      ($checkedConvert) {
        final val = UserDetail(
          id: $checkedConvert('id', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          image: $checkedConvert(
              'image', (v) => UserDetail._pickupImage(v as String?)),
          type: $checkedConvert(
              'type', (v) => $enumDecodeNullable(_$UserTypeEnumMap, v)),
          currentAddress:
              $checkedConvert('current_address', (v) => v as String),
          currentLat: $checkedConvert('current_lat', (v) => v as String),
          currentLong: $checkedConvert('current_long', (v) => v as String),
          currentPlaceId:
              $checkedConvert('current_place_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'currentAddress': 'current_address',
        'currentLat': 'current_lat',
        'currentLong': 'current_long',
        'currentPlaceId': 'current_place_id'
      },
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'image': instance.image,
      'phone': instance.phone,
      'type': _$UserTypeEnumMap[instance.type],
      'current_place_id': instance.currentPlaceId,
      'current_address': instance.currentAddress,
      'current_lat': instance.currentLat,
      'current_long': instance.currentLong,
    };

const _$UserTypeEnumMap = {
  UserType.admin: '1',
  UserType.customer: '2',
  UserType.driver: '3',
};
