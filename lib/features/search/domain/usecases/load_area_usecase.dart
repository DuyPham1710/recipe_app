import 'package:recipe_app/features/search/domain/repository/filter_repository.dart';

class LoadAreaUsecase {
  final FilterRepository _filterRepository;

  LoadAreaUsecase(this._filterRepository);

  Future<List<String>> call() async {
    return await _filterRepository.getAreas();
  }
}
