import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/meal_repository.dart';

class GetMealByIdUseCase {
  final MealRepository _mealRepository;

  GetMealByIdUseCase(this._mealRepository);

  Future<MealEntity> call(String id) async {
    return await _mealRepository.getMealById(id);
  }
}
