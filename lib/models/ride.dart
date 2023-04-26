import 'package:freezed_annotation/freezed_annotation.dart';

import 'autocomplete_state.dart';
import 'user_detail.dart';
part "ride.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class RideDTO {
  final String id;
  final String? helperId;
  final String customerId;
  final String startAddress;
  final String startPlaceId;
  final String startLat;
  final String startLong;
  final String endAddress;
  final String endPlaceId;
  final String endLat;
  final String endLong;
  final DateTime updatedAt;
  final DateTime createdAt;
  final RideStatus status;

  RideDTO(
    this.id,
    this.helperId,
    this.customerId,
    this.status,
    this.updatedAt,
    this.startAddress,
    this.startPlaceId,
    this.startLat,
    this.startLong,
    this.endAddress,
    this.endPlaceId,
    this.endLat,
    this.endLong,
    this.createdAt,
  );

  factory RideDTO.fromJson(Map<String, dynamic> json) =>
      _$RideDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RideDTOToJson(this);

  Ride toRide(UserDetail? customer, UserDetail? helper) {
    return Ride(
      id,
      customer,
      helper,
      PlaceModel.start(this),
      PlaceModel.end(this),
      updatedAt,
      createdAt,
      status,
    );
  }
}

enum RideStatus {
  @JsonValue("1")
  created,
  @JsonValue("2")
  accepted,
  @JsonValue("3")
  completed,
}

@JsonSerializable()
class Ride {
  final String id;
  final UserDetail? customer;
  final UserDetail? helperId;
  final PlaceModel startPlace;
  final PlaceModel endPlace;
  final DateTime updatedAt;
  final DateTime createdAt;
  final RideStatus status;

  Ride(
    this.id,
    this.customer,
    this.helperId,
    this.startPlace,
    this.endPlace,
    this.updatedAt,
    this.createdAt,
    this.status,
  );

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);
  Map<String, dynamic> toJson() => _$RideToJson(this);
}
