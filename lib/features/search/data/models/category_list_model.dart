import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list_model.freezed.dart';
part 'category_list_model.g.dart';

@freezed
class CategoryListModel with _$CategoryListModel {
  const factory CategoryListModel({
    required String strCategory,
  }) = _CategoryListModel;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryListModelFromJson(json);
}

@freezed
class CategoryListResponse with _$CategoryListResponse {
  const factory CategoryListResponse({
    List<CategoryListModel>? meals,
  }) = _CategoryListResponse;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
}
