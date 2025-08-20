import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

abstract class MealRepository {
  Future<List<MealEntity>> getMealsByCategory(String category);
}
