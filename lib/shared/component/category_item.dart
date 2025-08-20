import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String time;

  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0),
      child: SizedBox(
        width: 160.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.categoryItem,
                borderRadius: BorderRadius.circular(12.r),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.brown,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    author == "TheMealDB"
                        ? "Nguồn: TheMealDB"
                        : "Tạo bởi\n$author",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 40.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time == "N/A" ? "Thời gian: N/A" : time,
                        style: TextStyle(fontSize: 12.sp, color: Colors.brown),
                      ),
                      Icon(
                        Icons.feed_outlined,
                        size: 18.sp,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              top: 0,
              left: (160 - 80) / 2,
              child: CircleAvatar(
                radius: 40.r,
                backgroundImage: image.startsWith('http')
                    ? NetworkImage(image)
                    : AssetImage(image) as ImageProvider,
                onBackgroundImageError: (exception, stackTrace) {
                  // Handle image loading error
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
