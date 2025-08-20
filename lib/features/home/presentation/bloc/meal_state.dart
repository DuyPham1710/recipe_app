import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<MealEntity> meals;

  const MealLoaded(this.meals);

  @override
  List<Object> get props => [meals];
}

class MealError extends MealState {
  final String message;

  const MealError(this.message);

  @override
  List<Object> get props => [message];
}
