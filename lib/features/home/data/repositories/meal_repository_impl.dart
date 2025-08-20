import 'package:dio/dio.dart';
import 'package:recipe_app/core/constants/api_endpoints.dart';
import 'package:recipe_app/core/network/dio_client.dart';
import 'package:recipe_app/core/utils/helper.dart';
import 'package:recipe_app/features/home/data/models/meal_model.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final Dio _dio = DioClient.instance;

  @override
  Future<List<MealEntity>> getMealsByCategory(String category) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.filter,
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
                category: meal.strCategory,
                area: meal.strArea,
                instructions: meal.strInstructions,
                tags: meal.strTags,
                youtube: meal.strYoutube,
                ingredients: Helper.extractIngredients(meal),
                measures: Helper.extractMeasures(meal),
                source: meal.strSource,
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

  @override
  Future<List<MealEntity>> getMealsByLocation(String location) async {
    try {
      print('Fetching meals for location: $location');
      final response = await _dio.get(
        ApiEndpoints.filter,
        queryParameters: {'a': location},
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        final mealsResponse = MealsResponse.fromJson(response.data);
        final mealsList = mealsResponse.meals ?? [];
        print('Parsed meals count: ${mealsList.length}');

        if (mealsList.isEmpty) {
          print('No meals found for location: $location');
          // Thử với location khác nếu không có dữ liệu
          return await getMealsByCategory('beef');
        }

        return mealsList
            .map(
              (meal) => MealEntity(
                id: meal.idMeal,
                name: meal.strMeal,
                imageUrl: meal.strMealThumb ?? '',
                category: meal.strCategory,
                area: meal.strArea,
                instructions: meal.strInstructions,
                tags: meal.strTags,
                youtube: meal.strYoutube,
                ingredients: Helper.extractIngredients(meal),
                measures: Helper.extractMeasures(meal),
                source: meal.strSource,
              ),
            )
            .toList();
      } else {
        throw Exception('Failed to load meals by location');
      }
    } catch (e) {
      print('Error fetching meals by location: $e');
      throw Exception('Error: $e');
    }
  }

  @override
  Future<MealEntity> getMealById(String id) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.mealById,
        queryParameters: {'i': id},
      );

      if (response.statusCode == 200) {
        final mealsResponse = MealsResponse.fromJson(response.data);
        final mealsList = mealsResponse.meals ?? [];

        if (mealsList.isNotEmpty) {
          final meal = mealsList.first;
          return MealEntity(
            id: meal.idMeal,
            name: meal.strMeal,
            imageUrl: meal.strMealThumb ?? '',
            category: meal.strCategory,
            area: meal.strArea,
            instructions: meal.strInstructions,
            tags: meal.strTags,
            youtube: meal.strYoutube,
            ingredients: Helper.extractIngredients(meal),
            measures: Helper.extractMeasures(meal),
            source: meal.strSource,
          );
        } else {
          throw Exception('Meal not found');
        }
      } else {
        throw Exception('Failed to load meal details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Future<List<MealEntity>> searchMealsByName(String query) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.searchMeal,
        queryParameters: {'s': query},
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
                category: meal.strCategory,
                area: meal.strArea,
                instructions: meal.strInstructions,
                tags: meal.strTags,
                youtube: meal.strYoutube,
                ingredients: Helper.extractIngredients(meal),
                measures: Helper.extractMeasures(meal),
                source: meal.strSource,
              ),
            )
            .toList();
      } else {
        throw Exception('Failed to search meals');
      }
    } catch (e) {
      throw Exception('Error searching meals: $e');
    }
  }
}
