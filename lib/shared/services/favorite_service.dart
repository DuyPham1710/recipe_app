import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

class FavoriteService {
  static const String _favoritesKey = 'favorite_recipes';
  static const String _savedKey = 'saved_recipes';

  static Future<bool> addToFavorites(MealEntity meal) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      if (!favorites.any((favorite) => favorite.id == meal.id)) {
        favorites.add(meal);
        final favoritesJson = favorites.map((meal) => meal.toJson()).toList();
        await prefs.setString(_favoritesKey, jsonEncode(favoritesJson));
        return true;
      }
      return false; // Recipe đã có trong favorites
    } catch (e) {
      print('Error add to favorites: $e');
      return false;
    }
  }

  static Future<bool> removeFromFavorites(String mealId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      favorites.removeWhere((meal) => meal.id == mealId);
      final favoritesJson = favorites.map((meal) => meal.toJson()).toList();
      await prefs.setString(_favoritesKey, jsonEncode(favoritesJson));
      return true;
    } catch (e) {
      print('Error remove from favorites: $e');
      return false;
    }
  }

  static Future<List<MealEntity>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesString = prefs.getString(_favoritesKey);

      if (favoritesString == null || favoritesString.isEmpty) {
        return [];
      }

      final favoritesJson = jsonDecode(favoritesString) as List;
      return favoritesJson
          .map((json) => MealEntity.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting favorites: $e');
      return [];
    }
  }

  static Future<bool> isFavorite(String mealId) async {
    try {
      final favorites = await getFavorites();
      return favorites.any((meal) => meal.id == mealId);
    } catch (e) {
      print('Error checking favorite status: $e');
      return false;
    }
  }

  static Future<bool> clearAllFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_favoritesKey);
      return true;
    } catch (e) {
      print('Error clearing favorites: $e');
      return false;
    }
  }

  static Future<int> getFavoritesCount() async {
    try {
      final favorites = await getFavorites();
      return favorites.length;
    } catch (e) {
      print('Error getting favorites count: $e');
      return 0;
    }
  }

  // ========== SAVE RECIPES METHODS ==========
  
  // Lưu recipe vào saved
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
      return false; // Recipe đã có trong saved
    } catch (e) {
      print('Error adding to saved: $e');
      return false;
    }
  }
  
  // Xóa recipe khỏi saved
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
  
  // Lấy danh sách saved
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
  
  // Kiểm tra xem recipe có trong saved không
  static Future<bool> isSaved(String mealId) async {
    try {
      final saved = await getSaved();
      return saved.any((meal) => meal.id == mealId);
    } catch (e) {
      print('Error checking saved status: $e');
      return false;
    }
  }
  
  // Xóa tất cả saved
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
  
  // Lấy số lượng saved
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
