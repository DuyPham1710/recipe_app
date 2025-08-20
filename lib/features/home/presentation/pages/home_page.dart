import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/home/presentation/bloc/index.dart';
import 'package:recipe_app/features/search/presentation/pages/search_page.dart';
import 'package:recipe_app/shared/component/index.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String _selectedCategory = "Beef";

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(LoadCategories());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MealBloc>().add(
        LoadMealsByCategory(_selectedCategory.toLowerCase()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SearchPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0); // từ dưới
                                const end = Offset.zero; // đến vị trí gốc
                                const curve = Curves.ease;

                                final tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),

                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey, size: 20.r),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              AppStrings.searchProducts,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.location,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        AppStrings.seeAll,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),

                    SizedBox(
                      height: 280.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RecipeCard(
                            title: 'Món ăn đặc biệt',
                            author: 'Đinh Trọng Phúc',
                            time: '1 tiếng 20 phút',
                            rating: '5',
                            onTap: () {},
                            onLike: () {},
                          ),
                          SizedBox(width: 16.w),
                          RecipeCard(
                            title: 'Món ăn truyền thống',
                            author: 'Đinh Trọng Phúc',
                            time: '15-20 phút',
                            onTap: () {},
                            onLike: () {},
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.categories,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        Text(
                          AppStrings.seeAll,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, state) {
                        if (state is CategoryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CategoryLoaded) {
                          return Wrap(
                            spacing: 12.w,
                            runSpacing: 12.h,
                            children: state.categories
                                .map(
                                  (category) => CategoryButton(
                                    text: category.name,
                                    isSelected:
                                        _selectedCategory == category.name,
                                    onTap: () {
                                      setState(() {
                                        _selectedCategory = category.name;
                                      });
                                      print(
                                        'Selected category: ${category.name}',
                                      );
                                      context.read<MealBloc>().add(
                                        LoadMealsByCategory(
                                          category.name.toLowerCase(),
                                        ),
                                      );
                                    },
                                  ),
                                )
                                .toList(),
                          );
                        } else if (state is CategoryError) {
                          return Center(
                            child: Text(
                              'Error: ${state.message}',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Meals List
                    MealsListWidget(category: _selectedCategory),

                    Text(
                      AppStrings.recentRecipes,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    SizedBox(
                      height: 280.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RecentRecipeItem(
                            image: "assets/images/recipe_cart.jpg",
                            title: "Trứng chiên",
                            author: "Nguyễn Đình Trọng",
                            authorImage: "assets/images/avatar.png",
                          ),
                          RecentRecipeItem(
                            image: "assets/images/recipe_cart.jpg",
                            title: "Salad rau củ",
                            author: "Nguyễn Đình Trọng",
                            authorImage: "assets/images/avatar.png",
                          ),
                          RecentRecipeItem(
                            image: "assets/images/recipe_cart.jpg",
                            title: "Mì Ý sốt kem",
                            author: "Nguyễn Đình Trọng",
                            authorImage: "assets/images/avatar.png",
                          ),
                        ],
                      ),
                    ),

                    Text(
                      AppStrings.ingredients,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: 100.h), // Space for bottom navigation
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
