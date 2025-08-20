import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/search/domain/repository/filter_repository.dart';

class FilterMealsUsecase {
  final FilterRepository _filterRepository;

  FilterMealsUsecase(this._filterRepository);

  Future<List<MealEntity>> call({
    String? category,
    String? ingredient,
    String? area,
  }) async {
    return await _filterRepository.filterMeals(
      category: category,
      ingredient: ingredient,
      area: area,
    );
  }
}
