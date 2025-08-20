import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/meal_repository.dart';

class SearchMealUseCase {
  final MealRepository _mealRepository;

  SearchMealUseCase(this._mealRepository);

  Future<List<MealEntity>> call(String query) async {
    return await _mealRepository.searchMealsByName(query);
  }
}
