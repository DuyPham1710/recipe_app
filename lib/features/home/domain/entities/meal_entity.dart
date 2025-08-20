class MealEntity {
  final String id;
  final String name;
  final String imageUrl;
  final String? category;
  final String? area;
  final String? instructions;
  final String? tags;
  final String? youtube;
  final List<String> ingredients;
  final List<String> measures;
  final String? source;

  const MealEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.category,
    this.area,
    this.instructions,
    this.tags,
    this.youtube,
    this.ingredients = const [],
    this.measures = const [],
    this.source,
  });

  // tạo toJson và fromJson để lưu trữ vào shared preferences
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
      'area': area,
      'instructions': instructions,
      'tags': tags,
      'youtube': youtube,
      'ingredients': ingredients,
      'measures': measures,
      'source': source,
    };
  }

  factory MealEntity.fromJson(Map<String, dynamic> json) {
    return MealEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String?,
      area: json['area'] as String?,
      instructions: json['instructions'] as String?,
      tags: json['tags'] as String?,
      youtube: json['youtube'] as String?,
      ingredients: List<String>.from(json['ingredients'] as List),
      measures: List<String>.from(json['measures'] as List),
      source: json['source'] as String?,
    );
  }
}
