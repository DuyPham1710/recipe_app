import 'package:dio/dio.dart';
import 'package:recipe_app/core/constants/api_endpoints.dart';
import 'package:recipe_app/core/network/dio_client.dart';
import 'package:recipe_app/core/utils/helper.dart';
import 'package:recipe_app/features/search/data/models/category_list_model.dart';
import 'package:recipe_app/features/search/data/models/area_list_model.dart';
import 'package:recipe_app/features/search/data/models/ingredient_list_model.dart';
import 'package:recipe_app/features/search/domain/repository/filter_repository.dart';
import 'package:recipe_app/features/home/data/models/meal_model.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

class FilterRepositoryImpl implements FilterRepository {
  final Dio _dio = DioClient.instance;

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await _dio.get(ApiEndpoints.listCategory);

      if (response.statusCode == 200) {
        final categoriesResponse = CategoryListResponse.fromJson(response.data);
        return categoriesResponse.meals
                ?.map((category) => category.strCategory)
                .toList() ??
            [];
      }
      return [];
    } catch (e) {
      throw Exception('Error loading categories: $e');
    }
  }

  @override
  Future<List<String>> getAreas() async {
    try {
      final response = await _dio.get(ApiEndpoints.areas);

      if (response.statusCode == 200) {
        final areasResponse = AreaListResponse.fromJson(response.data);
        return areasResponse.meals?.map((area) => area.strArea).toList() ?? [];
      }
      return [];
    } catch (e) {
      throw Exception('Error loading areas: $e');
    }
  }

  @override
  Future<List<String>> getIngredients() async {
    try {
      final response = await _dio.get(ApiEndpoints.ingredients);

      if (response.statusCode == 200) {
        final ingredientsResponse = IngredientListResponse.fromJson(
          response.data,
        );
        return ingredientsResponse.meals
                ?.map((ingredient) => ingredient.strIngredient)
                .toList() ??
            [];
      }
      return [];
    } catch (e) {
      throw Exception('Error loading ingredients: $e');
    }
  }

  @override
  Future<List<MealEntity>> filterMeals({
    String? category,
    String? ingredient,
    String? area,
  }) async {
    try {
      List<MealEntity> filteredMeals = [];

      // Bước 1: Filter theo category (nếu có)
      if (category != null) {
        final categoryResponse = await _dio.get(
          ApiEndpoints.filter,
          queryParameters: {'c': category},
        );

        if (categoryResponse.statusCode == 200) {
          final mealsResponse = MealsResponse.fromJson(categoryResponse.data);
          filteredMeals =
              mealsResponse.meals
                  ?.map(
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
                  .toList() ??
              [];

          // Bước 2: Filter theo ingredient (nếu có)
          if (ingredient != null && filteredMeals.isNotEmpty) {
            final ingredientResponse = await _dio.get(
              ApiEndpoints.filter,
              queryParameters: {'i': ingredient},
            );

            if (ingredientResponse.statusCode == 200) {
              final ingredientMealsResponse = MealsResponse.fromJson(
                ingredientResponse.data,
              );
              final ingredientMealIds =
                  ingredientMealsResponse.meals
                      ?.map((meal) => meal.idMeal)
                      .toSet() ??
                  {};

              // Chỉ giữ lại meals có trong cả category và ingredient
              filteredMeals = filteredMeals
                  .where((meal) => ingredientMealIds.contains(meal.id))
                  .toList();
            }
          }

          // Bước 3: Filter theo area (nếu có)
          if (area != null && filteredMeals.isNotEmpty) {
            final areaResponse = await _dio.get(
              ApiEndpoints.filter,
              queryParameters: {'a': area},
            );

            if (areaResponse.statusCode == 200) {
              final areaMealsResponse = MealsResponse.fromJson(
                areaResponse.data,
              );
              final areaMealIds =
                  areaMealsResponse.meals?.map((meal) => meal.idMeal).toSet() ??
                  {};

              // Chỉ giữ lại meals có trong cả category, ingredient và area
              filteredMeals = filteredMeals
                  .where((meal) => areaMealIds.contains(meal.id))
                  .toList();
            }
          }
        }
      } else if (ingredient != null) {
        final ingredientResponse = await _dio.get(
          ApiEndpoints.filter,
          queryParameters: {'i': ingredient},
        );

        if (ingredientResponse.statusCode == 200) {
          final mealsResponse = MealsResponse.fromJson(ingredientResponse.data);
          filteredMeals =
              mealsResponse.meals
                  ?.map(
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
                  .toList() ??
              [];

          if (area != null && filteredMeals.isNotEmpty) {
            final areaResponse = await _dio.get(
              ApiEndpoints.filter,
              queryParameters: {'a': area},
            );

            if (areaResponse.statusCode == 200) {
              final areaMealsResponse = MealsResponse.fromJson(
                areaResponse.data,
              );
              final areaMealIds =
                  areaMealsResponse.meals?.map((meal) => meal.idMeal).toSet() ??
                  {};

              // Chỉ giữ lại meals có trong ingredient và area
              filteredMeals = filteredMeals
                  .where((meal) => areaMealIds.contains(meal.id))
                  .toList();
            }
          }
        }
      } else if (area != null) {
        final areaResponse = await _dio.get(
          ApiEndpoints.filter,
          queryParameters: {'a': area},
        );

        if (areaResponse.statusCode == 200) {
          final mealsResponse = MealsResponse.fromJson(areaResponse.data);
          filteredMeals =
              mealsResponse.meals
                  ?.map(
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
                  .toList() ??
              [];
        }
      }

      return filteredMeals;
    } catch (e) {
      throw Exception('Error filtering meals: $e');
    }
  }
}
