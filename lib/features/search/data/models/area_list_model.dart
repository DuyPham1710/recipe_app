import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_list_model.freezed.dart';
part 'area_list_model.g.dart';

@freezed
class AreaListModel with _$AreaListModel {
  const factory AreaListModel({
    required String strArea,
  }) = _AreaListModel;

  factory AreaListModel.fromJson(Map<String, dynamic> json) =>
      _$AreaListModelFromJson(json);
}

@freezed
class AreaListResponse with _$AreaListResponse {
  const factory AreaListResponse({
    List<AreaListModel>? meals,
  }) = _AreaListResponse;

  factory AreaListResponse.fromJson(Map<String, dynamic> json) =>
      _$AreaListResponseFromJson(json);
}
