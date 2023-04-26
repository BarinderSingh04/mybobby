import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mybobby/models/autocomplete_state.dart';

part "location_data.freezed.dart";

@freezed
class LocationData with _$LocationData {
  factory LocationData({
    PlaceModel? startPlaceModel,
    PlaceModel? endPlaceModel,
    LatLngBounds? latLngBounds,
    @Default([]) List<Marker> markers,
    @Default([]) List<Polyline> polylines,
    @Default(LatLng(0.0, 0.0)) LatLng currentLocation,
    String? totalDistance,
  }) = _LocationData;
}