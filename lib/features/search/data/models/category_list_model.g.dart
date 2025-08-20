// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryListModelImpl _$$CategoryListModelImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryListModelImpl(strCategory: json['strCategory'] as String);

Map<String, dynamic> _$$CategoryListModelImplToJson(
  _$CategoryListModelImpl instance,
) => <String, dynamic>{'strCategory': instance.strCategory};

_$CategoryListResponseImpl _$$CategoryListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryListResponseImpl(
  meals: (json['meals'] as List<dynamic>?)
      ?.map((e) => CategoryListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$CategoryListResponseImplToJson(
  _$CategoryListResponseImpl instance,
) => <String, dynamic>{'meals': instance.meals};
