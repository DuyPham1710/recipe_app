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

class LoadMealsByLocation extends MealEvent {
  final String location;

  const LoadMealsByLocation(this.location);

  @override
  List<Object> get props => [location];
}
