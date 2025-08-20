import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import '../../core/constants/app_colors.dart';
import '../../shared/services/favorite_service.dart';

class RecipeCard extends StatefulWidget {
  final MealEntity meal;
  final String author;
  final String? time;
  final String? rating;
  final VoidCallback? onTap;
  final VoidCallback? onLike;

  const RecipeCard({
    super.key,
    required this.meal,
    required this.author,
    this.time,
    this.rating,
    this.onTap,
    this.onLike,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final isFavorite = await FavoriteService.isFavorite(widget.meal.id);
    if (mounted) {
      setState(() {
        _isFavorite = isFavorite;
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

    widget.onLike?.call();
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;
    final onTap = widget.onTap;
    final rating = widget.rating;
    final author = widget.author;
    final time = widget.time;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 170.h,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 170.h,
                        color: Colors.grey[300],
                        child: Icon(Icons.restaurant, color: Colors.grey[600]),
                      );
                    },
                  ),
                ),

                if (rating != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.rating,
                        borderRadius: BorderRadius.circular(6.r),
                      ),

                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 14.sp),
                          SizedBox(width: 2.w),
                          Text(
                            rating,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Icon play
                Positioned.fill(
                  child: Center(
                    child: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: Colors.grey.withOpacity(0.8),
                      child: Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (time != null)
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  GestureDetector(
                    onTap: _toggleFavorite,
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? Colors.red : Colors.black87,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12.r,
                        backgroundImage: AssetImage('assets/images/avt.jpg'),
                      ),

                      SizedBox(width: 8.w),

                      Expanded(
                        child: Text(
                          author,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
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
