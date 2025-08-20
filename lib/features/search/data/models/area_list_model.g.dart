// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AreaListModelImpl _$$AreaListModelImplFromJson(Map<String, dynamic> json) =>
    _$AreaListModelImpl(strArea: json['strArea'] as String);

Map<String, dynamic> _$$AreaListModelImplToJson(_$AreaListModelImpl instance) =>
    <String, dynamic>{'strArea': instance.strArea};

_$AreaListResponseImpl _$$AreaListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AreaListResponseImpl(
  meals: (json['meals'] as List<dynamic>?)
      ?.map((e) => AreaListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AreaListResponseImplToJson(
  _$AreaListResponseImpl instance,
) => <String, dynamic>{'meals': instance.meals};
