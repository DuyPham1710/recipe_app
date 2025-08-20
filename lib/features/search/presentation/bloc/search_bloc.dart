import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/search/domain/usecases/search_meal_usecase.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_event.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMealUseCase _searchMealUseCase;

  SearchBloc(this._searchMealUseCase) : super(SearchInitial()) {
    on<SearchMeals>(_onSearchMeals);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchMeals(
    SearchMeals event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final meals = await _searchMealUseCase(event.query);

      if (meals.isEmpty) {
        emit(SearchEmpty(event.query));
      } else {
        emit(SearchLoaded(meals, event.query));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }
}
