// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaceModel _$$_PlaceModelFromJson(Map<String, dynamic> json) =>
    _$_PlaceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      location: _$JsonConverterFromJson<Map<String, dynamic>, LatLng>(
          json['location'], const LatLngConverter().fromJson),
    );

Map<String, dynamic> _$$_PlaceModelToJson(_$_PlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': _$JsonConverterToJson<Map<String, dynamic>, LatLng>(
          instance.location, const LatLngConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
