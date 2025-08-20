import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/core/constants/app_strings.dart';
import 'package:recipe_app/core/utils/helper.dart';
import 'package:recipe_app/features/home/domain/entities/meal_entity.dart';
import 'package:recipe_app/shared/component/index.dart';

class RecipeTab extends StatefulWidget {
  final MealEntity meal;
  const RecipeTab({super.key, required this.meal});

  @override
  State<RecipeTab> createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: AppStrings.ingredients,
                  onPressed: () => setState(() => _selectedTab = 0),
                  backgroundColor: _selectedTab == 0
                      ? AppColors.primary
                      : AppColors.grey,
                  textColor: _selectedTab == 0
                      ? AppColors.grey
                      : AppColors.primary,
                ),
              ),

              Expanded(
                child: CustomButton(
                  text: AppStrings.preparation,
                  onPressed: () => setState(() => _selectedTab = 1),
                  backgroundColor: _selectedTab == 1
                      ? AppColors.primary
                      : AppColors.grey,
                  textColor: _selectedTab == 1
                      ? AppColors.grey
                      : AppColors.primary,
                ),
              ),
            ],
          ),
        ),

        // Nội dung theo tab
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: AppColors.grey,
          ),
          child: _selectedTab == 0
              ? _buildIngredientsTab()
              : _buildInstructionsTab(),
        ),
      ],
    );
  }

  Widget _buildIngredientsTab() {
    if (widget.meal.ingredients.isEmpty) {
      return Center(
        child: Text(
          'Không có thông tin nguyên liệu',
          style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.meal.category != null)
          _buildInfoRow('Danh mục:', widget.meal.category!),
        if (widget.meal.area != null)
          _buildInfoRow('Khu vực:', widget.meal.area!),

        const SizedBox(height: 16),

        Text(
          "${AppStrings.ingredients}:",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 12),

        // Hiển thị ingredients với measures
        ...List.generate(widget.meal.ingredients.length, (index) {
          final ingredient = widget.meal.ingredients[index];
          final measure = index < widget.meal.measures.length
              ? widget.meal.measures[index]
              : '';

          return _buildIngredientItem(ingredient, measure);
        }),

        // Tags
        if (widget.meal.tags != null && widget.meal.tags!.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            "Tags:",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 8),

          Wrap(
            spacing: 8.w,
            children: widget.meal.tags!
                .split(',')
                .map(
                  (tag) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      tag.trim(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildInstructionsTab() {
    if (widget.meal.instructions == null || widget.meal.instructions!.isEmpty) {
      return Center(
        child: Text(
          'Không có hướng dẫn chế biến',
          style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
        ),
      );
    }

    final instructions = widget.meal.instructions!;
    final steps = Helper.parseInstructions(instructions);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cách chế biến:",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),

        // Hiển thị từng bước
        ...List.generate(
          steps.length,
          (index) => _buildStepItem("${index + 1}. ${steps[index]}"),
        ),
      ],
    );
  }

  // Danh mục với khu vực cho chi tiết
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(String ingredient, String measure) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              ingredient,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (measure.isNotEmpty) ...[
            const SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                measure,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStepItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp, color: Colors.black87, height: 1.5),
      ),
    );
  }
}
