import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

class SaveService {
  static const String _savedKey = 'saved_recipes';

  static Future<bool> addToSaved(MealEntity meal) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = await getSaved();

      if (!saved.any((savedMeal) => savedMeal.id == meal.id)) {
        saved.add(meal);
        final savedJson = saved.map((meal) => meal.toJson()).toList();
        await prefs.setString(_savedKey, jsonEncode(savedJson));
        return true;
      }
      return false;
    } catch (e) {
      print('Error adding to saved: $e');
      return false;
    }
  }

  static Future<bool> removeFromSaved(String mealId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = await getSaved();

      saved.removeWhere((meal) => meal.id == mealId);
      final savedJson = saved.map((meal) => meal.toJson()).toList();
      await prefs.setString(_savedKey, jsonEncode(savedJson));
      return true;
    } catch (e) {
      print('Error removing from saved: $e');
      return false;
    }
  }

  static Future<List<MealEntity>> getSaved() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedString = prefs.getString(_savedKey);

      if (savedString == null || savedString.isEmpty) {
        return [];
      }

      final savedJson = jsonDecode(savedString) as List;
      return savedJson
          .map((json) => MealEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting saved: $e');
      return [];
    }
  }

  static Future<bool> isSaved(String mealId) async {
    try {
      final saved = await getSaved();
      return saved.any((meal) => meal.id == mealId);
    } catch (e) {
      print('Error checking saved status: $e');
      return false;
    }
  }

  static Future<bool> clearAllSaved() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_savedKey);
      return true;
    } catch (e) {
      print('Error clearing saved: $e');
      return false;
    }
  }

  static Future<int> getSavedCount() async {
    try {
      final saved = await getSaved();
      return saved.length;
    } catch (e) {
      print('Error getting saved count: $e');
      return 0;
    }
  }
}
