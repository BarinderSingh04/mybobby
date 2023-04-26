import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part "user_detail.g.dart";

final userProvider = StateProvider<UserDetail?>((ref) => null);

@JsonSerializable(fieldRename: FieldRename.snake, checked: true)
class UserDetail {
  String? id;
  String? firstName;
  String? lastName;
  @JsonKey(fromJson: _pickupImage)
  String? image;
  String? phone;
  UserType? type;
  String currentPlaceId;
  String currentAddress;
  String currentLat;
  String currentLong;

  UserDetail({
    required this.id,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.type,
    required this.currentAddress,
    required this.currentLat,
    required this.currentLong,
    required this.currentPlaceId,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  static String? _pickupImage(String? image) {
    if (image != null &&
        image.contains('http://mybobby.acumobi.com/assets/images/')) {
      return image;
    }
    return image != null && image.isNotEmpty
        ? "http://mybobby.acumobi.com/assets/images/$image"
        : null;
  }
}

enum UserType {
  @JsonValue("1")
  admin,
  @JsonValue("2")
  customer,
  @JsonValue("3")
  driver,
}

