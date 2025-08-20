import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/presentation/bloc/meal_bloc.dart';
import 'package:recipe_app/features/home/presentation/bloc/meal_state.dart';
import 'package:recipe_app/shared/component/category_item.dart';

class MealsListWidget extends StatelessWidget {
  final String category;

  const MealsListWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      builder: (context, state) {
        if (state is MealLoading) {
          return SizedBox(
            height: 260.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is MealLoaded) {
          if (state.meals.isEmpty) {
            return SizedBox(
              height: 260.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 48.r,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Không có món ăn nào cho danh mục này',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return SizedBox(
            height: 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.meals.length,
              itemBuilder: (context, index) {
                final meal = state.meals[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: index < state.meals.length - 1 ? 16.w : 0,
                  ),
                  child: CategoryItem(
                    image: meal.imageUrl,
                    title: meal.name,
                    author: "Trần Đình Trọng", // API không cung cấp author
                    time: "30 phút", // API không cung cấp thời gian
                  ),
                );
              },
            ),
          );
        } else if (state is MealError) {
          return SizedBox(
            height: 260.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48.r, color: Colors.red),
                  SizedBox(height: 8.h),
                  Text(
                    'Lỗi: ${state.message}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
