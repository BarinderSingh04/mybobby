// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      userNumber: json['user_number'] as String?,
      otpNumber: json['otp_number'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_number': instance.userNumber,
      'otp_number': instance.otpNumber,
      'created_at': instance.createdAt,
    };
