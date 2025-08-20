import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/domain/index.dart';
import 'package:recipe_app/shared/services/favorite_service.dart';
import 'package:recipe_app/shared/services/save_service.dart';

class RecipeInfo extends StatefulWidget {
  final MealEntity meal;
  const RecipeInfo({super.key, required this.meal});

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  bool _isFavorite = false;
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
    _checkSavedStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final isFavorite = await FavoriteService.isFavorite(widget.meal.id);
    if (mounted) {
      setState(() {
        _isFavorite = isFavorite;
      });
    }
  }

  Future<void> _checkSavedStatus() async {
    final isSaved = await SaveService.isSaved(widget.meal.id);
    if (mounted) {
      setState(() {
        _isSaved = isSaved;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isFavorite) {
      await FavoriteService.removeFromFavorites(widget.meal.id);
    } else {
      await FavoriteService.addToFavorites(widget.meal);
    }

    if (mounted) {
      setState(() {
        _isFavorite = !_isFavorite;
      });
    }
  }

  Future<void> _toggleSaved() async {
    if (_isSaved) {
      await SaveService.removeFromSaved(widget.meal.id);
    } else {
      await SaveService.addToSaved(widget.meal);
    }

    if (mounted) {
      setState(() {
        _isSaved = !_isSaved;
      });
    }
  }

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
                widget.meal.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),

              GestureDetector(
                onTap: _toggleFavorite,
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : Colors.grey,
                  size: 20.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),

          Text(
            widget.meal.category ?? "Chưa có danh mục",
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

              Spacer(),

              GestureDetector(
                onTap: _toggleSaved,
                child: Icon(
                  _isSaved
                      ? CupertinoIcons.bookmark_fill
                      : CupertinoIcons.bookmark,
                  color: _isSaved ? Colors.blue : Colors.grey,
                  size: 20.sp,
                ),
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
