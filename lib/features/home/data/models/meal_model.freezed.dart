// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MealModel _$MealModelFromJson(Map<String, dynamic> json) {
  return _MealModel.fromJson(json);
}

/// @nodoc
mixin _$MealModel {
  String get strMeal => throw _privateConstructorUsedError;
  String? get strMealThumb => throw _privateConstructorUsedError;
  String get idMeal => throw _privateConstructorUsedError;

  /// Serializes this MealModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealModelCopyWith<MealModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealModelCopyWith<$Res> {
  factory $MealModelCopyWith(MealModel value, $Res Function(MealModel) then) =
      _$MealModelCopyWithImpl<$Res, MealModel>;
  @useResult
  $Res call({String strMeal, String? strMealThumb, String idMeal});
}

/// @nodoc
class _$MealModelCopyWithImpl<$Res, $Val extends MealModel>
    implements $MealModelCopyWith<$Res> {
  _$MealModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strMeal = null,
    Object? strMealThumb = freezed,
    Object? idMeal = null,
  }) {
    return _then(
      _value.copyWith(
            strMeal: null == strMeal
                ? _value.strMeal
                : strMeal // ignore: cast_nullable_to_non_nullable
                      as String,
            strMealThumb: freezed == strMealThumb
                ? _value.strMealThumb
                : strMealThumb // ignore: cast_nullable_to_non_nullable
                      as String?,
            idMeal: null == idMeal
                ? _value.idMeal
                : idMeal // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealModelImplCopyWith<$Res>
    implements $MealModelCopyWith<$Res> {
  factory _$$MealModelImplCopyWith(
    _$MealModelImpl value,
    $Res Function(_$MealModelImpl) then,
  ) = __$$MealModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String strMeal, String? strMealThumb, String idMeal});
}

/// @nodoc
class __$$MealModelImplCopyWithImpl<$Res>
    extends _$MealModelCopyWithImpl<$Res, _$MealModelImpl>
    implements _$$MealModelImplCopyWith<$Res> {
  __$$MealModelImplCopyWithImpl(
    _$MealModelImpl _value,
    $Res Function(_$MealModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strMeal = null,
    Object? strMealThumb = freezed,
    Object? idMeal = null,
  }) {
    return _then(
      _$MealModelImpl(
        strMeal: null == strMeal
            ? _value.strMeal
            : strMeal // ignore: cast_nullable_to_non_nullable
                  as String,
        strMealThumb: freezed == strMealThumb
            ? _value.strMealThumb
            : strMealThumb // ignore: cast_nullable_to_non_nullable
                  as String?,
        idMeal: null == idMeal
            ? _value.idMeal
            : idMeal // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealModelImpl implements _MealModel {
  const _$MealModelImpl({
    required this.strMeal,
    this.strMealThumb,
    required this.idMeal,
  });

  factory _$MealModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealModelImplFromJson(json);

  @override
  final String strMeal;
  @override
  final String? strMealThumb;
  @override
  final String idMeal;

  @override
  String toString() {
    return 'MealModel(strMeal: $strMeal, strMealThumb: $strMealThumb, idMeal: $idMeal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealModelImpl &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb) &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strMeal, strMealThumb, idMeal);

  /// Create a copy of MealModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealModelImplCopyWith<_$MealModelImpl> get copyWith =>
      __$$MealModelImplCopyWithImpl<_$MealModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealModelImplToJson(this);
  }
}

abstract class _MealModel implements MealModel {
  const factory _MealModel({
    required final String strMeal,
    final String? strMealThumb,
    required final String idMeal,
  }) = _$MealModelImpl;

  factory _MealModel.fromJson(Map<String, dynamic> json) =
      _$MealModelImpl.fromJson;

  @override
  String get strMeal;
  @override
  String? get strMealThumb;
  @override
  String get idMeal;

  /// Create a copy of MealModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealModelImplCopyWith<_$MealModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealsResponse _$MealsResponseFromJson(Map<String, dynamic> json) {
  return _MealsResponse.fromJson(json);
}

/// @nodoc
mixin _$MealsResponse {
  List<MealModel>? get meals => throw _privateConstructorUsedError;

  /// Serializes this MealsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealsResponseCopyWith<MealsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealsResponseCopyWith<$Res> {
  factory $MealsResponseCopyWith(
    MealsResponse value,
    $Res Function(MealsResponse) then,
  ) = _$MealsResponseCopyWithImpl<$Res, MealsResponse>;
  @useResult
  $Res call({List<MealModel>? meals});
}

/// @nodoc
class _$MealsResponseCopyWithImpl<$Res, $Val extends MealsResponse>
    implements $MealsResponseCopyWith<$Res> {
  _$MealsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _value.copyWith(
            meals: freezed == meals
                ? _value.meals
                : meals // ignore: cast_nullable_to_non_nullable
                      as List<MealModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MealsResponseImplCopyWith<$Res>
    implements $MealsResponseCopyWith<$Res> {
  factory _$$MealsResponseImplCopyWith(
    _$MealsResponseImpl value,
    $Res Function(_$MealsResponseImpl) then,
  ) = __$$MealsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MealModel>? meals});
}

/// @nodoc
class __$$MealsResponseImplCopyWithImpl<$Res>
    extends _$MealsResponseCopyWithImpl<$Res, _$MealsResponseImpl>
    implements _$$MealsResponseImplCopyWith<$Res> {
  __$$MealsResponseImplCopyWithImpl(
    _$MealsResponseImpl _value,
    $Res Function(_$MealsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _$MealsResponseImpl(
        meals: freezed == meals
            ? _value._meals
            : meals // ignore: cast_nullable_to_non_nullable
                  as List<MealModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealsResponseImpl implements _MealsResponse {
  const _$MealsResponseImpl({final List<MealModel>? meals}) : _meals = meals;

  factory _$MealsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealsResponseImplFromJson(json);

  final List<MealModel>? _meals;
  @override
  List<MealModel>? get meals {
    final value = _meals;
    if (value == null) return null;
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MealsResponse(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealsResponseImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of MealsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealsResponseImplCopyWith<_$MealsResponseImpl> get copyWith =>
      __$$MealsResponseImplCopyWithImpl<_$MealsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealsResponseImplToJson(this);
  }
}

abstract class _MealsResponse implements MealsResponse {
  const factory _MealsResponse({final List<MealModel>? meals}) =
      _$MealsResponseImpl;

  factory _MealsResponse.fromJson(Map<String, dynamic> json) =
      _$MealsResponseImpl.fromJson;

  @override
  List<MealModel>? get meals;

  /// Create a copy of MealsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealsResponseImplCopyWith<_$MealsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
