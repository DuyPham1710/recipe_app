import 'package:dio/dio.dart';
import 'package:recipe_app/core/constants/api_endpoints.dart';
import 'package:recipe_app/core/network/dio_client.dart';
import 'package:recipe_app/features/home/data/models/meal_model.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final Dio _dio = DioClient.instance;

  @override
  Future<List<MealEntity>> getMealsByCategory(String category) async {
    try {
      print('Fetching meals for category: $category');
      final response = await _dio.get(
        ApiEndpoints.mealsByCategory,
        queryParameters: {'c': category},
      );

      if (response.statusCode == 200) {
        final mealsResponse = MealsResponse.fromJson(response.data);
        final mealsList = mealsResponse.meals ?? [];
        return mealsList
            .map(
              (meal) => MealEntity(
                id: meal.idMeal,
                name: meal.strMeal,
                imageUrl: meal.strMealThumb ?? '',
              ),
            )
            .toList();
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
