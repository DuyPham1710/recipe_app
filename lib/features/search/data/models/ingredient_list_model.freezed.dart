// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IngredientListModel _$IngredientListModelFromJson(Map<String, dynamic> json) {
  return _IngredientListModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientListModel {
  String get strIngredient => throw _privateConstructorUsedError;

  /// Serializes this IngredientListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientListModelCopyWith<IngredientListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientListModelCopyWith<$Res> {
  factory $IngredientListModelCopyWith(
    IngredientListModel value,
    $Res Function(IngredientListModel) then,
  ) = _$IngredientListModelCopyWithImpl<$Res, IngredientListModel>;
  @useResult
  $Res call({String strIngredient});
}

/// @nodoc
class _$IngredientListModelCopyWithImpl<$Res, $Val extends IngredientListModel>
    implements $IngredientListModelCopyWith<$Res> {
  _$IngredientListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? strIngredient = null}) {
    return _then(
      _value.copyWith(
            strIngredient: null == strIngredient
                ? _value.strIngredient
                : strIngredient // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientListModelImplCopyWith<$Res>
    implements $IngredientListModelCopyWith<$Res> {
  factory _$$IngredientListModelImplCopyWith(
    _$IngredientListModelImpl value,
    $Res Function(_$IngredientListModelImpl) then,
  ) = __$$IngredientListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String strIngredient});
}

/// @nodoc
class __$$IngredientListModelImplCopyWithImpl<$Res>
    extends _$IngredientListModelCopyWithImpl<$Res, _$IngredientListModelImpl>
    implements _$$IngredientListModelImplCopyWith<$Res> {
  __$$IngredientListModelImplCopyWithImpl(
    _$IngredientListModelImpl _value,
    $Res Function(_$IngredientListModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? strIngredient = null}) {
    return _then(
      _$IngredientListModelImpl(
        strIngredient: null == strIngredient
            ? _value.strIngredient
            : strIngredient // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientListModelImpl implements _IngredientListModel {
  const _$IngredientListModelImpl({required this.strIngredient});

  factory _$IngredientListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientListModelImplFromJson(json);

  @override
  final String strIngredient;

  @override
  String toString() {
    return 'IngredientListModel(strIngredient: $strIngredient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientListModelImpl &&
            (identical(other.strIngredient, strIngredient) ||
                other.strIngredient == strIngredient));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strIngredient);

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientListModelImplCopyWith<_$IngredientListModelImpl> get copyWith =>
      __$$IngredientListModelImplCopyWithImpl<_$IngredientListModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientListModelImplToJson(this);
  }
}

abstract class _IngredientListModel implements IngredientListModel {
  const factory _IngredientListModel({required final String strIngredient}) =
      _$IngredientListModelImpl;

  factory _IngredientListModel.fromJson(Map<String, dynamic> json) =
      _$IngredientListModelImpl.fromJson;

  @override
  String get strIngredient;

  /// Create a copy of IngredientListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientListModelImplCopyWith<_$IngredientListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IngredientListResponse _$IngredientListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _IngredientListResponse.fromJson(json);
}

/// @nodoc
mixin _$IngredientListResponse {
  List<IngredientListModel>? get meals => throw _privateConstructorUsedError;

  /// Serializes this IngredientListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientListResponseCopyWith<IngredientListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientListResponseCopyWith<$Res> {
  factory $IngredientListResponseCopyWith(
    IngredientListResponse value,
    $Res Function(IngredientListResponse) then,
  ) = _$IngredientListResponseCopyWithImpl<$Res, IngredientListResponse>;
  @useResult
  $Res call({List<IngredientListModel>? meals});
}

/// @nodoc
class _$IngredientListResponseCopyWithImpl<
  $Res,
  $Val extends IngredientListResponse
>
    implements $IngredientListResponseCopyWith<$Res> {
  _$IngredientListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _value.copyWith(
            meals: freezed == meals
                ? _value.meals
                : meals // ignore: cast_nullable_to_non_nullable
                      as List<IngredientListModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientListResponseImplCopyWith<$Res>
    implements $IngredientListResponseCopyWith<$Res> {
  factory _$$IngredientListResponseImplCopyWith(
    _$IngredientListResponseImpl value,
    $Res Function(_$IngredientListResponseImpl) then,
  ) = __$$IngredientListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<IngredientListModel>? meals});
}

/// @nodoc
class __$$IngredientListResponseImplCopyWithImpl<$Res>
    extends
        _$IngredientListResponseCopyWithImpl<$Res, _$IngredientListResponseImpl>
    implements _$$IngredientListResponseImplCopyWith<$Res> {
  __$$IngredientListResponseImplCopyWithImpl(
    _$IngredientListResponseImpl _value,
    $Res Function(_$IngredientListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _$IngredientListResponseImpl(
        meals: freezed == meals
            ? _value._meals
            : meals // ignore: cast_nullable_to_non_nullable
                  as List<IngredientListModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientListResponseImpl implements _IngredientListResponse {
  const _$IngredientListResponseImpl({final List<IngredientListModel>? meals})
    : _meals = meals;

  factory _$IngredientListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientListResponseImplFromJson(json);

  final List<IngredientListModel>? _meals;
  @override
  List<IngredientListModel>? get meals {
    final value = _meals;
    if (value == null) return null;
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IngredientListResponse(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientListResponseImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of IngredientListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientListResponseImplCopyWith<_$IngredientListResponseImpl>
  get copyWith =>
      __$$IngredientListResponseImplCopyWithImpl<_$IngredientListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientListResponseImplToJson(this);
  }
}

abstract class _IngredientListResponse implements IngredientListResponse {
  const factory _IngredientListResponse({
    final List<IngredientListModel>? meals,
  }) = _$IngredientListResponseImpl;

  factory _IngredientListResponse.fromJson(Map<String, dynamic> json) =
      _$IngredientListResponseImpl.fromJson;

  @override
  List<IngredientListModel>? get meals;

  /// Create a copy of IngredientListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientListResponseImplCopyWith<_$IngredientListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
