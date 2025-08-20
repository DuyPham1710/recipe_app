import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/meal_repository.dart';

class GetMealByLocationUsecase {
  final MealRepository _mealRepository;

  GetMealByLocationUsecase(this._mealRepository);

  Future<List<MealEntity>> call(String location) async {
    return await _mealRepository.getMealsByLocation(location);
  }
}
