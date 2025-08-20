import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<MealEntity> meals;
  final String query;
  SearchLoaded(this.meals, this.query);

  @override
  List<Object?> get props => [meals, query];
}

class SearchEmpty extends SearchState {
  final String query;
  SearchEmpty(this.query);

  @override
  List<Object?> get props => [query];
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
