// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryListModel _$CategoryListModelFromJson(Map<String, dynamic> json) {
  return _CategoryListModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryListModel {
  String get strCategory => throw _privateConstructorUsedError;

  /// Serializes this CategoryListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryListModelCopyWith<CategoryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListModelCopyWith<$Res> {
  factory $CategoryListModelCopyWith(
    CategoryListModel value,
    $Res Function(CategoryListModel) then,
  ) = _$CategoryListModelCopyWithImpl<$Res, CategoryListModel>;
  @useResult
  $Res call({String strCategory});
}

/// @nodoc
class _$CategoryListModelCopyWithImpl<$Res, $Val extends CategoryListModel>
    implements $CategoryListModelCopyWith<$Res> {
  _$CategoryListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? strCategory = null}) {
    return _then(
      _value.copyWith(
            strCategory: null == strCategory
                ? _value.strCategory
                : strCategory // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryListModelImplCopyWith<$Res>
    implements $CategoryListModelCopyWith<$Res> {
  factory _$$CategoryListModelImplCopyWith(
    _$CategoryListModelImpl value,
    $Res Function(_$CategoryListModelImpl) then,
  ) = __$$CategoryListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String strCategory});
}

/// @nodoc
class __$$CategoryListModelImplCopyWithImpl<$Res>
    extends _$CategoryListModelCopyWithImpl<$Res, _$CategoryListModelImpl>
    implements _$$CategoryListModelImplCopyWith<$Res> {
  __$$CategoryListModelImplCopyWithImpl(
    _$CategoryListModelImpl _value,
    $Res Function(_$CategoryListModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? strCategory = null}) {
    return _then(
      _$CategoryListModelImpl(
        strCategory: null == strCategory
            ? _value.strCategory
            : strCategory // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryListModelImpl implements _CategoryListModel {
  const _$CategoryListModelImpl({required this.strCategory});

  factory _$CategoryListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryListModelImplFromJson(json);

  @override
  final String strCategory;

  @override
  String toString() {
    return 'CategoryListModel(strCategory: $strCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListModelImpl &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, strCategory);

  /// Create a copy of CategoryListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryListModelImplCopyWith<_$CategoryListModelImpl> get copyWith =>
      __$$CategoryListModelImplCopyWithImpl<_$CategoryListModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryListModelImplToJson(this);
  }
}

abstract class _CategoryListModel implements CategoryListModel {
  const factory _CategoryListModel({required final String strCategory}) =
      _$CategoryListModelImpl;

  factory _CategoryListModel.fromJson(Map<String, dynamic> json) =
      _$CategoryListModelImpl.fromJson;

  @override
  String get strCategory;

  /// Create a copy of CategoryListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryListModelImplCopyWith<_$CategoryListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryListResponse _$CategoryListResponseFromJson(Map<String, dynamic> json) {
  return _CategoryListResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryListResponse {
  List<CategoryListModel>? get meals => throw _privateConstructorUsedError;

  /// Serializes this CategoryListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryListResponseCopyWith<CategoryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListResponseCopyWith<$Res> {
  factory $CategoryListResponseCopyWith(
    CategoryListResponse value,
    $Res Function(CategoryListResponse) then,
  ) = _$CategoryListResponseCopyWithImpl<$Res, CategoryListResponse>;
  @useResult
  $Res call({List<CategoryListModel>? meals});
}

/// @nodoc
class _$CategoryListResponseCopyWithImpl<
  $Res,
  $Val extends CategoryListResponse
>
    implements $CategoryListResponseCopyWith<$Res> {
  _$CategoryListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _value.copyWith(
            meals: freezed == meals
                ? _value.meals
                : meals // ignore: cast_nullable_to_non_nullable
                      as List<CategoryListModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryListResponseImplCopyWith<$Res>
    implements $CategoryListResponseCopyWith<$Res> {
  factory _$$CategoryListResponseImplCopyWith(
    _$CategoryListResponseImpl value,
    $Res Function(_$CategoryListResponseImpl) then,
  ) = __$$CategoryListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryListModel>? meals});
}

/// @nodoc
class __$$CategoryListResponseImplCopyWithImpl<$Res>
    extends _$CategoryListResponseCopyWithImpl<$Res, _$CategoryListResponseImpl>
    implements _$$CategoryListResponseImplCopyWith<$Res> {
  __$$CategoryListResponseImplCopyWithImpl(
    _$CategoryListResponseImpl _value,
    $Res Function(_$CategoryListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = freezed}) {
    return _then(
      _$CategoryListResponseImpl(
        meals: freezed == meals
            ? _value._meals
            : meals // ignore: cast_nullable_to_non_nullable
                  as List<CategoryListModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryListResponseImpl implements _CategoryListResponse {
  const _$CategoryListResponseImpl({final List<CategoryListModel>? meals})
    : _meals = meals;

  factory _$CategoryListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryListResponseImplFromJson(json);

  final List<CategoryListModel>? _meals;
  @override
  List<CategoryListModel>? get meals {
    final value = _meals;
    if (value == null) return null;
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryListResponse(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryListResponseImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryListResponseImplCopyWith<_$CategoryListResponseImpl>
  get copyWith =>
      __$$CategoryListResponseImplCopyWithImpl<_$CategoryListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryListResponseImplToJson(this);
  }
}

abstract class _CategoryListResponse implements CategoryListResponse {
  const factory _CategoryListResponse({final List<CategoryListModel>? meals}) =
      _$CategoryListResponseImpl;

  factory _CategoryListResponse.fromJson(Map<String, dynamic> json) =
      _$CategoryListResponseImpl.fromJson;

  @override
  List<CategoryListModel>? get meals;

  /// Create a copy of CategoryListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryListResponseImplCopyWith<_$CategoryListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
