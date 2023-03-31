
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mybobby/models/getUser.dart';
part 'user.g.dart';


final userProvider = StateProvider<GetUser?>((ref) => null);

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  String? id;
  String? userNumber;
  String? otpNumber;
  String createdAt;

  User({
    required this.id,
    required this.userNumber,
    required this.otpNumber,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
