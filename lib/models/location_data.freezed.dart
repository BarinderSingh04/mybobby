// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationData {
  PlaceModel? get startPlaceModel => throw _privateConstructorUsedError;
  PlaceModel? get endPlaceModel => throw _privateConstructorUsedError;
  LatLngBounds? get latLngBounds => throw _privateConstructorUsedError;
  List<Marker> get markers => throw _privateConstructorUsedError;
  List<Polyline> get polylines => throw _privateConstructorUsedError;
  LatLng get currentLocation => throw _privateConstructorUsedError;
  String? get totalDistance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call(
      {PlaceModel? startPlaceModel,
      PlaceModel? endPlaceModel,
      LatLngBounds? latLngBounds,
      List<Marker> markers,
      List<Polyline> polylines,
      LatLng currentLocation,
      String? totalDistance});

  $PlaceModelCopyWith<$Res>? get startPlaceModel;
  $PlaceModelCopyWith<$Res>? get endPlaceModel;
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startPlaceModel = freezed,
    Object? endPlaceModel = freezed,
    Object? latLngBounds = freezed,
    Object? markers = null,
    Object? polylines = null,
    Object? currentLocation = null,
    Object? totalDistance = freezed,
  }) {
    return _then(_value.copyWith(
      startPlaceModel: freezed == startPlaceModel
          ? _value.startPlaceModel
          : startPlaceModel // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      endPlaceModel: freezed == endPlaceModel
          ? _value.endPlaceModel
          : endPlaceModel // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      latLngBounds: freezed == latLngBounds
          ? _value.latLngBounds
          : latLngBounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      polylines: null == polylines
          ? _value.polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as List<Polyline>,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceModelCopyWith<$Res>? get startPlaceModel {
    if (_value.startPlaceModel == null) {
      return null;
    }

    return $PlaceModelCopyWith<$Res>(_value.startPlaceModel!, (value) {
      return _then(_value.copyWith(startPlaceModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceModelCopyWith<$Res>? get endPlaceModel {
    if (_value.endPlaceModel == null) {
      return null;
    }

    return $PlaceModelCopyWith<$Res>(_value.endPlaceModel!, (value) {
      return _then(_value.copyWith(endPlaceModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LocationDataCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$_LocationDataCopyWith(
          _$_LocationData value, $Res Function(_$_LocationData) then) =
      __$$_LocationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlaceModel? startPlaceModel,
      PlaceModel? endPlaceModel,
      LatLngBounds? latLngBounds,
      List<Marker> markers,
      List<Polyline> polylines,
      LatLng currentLocation,
      String? totalDistance});

  @override
  $PlaceModelCopyWith<$Res>? get startPlaceModel;
  @override
  $PlaceModelCopyWith<$Res>? get endPlaceModel;
}

/// @nodoc
class __$$_LocationDataCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$_LocationData>
    implements _$$_LocationDataCopyWith<$Res> {
  __$$_LocationDataCopyWithImpl(
      _$_LocationData _value, $Res Function(_$_LocationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startPlaceModel = freezed,
    Object? endPlaceModel = freezed,
    Object? latLngBounds = freezed,
    Object? markers = null,
    Object? polylines = null,
    Object? currentLocation = null,
    Object? totalDistance = freezed,
  }) {
    return _then(_$_LocationData(
      startPlaceModel: freezed == startPlaceModel
          ? _value.startPlaceModel
          : startPlaceModel // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      endPlaceModel: freezed == endPlaceModel
          ? _value.endPlaceModel
          : endPlaceModel // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      latLngBounds: freezed == latLngBounds
          ? _value.latLngBounds
          : latLngBounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      polylines: null == polylines
          ? _value._polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as List<Polyline>,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      totalDistance: freezed == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LocationData implements _LocationData {
  _$_LocationData(
      {this.startPlaceModel,
      this.endPlaceModel,
      this.latLngBounds,
      final List<Marker> markers = const [],
      final List<Polyline> polylines = const [],
      this.currentLocation = const LatLng(0.0, 0.0),
      this.totalDistance})
      : _markers = markers,
        _polylines = polylines;

  @override
  final PlaceModel? startPlaceModel;
  @override
  final PlaceModel? endPlaceModel;
  @override
  final LatLngBounds? latLngBounds;
  final List<Marker> _markers;
  @override
  @JsonKey()
  List<Marker> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  final List<Polyline> _polylines;
  @override
  @JsonKey()
  List<Polyline> get polylines {
    if (_polylines is EqualUnmodifiableListView) return _polylines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylines);
  }

  @override
  @JsonKey()
  final LatLng currentLocation;
  @override
  final String? totalDistance;

  @override
  String toString() {
    return 'LocationData(startPlaceModel: $startPlaceModel, endPlaceModel: $endPlaceModel, latLngBounds: $latLngBounds, markers: $markers, polylines: $polylines, currentLocation: $currentLocation, totalDistance: $totalDistance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationData &&
            (identical(other.startPlaceModel, startPlaceModel) ||
                other.startPlaceModel == startPlaceModel) &&
            (identical(other.endPlaceModel, endPlaceModel) ||
                other.endPlaceModel == endPlaceModel) &&
            (identical(other.latLngBounds, latLngBounds) ||
                other.latLngBounds == latLngBounds) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polylines, _polylines) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startPlaceModel,
      endPlaceModel,
      latLngBounds,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polylines),
      currentLocation,
      totalDistance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationDataCopyWith<_$_LocationData> get copyWith =>
      __$$_LocationDataCopyWithImpl<_$_LocationData>(this, _$identity);
}

abstract class _LocationData implements LocationData {
  factory _LocationData(
      {final PlaceModel? startPlaceModel,
      final PlaceModel? endPlaceModel,
      final LatLngBounds? latLngBounds,
      final List<Marker> markers,
      final List<Polyline> polylines,
      final LatLng currentLocation,
      final String? totalDistance}) = _$_LocationData;

  @override
  PlaceModel? get startPlaceModel;
  @override
  PlaceModel? get endPlaceModel;
  @override
  LatLngBounds? get latLngBounds;
  @override
  List<Marker> get markers;
  @override
  List<Polyline> get polylines;
  @override
  LatLng get currentLocation;
  @override
  String? get totalDistance;
  @override
  @JsonKey(ignore: true)
  _$$_LocationDataCopyWith<_$_LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}
