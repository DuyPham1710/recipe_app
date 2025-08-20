import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

abstract class FilterRepository {
  Future<List<String>> getCategories();
  Future<List<String>> getAreas();
  Future<List<String>> getIngredients();
  Future<List<MealEntity>> filterMeals({
    String? category,
    String? ingredient,
    String? area,
  });
}
