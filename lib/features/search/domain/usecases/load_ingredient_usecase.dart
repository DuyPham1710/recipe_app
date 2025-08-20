import 'package:recipe_app/features/search/domain/repository/filter_repository.dart';

class LoadIngredientUsecase {
  final FilterRepository _filterRepository;

  LoadIngredientUsecase(this._filterRepository);

  Future<List<String>> call() async {
    return await _filterRepository.getIngredients();
  }
}
