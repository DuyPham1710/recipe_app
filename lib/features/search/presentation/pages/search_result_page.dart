import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/home/data/repositories/meal_repository_impl.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_event.dart';
import 'package:recipe_app/features/search/presentation/bloc/search_state.dart';
import 'package:recipe_app/features/search/domain/usecases/index.dart';
import 'package:recipe_app/features/search/presentation/widgets/modal_filter.dart';
import 'package:recipe_app/features/search/presentation/widgets/search_result_item.dart';
import 'package:recipe_app/shared/component/search_input.dart';

class SearchResultPage extends StatefulWidget {
  final String query;
  const SearchResultPage({super.key, required this.query});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  String? selectedCategory;
  String? selectedIngredient;
  String? selectedArea;
  List<MealEntity> filteredMeals = [];
  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocProvider(
      create: (context) =>
          SearchBloc(SearchMealUseCase(MealRepositoryImpl()))
            ..add(SearchMeals(widget.query)), // Tự động search khi vào trang
      child: Builder(
        builder: (context) {
          void onSearchChanged(String value) {
            if (value.trim().isNotEmpty) {
              context.read<SearchBloc>().add(SearchMeals(value));
            } else {
              context.read<SearchBloc>().add(ClearSearch());
            }
          }

          return Scaffold(
            backgroundColor: AppColors.grey,
            body: SafeArea(
              child: Column(
                children: [
                  // Thanh search + filter
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SearchInput(
                                controller: controller,
                                onChanged: onSearchChanged,
                                onSubmitted: (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          SearchResultPage(query: value),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(width: 8.h),

                            GestureDetector(
                              onTap: () async {
                                final result = await showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ModalFilter();
                                  },
                                );

                                if (result != null) {
                                  setState(() {
                                    selectedCategory = result['category'];
                                    selectedIngredient = result['ingredient'];
                                    selectedArea = result['area'];
                                    filteredMeals = result['meals'];
                                    isFiltered = true;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.filter_alt_rounded,
                                color: AppColors.primary,
                                size: 30.r,
                              ),
                            ),
                          ],
                        ),

                        // Hiển thị filter status
                        if (isFiltered) ...[
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_alt,
                                  size: 16.sp,
                                  color: AppColors.primary,
                                ),

                                SizedBox(width: 8.w),

                                Expanded(
                                  child: Text(
                                    _buildFilterText(),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _clearFilter,
                                  child: Icon(
                                    Icons.close,
                                    size: 16.sp,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Kết quả tìm kiếm
                  Expanded(child: _buildResults()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchResults(List<MealEntity> meals) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: meals.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final meal = meals[index];
        return SearchResultItem(meal: meal);
      },
    );
  }

  void _clearFilter() {
    setState(() {
      selectedCategory = null;
      selectedIngredient = null;
      selectedArea = null;
      filteredMeals = [];
      isFiltered = false;
    });
  }

  String _buildFilterText() {
    final filters = <String>[];
    if (selectedCategory != null) {
      filters.add('Category: $selectedCategory');
    }
    if (selectedIngredient != null) {
      filters.add('Ingredient: $selectedIngredient');
    }
    if (selectedArea != null) {
      filters.add('Area: $selectedArea');
    }
    return filters.join(' • ');
  }

  Widget _buildResults() {
    if (isFiltered) {
      if (filteredMeals.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.filter_alt_off, size: 48.sp, color: Colors.grey[400]),
              SizedBox(height: 16.h),
              Text(
                'Không tìm thấy món ăn nào với bộ lọc hiện tại',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }
      return _buildSearchResults(filteredMeals);
    }

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: Text('Nhập từ khóa để tìm kiếm'));
        } else if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchLoaded) {
          return _buildSearchResults(state.meals);
        } else if (state is SearchEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 48.sp, color: Colors.grey[400]),
                SizedBox(height: 16.h),
                Text(
                  'Không tìm thấy món ăn nào cho "${state.query}"',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
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
                Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                SizedBox(height: 16.h),
                Text('Lỗi: ${state.message}', textAlign: TextAlign.center),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
