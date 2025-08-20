import 'package:recipe_app/features/search/domain/repository/filter_repository.dart';

class LoadCategoryUsecase {
  final FilterRepository _filterRepository;

  LoadCategoryUsecase(this._filterRepository);

  Future<List<String>> call() async {
    return await _filterRepository.getCategories();
  }
}
