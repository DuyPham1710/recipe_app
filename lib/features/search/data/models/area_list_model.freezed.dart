// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AreaListModel _$AreaListModelFromJson(Map<String, dynamic> json) {
  return _AreaListModel.fromJson(json);
}

/// @nodoc
mixin _$AreaListModel {
  String get strArea => throw _privateConstructorUsedError;

  /// Serializes this AreaListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AreaListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaListModelCopyWith<AreaListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaListModelCopyWith<$Res> {
  factory $AreaListModelCopyWith(
    AreaListModel value,
    $Res Function(AreaListModel) then,
  ) = _$AreaListModelCopyWithImpl<$Res, AreaListModel>;
  @useResult
  $Res call({String strArea});
}

/// @nodoc
class _$AreaListModelCopyWithImpl<$Res, $Val extends AreaListModel>
    implements $AreaListModelCopyWith<$Res> {
  _$AreaListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreaListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? strArea = null}) {
    return _then(
      _value.copyWith(
            strArea: null == strArea
                ? _value.strArea
                : strArea // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AreaListModelImplCopyWith<$Res>
    implements $AreaListModelCopyWith<$Res> {
  factory _$$AreaListModelImplCopyWith(
    _$AreaListModelImpl value,
    $Res Function(_$AreaListModelImpl) then,
  ) = __$$AreaListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String strArea});
}

/// @nodoc
class __$$AreaListModelImplCopyWithImpl<$Res>
    extends _$AreaListModelCopyWithImpl<$Res, _$AreaListModelImpl>
    implements _$$AreaListModelImplCopyWith<$Res> {
  __$$AreaListModelImplCopyWithImpl(
    _$AreaListModelImpl _value,
    $Res Function(_$AreaListModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AreaListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? strArea = null}) {
    return _then(
      _$AreaListModelImpl(
        strArea: null == strArea
            ? _value.strArea
            : strArea // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaListModelImpl implements _AreaListModel {
  const _$AreaListModelImpl({required this.strArea});

  factory _$AreaListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaListModelImplFromJson(json);

  @override
  final String strArea;

  @override
  String toString() {
    return 'AreaListModel(strArea: $strArea)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaListModelImpl &&
            (identical(other.strArea, strArea) || other.strArea == strArea));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strArea);

  /// Create a copy of AreaListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaListModelImplCopyWith<_$AreaListModelImpl> get copyWith =>
      __$$AreaListModelImplCopyWithImpl<_$AreaListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaListModelImplToJson(this);
  }
}

abstract class _AreaListModel implements AreaListModel {
  const factory _AreaListModel({required final String strArea}) =
      _$AreaListModelImpl;

  factory _AreaListModel.fromJson(Map<String, dynamic> json) =
      _$AreaListModelImpl.fromJson;

  @override
  String get strArea;

  /// Create a copy of AreaListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaListModelImplCopyWith<_$AreaListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AreaListResponse _$AreaListResponseFromJson(Map<String, dynamic> json) {
  return _AreaListResponse.fromJson(json);
}

/// @nodoc
mixin _$AreaListResponse {
  List<AreaListModel>? get meals => throw _privateConstructorUsedError;

  /// Serializes this AreaListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AreaListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaListResponseCopyWith<AreaListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaListResponseCopyWith<$Res> {
  factory $AreaListResponseCopyWith(
    AreaListResponse value,
    $Res Function(AreaListResponse) then,
  ) = _$AreaListResponseCopyWithImpl<$Res, AreaListResponse>;
  @useResult
  $Res call({List<AreaListModel>? meals});
}

/// @nodoc
class _$AreaListResponseCopyWithImpl<$Res, $Val extends AreaListResponse>
    implements $AreaListResponseCopyWith<$Res> {
  _$AreaListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreaListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _value.copyWith(
            meals: freezed == meals
                ? _value.meals
                : meals // ignore: cast_nullable_to_non_nullable
                      as List<AreaListModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AreaListResponseImplCopyWith<$Res>
    implements $AreaListResponseCopyWith<$Res> {
  factory _$$AreaListResponseImplCopyWith(
    _$AreaListResponseImpl value,
    $Res Function(_$AreaListResponseImpl) then,
  ) = __$$AreaListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AreaListModel>? meals});
}

/// @nodoc
class __$$AreaListResponseImplCopyWithImpl<$Res>
    extends _$AreaListResponseCopyWithImpl<$Res, _$AreaListResponseImpl>
    implements _$$AreaListResponseImplCopyWith<$Res> {
  __$$AreaListResponseImplCopyWithImpl(
    _$AreaListResponseImpl _value,
    $Res Function(_$AreaListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AreaListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _$AreaListResponseImpl(
        meals: freezed == meals
            ? _value._meals
            : meals // ignore: cast_nullable_to_non_nullable
                  as List<AreaListModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaListResponseImpl implements _AreaListResponse {
  const _$AreaListResponseImpl({final List<AreaListModel>? meals})
    : _meals = meals;

  factory _$AreaListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaListResponseImplFromJson(json);

  final List<AreaListModel>? _meals;
  @override
  List<AreaListModel>? get meals {
    final value = _meals;
    if (value == null) return null;
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AreaListResponse(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaListResponseImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of AreaListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaListResponseImplCopyWith<_$AreaListResponseImpl> get copyWith =>
      __$$AreaListResponseImplCopyWithImpl<_$AreaListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaListResponseImplToJson(this);
  }
}

abstract class _AreaListResponse implements AreaListResponse {
  const factory _AreaListResponse({final List<AreaListModel>? meals}) =
      _$AreaListResponseImpl;

  factory _AreaListResponse.fromJson(Map<String, dynamic> json) =
      _$AreaListResponseImpl.fromJson;

  @override
  List<AreaListModel>? get meals;

  /// Create a copy of AreaListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaListResponseImplCopyWith<_$AreaListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
