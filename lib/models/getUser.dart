
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
part 'getUser.g.dart';

final getUserProvider = StateProvider<GetUser?>((ref) => null);

@JsonSerializable(fieldRename: FieldRename.snake,checked: true)
class GetUser {
  String? id;
  String? firstName;
  String? lastName;
  @JsonKey(fromJson: _pickupImage)
  String? image;
  String? phone;

  GetUser({
    required this.id,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.image

  });
  factory GetUser.fromJson(Map<String, dynamic> json) =>
      _$GetUserFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserToJson(this);

  static String? _pickupImage(String? image) {
    if (image != null && image.contains('http://mybobby.acumobi.com/assets/images/')) {
      return image;
    }
    return image!=null && image.isNotEmpty
        ? "http://mybobby.acumobi.com/assets/images/$image"
        : null;
  }


}
