import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/home/domain/usecases/get_meals_by_category_usecase.dart';
import 'package:recipe_app/features/home/presentation/bloc/meal_event.dart';
import 'package:recipe_app/features/home/presentation/bloc/meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final GetMealsByCategoryUseCase _getMealsByCategoryUseCase;

  MealBloc(this._getMealsByCategoryUseCase) : super(MealInitial()) {
    on<LoadMealsByCategory>(_onLoadMealsByCategory);
  }

  Future<void> _onLoadMealsByCategory(
    LoadMealsByCategory event,
    Emitter<MealState> emit,
  ) async {
    emit(MealLoading());

    try {
      final meals = await _getMealsByCategoryUseCase(event.category);
      emit(MealLoaded(meals));
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }
}
