// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUser _$GetUserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'GetUser',
      json,
      ($checkedConvert) {
        final val = GetUser(
          id: $checkedConvert('id', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          image: $checkedConvert(
              'image', (v) => GetUser._pickupImage(v as String?)),
        );
        return val;
      },
      fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
    );

Map<String, dynamic> _$GetUserToJson(GetUser instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'image': instance.image,
      'phone': instance.phone,
    };
