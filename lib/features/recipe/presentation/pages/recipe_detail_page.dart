import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/core/constants/app_strings.dart';
import 'package:recipe_app/features/home/domain/index.dart';
import 'package:recipe_app/features/home/data/repositories/index.dart';
import 'package:recipe_app/features/recipe/presentation/bloc/meal_detail_event.dart';
import 'package:recipe_app/features/recipe/presentation/bloc/meal_detail_state.dart';
import 'package:recipe_app/features/recipe/presentation/widgets/recipe_info.dart';
import 'package:recipe_app/features/recipe/presentation/bloc/meal_detail_bloc.dart';
import 'package:recipe_app/features/recipe/presentation/widgets/recipe_tab.dart';
import 'package:recipe_app/shared/component/index.dart';

class RecipeDetailPage extends StatefulWidget {
  final MealEntity meal;
  const RecipeDetailPage({super.key, required this.meal});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    // Wrap với BlocProvider để cung cấp MealDetailBloc
    return BlocProvider(
      create: (context) =>
          MealDetailBloc(GetMealByIdUseCase(MealRepositoryImpl())),
      child: BlocListener<MealDetailBloc, MealDetailState>(
        listener: (context, state) {
          // trigger BlocListener
        },
        child: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<MealDetailBloc>().add(
                LoadMealDetail(widget.meal.id),
              );
            });

            return _buildRecipeDetailContent(meal);
          },
        ),
      ),
    );
  }

  Widget _buildRecipeDetailContent(MealEntity meal) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: BlocBuilder<MealDetailBloc, MealDetailState>(
          builder: (context, detailState) {
            final currentMeal = detailState is MealDetailLoaded
                ? detailState.meal
                : meal;

            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      if (currentMeal.imageUrl.isNotEmpty)
                        Image.network(
                          currentMeal.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 260.h,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 260.h,
                              color: Colors.grey.shade300,
                              child: Icon(
                                Icons.restaurant,
                                size: 60.sp,
                                color: Colors.grey.shade600,
                              ),
                            );
                          },
                        )
                      else
                        Container(
                          width: double.infinity,
                          height: 260.h,
                          color: Colors.grey.shade300,
                          child: Icon(
                            Icons.restaurant,
                            size: 60.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),

                      SizedBox(
                        height: 100.h,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (_, __) => SizedBox(width: 12.w),
                          itemBuilder: (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: SizedBox(
                              width: 60.w,
                              height: 60.w,
                              child: Image.asset(
                                "assets/images/recipe_cart.jpg",
                                width: 40.w,
                                height: 40.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),

                      RecipeInfo(meal: currentMeal),

                      SizedBox(height: 20.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Divider(color: AppColors.primary),
                      ),

                      // Tab Nguyên liệu - Chế biến
                      RecipeTab(meal: currentMeal),

                      SizedBox(height: 24.h),

                      // Nút xem video chỉ hiển thị khi có YouTube URL
                      if (currentMeal.youtube != null &&
                          currentMeal.youtube!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CustomButton(
                            text: AppStrings.watchVideo,
                            onPressed: () {
                              // Dùng url_launcher để mở YouTube
                              print('YouTube URL: ${currentMeal.youtube}');
                            },
                            width: double.infinity,
                            backgroundColor: Color(0xFFf8f2d9),
                            textColor: AppColors.primary,
                            icon: Icon(
                              CupertinoIcons.play_rectangle,
                              color: AppColors.primary,
                              size: 24.sp,
                            ),
                            iconLeft: true,
                            isBold: true,
                          ),
                        ),
                      SizedBox(height: 24.h),
                    ],
                  ),

                  Positioned(
                    top: 30.h,
                    left: 10.w,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(CupertinoIcons.back, color: Colors.white),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          AppStrings.details,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
