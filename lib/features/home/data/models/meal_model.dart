import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_model.freezed.dart';
part 'meal_model.g.dart';

@freezed
class MealModel with _$MealModel {
  const factory MealModel({
    required String strMeal,
    String? strMealThumb,
    required String idMeal,
  }) = _MealModel;

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);
}

@freezed
class MealsResponse with _$MealsResponse {
  const factory MealsResponse({List<MealModel>? meals}) = _MealsResponse;

  factory MealsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsResponseFromJson(json);
}
