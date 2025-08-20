import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/home/domain/usecases/get_meal_by_id_usecase.dart';
import 'package:recipe_app/features/recipe/presentation/bloc/meal_detail_event.dart';
import 'package:recipe_app/features/recipe/presentation/bloc/meal_detail_state.dart';

class MealDetailBloc extends Bloc<MealDetailEvent, MealDetailState> {
  final GetMealByIdUseCase _getMealByIdUseCase;

  MealDetailBloc(this._getMealByIdUseCase) : super(MealDetailInitial()) {
    on<LoadMealDetail>(_onLoadMealDetail);
  }

  Future<void> _onLoadMealDetail(
    LoadMealDetail event,
    Emitter<MealDetailState> emit,
  ) async {
    emit(MealDetailLoading());

    try {
      final meal = await _getMealByIdUseCase(event.mealId);
      emit(MealDetailLoaded(meal));
    } catch (e) {
      emit(MealDetailError(e.toString()));
    }
  }
}
