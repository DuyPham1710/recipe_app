import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/home/domain/usecases/get_meal_by_location_usecase.dart';
import 'package:recipe_app/features/home/presentation/bloc/meal_event.dart';
import 'package:recipe_app/features/home/presentation/bloc/meal_state.dart';

class LocationMealBloc extends Bloc<MealEvent, MealState> {
  final GetMealByLocationUsecase _getMealByLocationUsecase;

  LocationMealBloc(this._getMealByLocationUsecase)
      : super(MealInitial()) {
    on<LoadMealsByLocation>(_onLoadMealsByLocation);
  }

  Future<void> _onLoadMealsByLocation(
    LoadMealsByLocation event,
    Emitter<MealState> emit,
  ) async {
    emit(MealLoading());
    try {
      final meals = await _getMealByLocationUsecase(event.location);
      emit(MealLoaded(meals));
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }
}
