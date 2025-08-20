import 'package:equatable/equatable.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class LoadMealsByCategory extends MealEvent {
  final String category;

  const LoadMealsByCategory(this.category);

  @override
  List<Object> get props => [category];
}
