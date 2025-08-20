import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app/features/profile/presentation/pages/profile_page.dart';
import 'package:recipe_app/features/saved_recipes/presentation/pages/saved_page.dart';
import 'package:recipe_app/features/search/presentation/pages/search_page.dart';
import '../../core/constants/app_colors.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, CupertinoIcons.house, 'Home', context),
              _buildNavItem(1, CupertinoIcons.search, 'Search', context),
              _buildAddButton(),
              _buildNavItem(3, CupertinoIcons.bookmark, 'Saved', context),
              _buildNavItem(4, CupertinoIcons.person, 'Profile', context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    String label,
    BuildContext context,
  ) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              switch (index) {
                case 0:
                  return HomePage();
                case 1:
                  return SearchPage();
                case 3:
                  return SavedPage();
                case 4:
                  return ProfilePage();
                default:
                  return HomePage();
              }
            },
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary : Colors.grey,
            size: 24.r,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Icon(Icons.add, color: Colors.white, size: 28.r),
    );
  }
}
