// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientListModelImpl _$$IngredientListModelImplFromJson(
  Map<String, dynamic> json,
) => _$IngredientListModelImpl(strIngredient: json['strIngredient'] as String);

Map<String, dynamic> _$$IngredientListModelImplToJson(
  _$IngredientListModelImpl instance,
) => <String, dynamic>{'strIngredient': instance.strIngredient};

_$IngredientListResponseImpl _$$IngredientListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$IngredientListResponseImpl(
  meals: (json['meals'] as List<dynamic>?)
      ?.map((e) => IngredientListModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$IngredientListResponseImplToJson(
  _$IngredientListResponseImpl instance,
) => <String, dynamic>{'meals': instance.meals};
