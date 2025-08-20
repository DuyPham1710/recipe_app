import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/recipe/presentation/pages/recipe_detail_page.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RecipeDetailPage(meal: meal)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 160.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 160.h,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Icon(Icons.restaurant, color: Colors.grey[600]),
                      );
                    },
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(CupertinoIcons.heart_fill, color: Colors.red),
                ),
              ],
            ),

            // Thông tin sản phẩm
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'By Little Pony',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '20m',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
