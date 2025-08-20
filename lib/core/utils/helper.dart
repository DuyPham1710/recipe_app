import 'package:recipe_app/features/home/data/models/meal_model.dart';

class Helper {
  static List<String> parseInstructions(String instructions) {
    final steps = instructions
        .split(RegExp(r'[.!?]|\n'))
        .map((step) => step.trim())
        .where((step) => step.isNotEmpty)
        .toList();

    return steps;
  }

  static List<String> extractIngredients(MealModel meal) {
    final ingredients = <String>[];

    if (meal.strIngredient1?.isNotEmpty == true)
      ingredients.add(meal.strIngredient1!);
    if (meal.strIngredient2?.isNotEmpty == true)
      ingredients.add(meal.strIngredient2!);
    if (meal.strIngredient3?.isNotEmpty == true)
      ingredients.add(meal.strIngredient3!);
    if (meal.strIngredient4?.isNotEmpty == true)
      ingredients.add(meal.strIngredient4!);
    if (meal.strIngredient5?.isNotEmpty == true)
      ingredients.add(meal.strIngredient5!);
    if (meal.strIngredient6?.isNotEmpty == true)
      ingredients.add(meal.strIngredient6!);
    if (meal.strIngredient7?.isNotEmpty == true)
      ingredients.add(meal.strIngredient7!);
    if (meal.strIngredient8?.isNotEmpty == true)
      ingredients.add(meal.strIngredient8!);
    if (meal.strIngredient9?.isNotEmpty == true)
      ingredients.add(meal.strIngredient9!);
    if (meal.strIngredient10?.isNotEmpty == true)
      ingredients.add(meal.strIngredient10!);
    if (meal.strIngredient11?.isNotEmpty == true)
      ingredients.add(meal.strIngredient11!);
    if (meal.strIngredient12?.isNotEmpty == true)
      ingredients.add(meal.strIngredient12!);
    if (meal.strIngredient13?.isNotEmpty == true)
      ingredients.add(meal.strIngredient13!);
    if (meal.strIngredient14?.isNotEmpty == true)
      ingredients.add(meal.strIngredient14!);
    if (meal.strIngredient15?.isNotEmpty == true)
      ingredients.add(meal.strIngredient15!);
    if (meal.strIngredient16?.isNotEmpty == true)
      ingredients.add(meal.strIngredient16!);
    if (meal.strIngredient17?.isNotEmpty == true)
      ingredients.add(meal.strIngredient17!);
    if (meal.strIngredient18?.isNotEmpty == true)
      ingredients.add(meal.strIngredient18!);
    if (meal.strIngredient19?.isNotEmpty == true)
      ingredients.add(meal.strIngredient19!);
    if (meal.strIngredient20?.isNotEmpty == true)
      ingredients.add(meal.strIngredient20!);

    return ingredients;
  }

  static List<String> extractMeasures(MealModel meal) {
    final measures = <String>[];

    if (meal.strMeasure1?.isNotEmpty == true) measures.add(meal.strMeasure1!);
    if (meal.strMeasure2?.isNotEmpty == true) measures.add(meal.strMeasure2!);
    if (meal.strMeasure3?.isNotEmpty == true) measures.add(meal.strMeasure3!);
    if (meal.strMeasure4?.isNotEmpty == true) measures.add(meal.strMeasure4!);
    if (meal.strMeasure5?.isNotEmpty == true) measures.add(meal.strMeasure5!);
    if (meal.strMeasure6?.isNotEmpty == true) measures.add(meal.strMeasure6!);
    if (meal.strMeasure7?.isNotEmpty == true) measures.add(meal.strMeasure7!);
    if (meal.strMeasure8?.isNotEmpty == true) measures.add(meal.strMeasure8!);
    if (meal.strMeasure9?.isNotEmpty == true) measures.add(meal.strMeasure9!);
    if (meal.strMeasure10?.isNotEmpty == true) measures.add(meal.strMeasure10!);
    if (meal.strMeasure11?.isNotEmpty == true) measures.add(meal.strMeasure11!);
    if (meal.strMeasure12?.isNotEmpty == true) measures.add(meal.strMeasure12!);
    if (meal.strMeasure13?.isNotEmpty == true) measures.add(meal.strMeasure13!);
    if (meal.strMeasure14?.isNotEmpty == true) measures.add(meal.strMeasure14!);
    if (meal.strMeasure15?.isNotEmpty == true) measures.add(meal.strMeasure15!);
    if (meal.strMeasure16?.isNotEmpty == true) measures.add(meal.strMeasure16!);
    if (meal.strMeasure17?.isNotEmpty == true) measures.add(meal.strMeasure17!);
    if (meal.strMeasure18?.isNotEmpty == true) measures.add(meal.strMeasure18!);
    if (meal.strMeasure19?.isNotEmpty == true) measures.add(meal.strMeasure19!);
    if (meal.strMeasure20?.isNotEmpty == true) measures.add(meal.strMeasure20!);

    return measures;
  }
}
