import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/home/domain/usecases/get_meal_by_id_usecase.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';

// Events
abstract class MealDetailEvent {}

class LoadMealDetail extends MealDetailEvent {
  final String mealId;
  LoadMealDetail(this.mealId);
}

// States
abstract class MealDetailState {}

class MealDetailInitial extends MealDetailState {}

class MealDetailLoading extends MealDetailState {}

class MealDetailLoaded extends MealDetailState {
  final MealEntity meal;
  MealDetailLoaded(this.meal);
}

class MealDetailError extends MealDetailState {
  final String message;
  MealDetailError(this.message);
}

// Bloc
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
