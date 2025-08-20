import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_list_model.freezed.dart';
part 'ingredient_list_model.g.dart';

@freezed
class IngredientListModel with _$IngredientListModel {
  const factory IngredientListModel({
    required String strIngredient,
  }) = _IngredientListModel;

  factory IngredientListModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientListModelFromJson(json);
}

@freezed
class IngredientListResponse with _$IngredientListResponse {
  const factory IngredientListResponse({
    List<IngredientListModel>? meals,
  }) = _IngredientListResponse;

  factory IngredientListResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientListResponseFromJson(json);
}
