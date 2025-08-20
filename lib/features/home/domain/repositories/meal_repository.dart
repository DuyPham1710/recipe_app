import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

abstract class MealRepository {
  Future<List<MealEntity>> getMealsByCategory(String category);

  Future<List<MealEntity>> getMealsByLocation(String location);
  
  Future<MealEntity> getMealById(String id);
  
  Future<List<MealEntity>> searchMealsByName(String query);
}
