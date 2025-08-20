import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/home/presentation/bloc/category_event.dart';
import 'package:recipe_app/features/home/presentation/bloc/category_state.dart';
import '../../domain/usecases/get_categories_usecase.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  CategoryBloc(this._getCategoriesUseCase) : super(CategoryInitial()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());

    try {
      final categories = await _getCategoriesUseCase();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
