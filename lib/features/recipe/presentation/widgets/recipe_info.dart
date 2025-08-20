import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/domain/index.dart';

class RecipeInfo extends StatelessWidget {
  final MealEntity meal;
  const RecipeInfo({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                meal.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),

              Icon(Icons.favorite_border, color: Colors.grey, size: 20.sp),
            ],
          ),

          SizedBox(height: 4.h),

          Text(
            meal.category ?? "Chưa có danh mục",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
          ),

          SizedBox(height: 12.h),

          // Rating + tác giả
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                "4.2",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "| 120 đánh giá",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage("assets/images/avt.jpg"),
              ),
              SizedBox(width: 12.w),
              Text(
                "Phạm Ngọc Duy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
