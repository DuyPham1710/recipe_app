import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/category_model.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final Dio _dio = DioClient.instance;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await _dio.get(ApiEndpoints.categories);

      if (response.statusCode == 200) {
        final categoriesResponse = CategoriesResponse.fromJson(response.data);
        return categoriesResponse.categories
            .map(
              (category) => CategoryEntity(
                id: category.idCategory,
                name: category.strCategory,
                thumbnail: category.strCategoryThumb,
                description: category.strCategoryDescription,
              ),
            )
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
