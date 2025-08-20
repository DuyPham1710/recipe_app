import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/core/constants/app_strings.dart';
import 'package:recipe_app/shared/component/index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary, size: 24.r),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.personalPage,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.primary, size: 24.r),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 40.r,
              backgroundImage: AssetImage("assets/images/avt.jpg"),
            ),
            SizedBox(height: 8.h),
            Text(
              "Phạm Ngọc Duy",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            SizedBox(height: 16.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem("Bài viết", "100"),

                SizedBox(
                  width: 0,
                  height: 50.h,
                  child: VerticalDivider(
                    color: AppColors.textSecondary,
                    thickness: 1,
                  ),
                ),

                _buildStatItem("Người theo dõi", "100"),

                SizedBox(
                  width: 0,
                  height: 50.h,
                  child: VerticalDivider(
                    color: AppColors.textSecondary,
                    thickness: 1,
                  ),
                ),

                _buildStatItem("Theo dõi", "100"),
              ],
            ),
            SizedBox(height: 16.h),

            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: AppStrings.follow,
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  width: 120.w,
                  height: 40.h,
                ),

                SizedBox(width: 12.w),

                CustomButton(
                  text: AppStrings.message,
                  onPressed: () {},
                  backgroundColor: Color(0xFFF2ECD3),
                  textColor: AppColors.primary,
                  width: 120.w,
                  height: 40.h,
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Favorite title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.favoriteList,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 12.h),

            // Grid list
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9, // fake data
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    "assets/images/recipe_cart.jpg",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 4,
        onTap: (index) {
          // setState(() {
          //   _currentIndex = index;
          // });
        },
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
