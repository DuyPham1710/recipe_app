import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/meal_repository.dart';

class GetMealsByCategoryUseCase {
  final MealRepository _mealRepository;

  GetMealsByCategoryUseCase(this._mealRepository);

  Future<List<MealEntity>> call(String category) async {
    return await _mealRepository.getMealsByCategory(category);
  }
}
