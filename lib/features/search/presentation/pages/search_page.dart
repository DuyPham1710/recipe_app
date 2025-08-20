import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_event.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_state.dart';
import 'package:recipe_app/features/search/presentation/pages/search_result_page.dart';
import 'package:recipe_app/shared/component/search_input.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/recipe/presentation/pages/recipe_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  void _onSearchChanged(String value) {
    if (value.trim().isNotEmpty) {
      context.read<SearchBloc>().add(SearchMeals(value));
    } else {
      context.read<SearchBloc>().add(ClearSearch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: SafeArea(
          child: Column(
            children: [
              // Thanh search
              SearchInput(
                controller: _controller,
                autoFocus: true,
                onChanged: _onSearchChanged,
                onSubmitted: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchResultPage(query: value),
                    ),
                  );
                },
              ),
              // Danh sách kết quả
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      return const Center(
                        child: Text('Nhập từ khóa để tìm kiếm'),
                      );
                    } else if (state is SearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoaded) {
                      return _buildSearchResults(state.meals);
                    } else if (state is SearchEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 48.sp,
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Không tìm thấy món ăn nào cho "${state.query}"',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48.sp,
                              color: Colors.red,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Lỗi: ${state.message}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.red,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<MealEntity> meals) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              meal.imageUrl,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 50.w,
                  height: 50.w,
                  color: Colors.grey[300],
                  child: Icon(Icons.restaurant, color: Colors.grey[600]),
                );
              },
            ),
          ),
          title: Text(
            meal.name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            meal.category ?? 'Không có danh mục',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
          trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RecipeDetailPage(meal: meal)),
            );
          },
        );
      },
    );
  }
}
