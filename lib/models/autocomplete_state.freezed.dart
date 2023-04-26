// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AutoCompleteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(AutoCompleteModel completeModel) suggestions,
    required TResult Function(Object? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(AutoCompleteModel completeModel)? suggestions,
    TResult? Function(Object? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(AutoCompleteModel completeModel)? suggestions,
    TResult Function(Object? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Suggestions value) suggestions,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Suggestions value)? suggestions,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Suggestions value)? suggestions,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteStateCopyWith<$Res> {
  factory $AutoCompleteStateCopyWith(
          AutoCompleteState value, $Res Function(AutoCompleteState) then) =
      _$AutoCompleteStateCopyWithImpl<$Res, AutoCompleteState>;
}

/// @nodoc
class _$AutoCompleteStateCopyWithImpl<$Res, $Val extends AutoCompleteState>
    implements $AutoCompleteStateCopyWith<$Res> {
  _$AutoCompleteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitCopyWith<$Res> {
  factory _$$InitCopyWith(_$Init value, $Res Function(_$Init) then) =
      __$$InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCopyWithImpl<$Res>
    extends _$AutoCompleteStateCopyWithImpl<$Res, _$Init>
    implements _$$InitCopyWith<$Res> {
  __$$InitCopyWithImpl(_$Init _value, $Res Function(_$Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Init implements Init {
  const _$Init();

  @override
  String toString() {
    return 'AutoCompleteState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(AutoCompleteModel completeModel) suggestions,
    required TResult Function(Object? error) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(AutoCompleteModel completeModel)? suggestions,
    TResult? Function(Object? error)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(AutoCompleteModel completeModel)? suggestions,
    TResult Function(Object? error)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Suggestions value) suggestions,
    required TResult Function(Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Suggestions value)? suggestions,
    TResult? Function(Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Suggestions value)? suggestions,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements AutoCompleteState {
  const factory Init() = _$Init;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$AutoCompleteStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'AutoCompleteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(AutoCompleteModel completeModel) suggestions,
    required TResult Function(Object? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(AutoCompleteModel completeModel)? suggestions,
    TResult? Function(Object? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(AutoCompleteModel completeModel)? suggestions,
    TResult Function(Object? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Suggestions value) suggestions,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Suggestions value)? suggestions,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Suggestions value)? suggestions,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AutoCompleteState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$SuggestionsCopyWith<$Res> {
  factory _$$SuggestionsCopyWith(
          _$Suggestions value, $Res Function(_$Suggestions) then) =
      __$$SuggestionsCopyWithImpl<$Res>;
  @useResult
  $Res call({AutoCompleteModel completeModel});

  $AutoCompleteModelCopyWith<$Res> get completeModel;
}

/// @nodoc
class __$$SuggestionsCopyWithImpl<$Res>
    extends _$AutoCompleteStateCopyWithImpl<$Res, _$Suggestions>
    implements _$$SuggestionsCopyWith<$Res> {
  __$$SuggestionsCopyWithImpl(
      _$Suggestions _value, $Res Function(_$Suggestions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completeModel = null,
  }) {
    return _then(_$Suggestions(
      null == completeModel
          ? _value.completeModel
          : completeModel // ignore: cast_nullable_to_non_nullable
              as AutoCompleteModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AutoCompleteModelCopyWith<$Res> get completeModel {
    return $AutoCompleteModelCopyWith<$Res>(_value.completeModel, (value) {
      return _then(_value.copyWith(completeModel: value));
    });
  }
}

/// @nodoc

class _$Suggestions implements Suggestions {
  const _$Suggestions(this.completeModel);

  @override
  final AutoCompleteModel completeModel;

  @override
  String toString() {
    return 'AutoCompleteState.suggestions(completeModel: $completeModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Suggestions &&
            (identical(other.completeModel, completeModel) ||
                other.completeModel == completeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionsCopyWith<_$Suggestions> get copyWith =>
      __$$SuggestionsCopyWithImpl<_$Suggestions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(AutoCompleteModel completeModel) suggestions,
    required TResult Function(Object? error) error,
  }) {
    return suggestions(completeModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(AutoCompleteModel completeModel)? suggestions,
    TResult? Function(Object? error)? error,
  }) {
    return suggestions?.call(completeModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(AutoCompleteModel completeModel)? suggestions,
    TResult Function(Object? error)? error,
    required TResult orElse(),
  }) {
    if (suggestions != null) {
      return suggestions(completeModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Suggestions value) suggestions,
    required TResult Function(Error value) error,
  }) {
    return suggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Suggestions value)? suggestions,
    TResult? Function(Error value)? error,
  }) {
    return suggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Suggestions value)? suggestions,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (suggestions != null) {
      return suggestions(this);
    }
    return orElse();
  }
}

abstract class Suggestions implements AutoCompleteState {
  const factory Suggestions(final AutoCompleteModel completeModel) =
      _$Suggestions;

  AutoCompleteModel get completeModel;
  @JsonKey(ignore: true)
  _$$SuggestionsCopyWith<_$Suggestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$AutoCompleteStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$Error(
      freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.error);

  @override
  final Object? error;

  @override
  String toString() {
    return 'AutoCompleteState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(AutoCompleteModel completeModel) suggestions,
    required TResult Function(Object? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(AutoCompleteModel completeModel)? suggestions,
    TResult? Function(Object? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(AutoCompleteModel completeModel)? suggestions,
    TResult Function(Object? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(Suggestions value) suggestions,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(Suggestions value)? suggestions,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(Suggestions value)? suggestions,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AutoCompleteState {
  const factory Error(final Object? error) = _$Error;

  Object? get error;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AutoCompleteModel {
  PlaceModel? get locationModel => throw _privateConstructorUsedError;
  List<AutocompletePrediction> get autoCompleteResults =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AutoCompleteModelCopyWith<AutoCompleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoCompleteModelCopyWith<$Res> {
  factory $AutoCompleteModelCopyWith(
          AutoCompleteModel value, $Res Function(AutoCompleteModel) then) =
      _$AutoCompleteModelCopyWithImpl<$Res, AutoCompleteModel>;
  @useResult
  $Res call(
      {PlaceModel? locationModel,
      List<AutocompletePrediction> autoCompleteResults});

  $PlaceModelCopyWith<$Res>? get locationModel;
}

/// @nodoc
class _$AutoCompleteModelCopyWithImpl<$Res, $Val extends AutoCompleteModel>
    implements $AutoCompleteModelCopyWith<$Res> {
  _$AutoCompleteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationModel = freezed,
    Object? autoCompleteResults = null,
  }) {
    return _then(_value.copyWith(
      locationModel: freezed == locationModel
          ? _value.locationModel
          : locationModel // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      autoCompleteResults: null == autoCompleteResults
          ? _value.autoCompleteResults
          : autoCompleteResults // ignore: cast_nullable_to_non_nullable
              as List<AutocompletePrediction>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceModelCopyWith<$Res>? get locationModel {
    if (_value.locationModel == null) {
      return null;
    }

    return $PlaceModelCopyWith<$Res>(_value.locationModel!, (value) {
      return _then(_value.copyWith(locationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AutoCompleteModelCopyWith<$Res>
    implements $AutoCompleteModelCopyWith<$Res> {
  factory _$$_AutoCompleteModelCopyWith(_$_AutoCompleteModel value,
          $Res Function(_$_AutoCompleteModel) then) =
      __$$_AutoCompleteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlaceModel? locationModel,
      List<AutocompletePrediction> autoCompleteResults});

  @override
  $PlaceModelCopyWith<$Res>? get locationModel;
}

/// @nodoc
class __$$_AutoCompleteModelCopyWithImpl<$Res>
    extends _$AutoCompleteModelCopyWithImpl<$Res, _$_AutoCompleteModel>
    implements _$$_AutoCompleteModelCopyWith<$Res> {
  __$$_AutoCompleteModelCopyWithImpl(
      _$_AutoCompleteModel _value, $Res Function(_$_AutoCompleteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationModel = freezed,
    Object? autoCompleteResults = null,
  }) {
    return _then(_$_AutoCompleteModel(
      locationModel: freezed == locationModel
          ? _value.locationModel
          : locationModel // ignore: cast_nullable_to_non_nullable
              as PlaceModel?,
      autoCompleteResults: null == autoCompleteResults
          ? _value._autoCompleteResults
          : autoCompleteResults // ignore: cast_nullable_to_non_nullable
              as List<AutocompletePrediction>,
    ));
  }
}

/// @nodoc

class _$_AutoCompleteModel implements _AutoCompleteModel {
  const _$_AutoCompleteModel(
      {this.locationModel,
      required final List<AutocompletePrediction> autoCompleteResults})
      : _autoCompleteResults = autoCompleteResults;

  @override
  final PlaceModel? locationModel;
  final List<AutocompletePrediction> _autoCompleteResults;
  @override
  List<AutocompletePrediction> get autoCompleteResults {
    if (_autoCompleteResults is EqualUnmodifiableListView)
      return _autoCompleteResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_autoCompleteResults);
  }

  @override
  String toString() {
    return 'AutoCompleteModel(locationModel: $locationModel, autoCompleteResults: $autoCompleteResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoCompleteModel &&
            (identical(other.locationModel, locationModel) ||
                other.locationModel == locationModel) &&
            const DeepCollectionEquality()
                .equals(other._autoCompleteResults, _autoCompleteResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationModel,
      const DeepCollectionEquality().hash(_autoCompleteResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoCompleteModelCopyWith<_$_AutoCompleteModel> get copyWith =>
      __$$_AutoCompleteModelCopyWithImpl<_$_AutoCompleteModel>(
          this, _$identity);
}

abstract class _AutoCompleteModel implements AutoCompleteModel {
  const factory _AutoCompleteModel(
          {final PlaceModel? locationModel,
          required final List<AutocompletePrediction> autoCompleteResults}) =
      _$_AutoCompleteModel;

  @override
  PlaceModel? get locationModel;
  @override
  List<AutocompletePrediction> get autoCompleteResults;
  @override
  @JsonKey(ignore: true)
  _$$_AutoCompleteModelCopyWith<_$_AutoCompleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  LatLng? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
          PlaceModel value, $Res Function(PlaceModel) then) =
      _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call({String id, String name, LatLng? location});
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceModelCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$_PlaceModelCopyWith(
          _$_PlaceModel value, $Res Function(_$_PlaceModel) then) =
      __$$_PlaceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, LatLng? location});
}

/// @nodoc
class __$$_PlaceModelCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$_PlaceModel>
    implements _$$_PlaceModelCopyWith<$Res> {
  __$$_PlaceModelCopyWithImpl(
      _$_PlaceModel _value, $Res Function(_$_PlaceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = freezed,
  }) {
    return _then(_$_PlaceModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@LatLngConverter()
class _$_PlaceModel implements _PlaceModel {
  const _$_PlaceModel({required this.id, required this.name, this.location});

  factory _$_PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final LatLng? location;

  @override
  String toString() {
    return 'PlaceModel(id: $id, name: $name, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceModelCopyWith<_$_PlaceModel> get copyWith =>
      __$$_PlaceModelCopyWithImpl<_$_PlaceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceModelToJson(
      this,
    );
  }
}

abstract class _PlaceModel implements PlaceModel {
  const factory _PlaceModel(
      {required final String id,
      required final String name,
      final LatLng? location}) = _$_PlaceModel;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$_PlaceModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  LatLng? get location;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceModelCopyWith<_$_PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
