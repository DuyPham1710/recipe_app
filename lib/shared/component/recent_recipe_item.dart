import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentRecipeItem extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String authorImage;

  const RecentRecipeItem({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.authorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              image,
              width: 150.w,
              height: 160.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: Colors.brown,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 4.h),

          // Avatar + tên tác giả
          Row(
            children: [
              CircleAvatar(
                radius: 10.r,
                backgroundImage: AssetImage(authorImage),
              ),

              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  author,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF0043B3),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
