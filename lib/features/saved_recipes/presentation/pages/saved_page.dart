import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/core/constants/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/features/recipe/presentation/pages/recipe_detail_page.dart';
import 'package:recipe_app/shared/component/index.dart';
import 'package:recipe_app/shared/services/save_service.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<MealEntity> savedMeals = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedMeals();
  }

  Future<void> _loadSavedMeals() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final favorites = await SaveService.getSaved();
      if (mounted) {
        setState(() {
          savedMeals = favorites;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
          AppStrings.recipes,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: AppStrings.video,
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  textColor: Colors.white,
                  width: 160.w,
                  height: 30.h,
                ),

                SizedBox(width: 12.w),

                CustomButton(
                  text: AppStrings.recipes,
                  onPressed: () {},
                  backgroundColor: Color(0xFFF2ECD3),
                  textColor: AppColors.primary,
                  width: 160.w,
                  height: 30.h,
                ),
              ],
            ),

            SizedBox(height: 30.h),

            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: savedMeals.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final meal = savedMeals[index];

                      return RecipeCard(
                        meal: meal,
                        author: "Đình Trọng Phú",
                        time: "1 tiếng 20 phút",
                        rating: "5",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetailPage(meal: meal),
                            ),
                          );
                        },
                        onLike: () {},
                      );
                    },
                  ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 3,
        onTap: (index) {
          // setState(() {
          //   _currentIndex = index;
          // });
        },
      ),
    );
  }
}
