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
}
