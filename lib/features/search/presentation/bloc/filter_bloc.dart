import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/search/domain/usecases/load_area_usecase.dart';
import 'package:recipe_app/features/search/domain/usecases/load_category_usecase.dart';
import 'package:recipe_app/features/search/domain/usecases/load_ingredient_usecase.dart';
import 'package:recipe_app/features/search/domain/usecases/filter_meals_usecase.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

// Events
abstract class FilterEvent {}

class LoadFilterData extends FilterEvent {}

class ApplyFilter extends FilterEvent {
  final String? category;
  final String? ingredient;
  final String? area;

  ApplyFilter({this.category, this.ingredient, this.area});
}

// States
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final List<String> categories;
  final List<String> areas;
  final List<String> ingredients;

  FilterLoaded({
    required this.categories,
    required this.areas,
    required this.ingredients,
  });
}

class FilterApplied extends FilterState {
  final List<MealEntity> filteredMeals;

  FilterApplied({required this.filteredMeals});
}

class FilterError extends FilterState {
  final String message;
  FilterError(this.message);
}

// Bloc
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final LoadCategoryUsecase _loadCategoryUsecase;
  final LoadAreaUsecase _loadAreaUsecase;
  final LoadIngredientUsecase _loadIngredientUsecase;
  final FilterMealsUsecase _filterMealsUsecase;

  FilterBloc(
    this._loadCategoryUsecase,
    this._loadAreaUsecase,
    this._loadIngredientUsecase,
    this._filterMealsUsecase,
  ) : super(FilterInitial()) {
    on<LoadFilterData>(_onLoadFilterData);
    on<ApplyFilter>(_onApplyFilter);
  }

  Future<void> _onLoadFilterData(
    LoadFilterData event,
    Emitter<FilterState> emit,
  ) async {
    emit(FilterLoading());

    try {
      final categories = await _loadCategoryUsecase();
      final areas = await _loadAreaUsecase();
      final ingredients = await _loadIngredientUsecase();

      emit(
        FilterLoaded(
          categories: categories,
          areas: areas,
          ingredients: ingredients,
        ),
      );
    } catch (e) {
      emit(FilterError(e.toString()));
    }
  }

  Future<void> _onApplyFilter(
    ApplyFilter event,
    Emitter<FilterState> emit,
  ) async {
    emit(FilterLoading());

    try {
      final filteredMeals = await _filterMealsUsecase(
        category: event.category,
        ingredient: event.ingredient,
        area: event.area,
      );

      emit(FilterApplied(filteredMeals: filteredMeals));
    } catch (e) {
      emit(FilterError(e.toString()));
    }
  }
}
