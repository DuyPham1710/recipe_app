import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/core/constants/app_strings.dart';
import 'package:recipe_app/shared/component/category_button.dart';
import 'package:recipe_app/features/search/presentation/bloc/filter_bloc.dart';
import 'package:recipe_app/features/search/data/repositories/filter_repository_impl.dart';
import 'package:recipe_app/features/search/domain/usecases/index.dart';

class ModalFilter extends StatefulWidget {
  const ModalFilter({super.key});

  @override
  State<ModalFilter> createState() => _ModalFilterState();
}

class _ModalFilterState extends State<ModalFilter> {
  String? selectedCategory;
  String? selectedIngredient;
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(
        LoadCategoryUsecase(FilterRepositoryImpl()),
        LoadAreaUsecase(FilterRepositoryImpl()),
        LoadIngredientUsecase(FilterRepositoryImpl()),
        FilterMealsUsecase(FilterRepositoryImpl()),
      )..add(LoadFilterData()),
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          if (state is FilterLoading) {
            return _buildLoadingModal();
          } else if (state is FilterError) {
            return _buildErrorModal(state.message);
          } else if (state is FilterLoaded) {
            return _buildFilterModal(state);
          }
          return _buildLoadingModal();
        },
      ),
    );
  }

  Widget _buildLoadingModal() {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildErrorModal(String error) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                SizedBox(height: 16.h),
                Text(
                  'Lỗi: $error',
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {
                    context.read<FilterBloc>().add(LoadFilterData());
                  },
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterModal(FilterLoaded state) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Container(
                width: 20.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    size: 26.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.filter,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = null;
                        selectedIngredient = null;
                        selectedLocation = null;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 14.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        AppStrings.reset,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Divider(),

              _buildSection(
                AppStrings.categories,
                Icons.list_alt,
                state.categories,
                selectedCategory,
                (val) {
                  setState(() => selectedCategory = val);
                },
              ),

              _buildSection(
                AppStrings.ingredients,
                Icons.restaurant_menu,
                state.ingredients,
                selectedIngredient,
                (val) {
                  setState(() => selectedIngredient = val);
                },
              ),

              _buildSection(
                AppStrings.area,
                Icons.location_on,
                state.areas,
                selectedLocation,
                (val) {
                  setState(() => selectedLocation = val);
                },
              ),

              SizedBox(height: 20.h),
              Divider(),

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () async {
                    // Apply filter
                    context.read<FilterBloc>().add(
                      ApplyFilter(
                        category: selectedCategory,
                        ingredient: selectedIngredient,
                        area: selectedLocation,
                      ),
                    );

                    // Chờ cho đến khi state là FilterApplied
                    final state = await context
                        .read<FilterBloc>()
                        .stream
                        .firstWhere((s) => s is FilterApplied);

                    Navigator.pop(context, {
                      'category': selectedCategory,
                      'ingredient': selectedIngredient,
                      'area': selectedLocation,
                      'meals': (state as FilterApplied).filteredMeals,
                    });
                  },
                  child: Text(
                    AppStrings.confirm,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(
    String title,
    IconData icon,
    List<String> items,
    String? selectedValue,
    Function(String) onSelected,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24.sp, color: Colors.black),
              SizedBox(width: 6.w),
              Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: items.map((item) {
              final isSelected = item == selectedValue;
              return GestureDetector(
                onTap: () => onSelected(item),
                child: CategoryButton(text: item, isSelected: isSelected),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
