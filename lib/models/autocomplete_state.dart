import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    hide LatLng;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ride.dart';
part "autocomplete_state.freezed.dart";
part "autocomplete_state.g.dart";

@freezed
class AutoCompleteState with _$AutoCompleteState {
  const factory AutoCompleteState.init() = Init;
  const factory AutoCompleteState.loading() = Loading;
  const factory AutoCompleteState.suggestions(AutoCompleteModel completeModel) =
      Suggestions;
  const factory AutoCompleteState.error(Object? error) = Error;
}

@freezed
class AutoCompleteModel with _$AutoCompleteModel {
  const factory AutoCompleteModel({
    PlaceModel? locationModel,
    required List<AutocompletePrediction> autoCompleteResults,
  }) = _AutoCompleteModel;
}

@freezed
class PlaceModel with _$PlaceModel {
  @LatLngConverter()
  const factory PlaceModel({
    required String id,
    required String name,
    LatLng? location,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  factory PlaceModel.start(RideDTO ride) {
    return PlaceModel(
      id: ride.startPlaceId,
      name: ride.startAddress,
      location: LatLng(
        double.tryParse(ride.startLat) ?? 0.0,
        double.tryParse(ride.startLong) ?? 0.0,
      ),
    );
  }

  factory PlaceModel.end(RideDTO ride) {
    return PlaceModel(
      id: ride.endPlaceId,
      name: ride.endAddress,
      location: LatLng(
        double.tryParse(ride.endLat) ?? 0.0,
        double.tryParse(ride.endLong) ?? 0.0,
      ),
    );
  }
}

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) =>
      LatLng(json["lat"], json["lng"]);

  @override
  Map<String, dynamic> toJson(LatLng object) =>
      {"lat": object.latitude, "lng": object.longitude};
}
