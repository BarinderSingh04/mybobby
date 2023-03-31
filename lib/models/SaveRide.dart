
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
part   'SaveRide.g.dart';



final saveRideProvide = StateProvider<SaveRide?>((ref) => null);

@JsonSerializable(fieldRename: FieldRename.snake,checked: true)
class SaveRide{
  String? helperId;
  String? isActive;
  String? id;
  String? customerId;
  String?  createdAt;
  String?  updatedAt;
  double ?lat;
  double ?lng;

  SaveRide({
    required this.id,
    required this.helperId,
    required this.isActive,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
    required this.lng,
    required this.lat,

});
  factory SaveRide.fromJson(Map<String, dynamic> json) =>
      _$SaveRideFromJson(json);

  Map<String, dynamic> toJson() => _$SaveRideToJson(this);

}