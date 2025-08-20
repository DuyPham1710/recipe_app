import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/recipe/presentation/bloc/meal_detail_bloc.dart';
import 'core/constants/app_colors.dart';
import 'features/home/presentation/pages/onboarding_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/bloc/index.dart';
import 'features/home/data/repositories/index.dart';
import 'features/home/domain/usecases/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Recipe App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
            fontFamily: 'Roboto',
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider<CategoryBloc>(
                create: (context) => CategoryBloc(
                  GetCategoriesUseCase(CategoryRepositoryImpl()),
                ),
              ),
              BlocProvider<MealBloc>(
                create: (context) =>
                    MealBloc(GetMealsByCategoryUseCase(MealRepositoryImpl())),
              ),
              BlocProvider<LocationMealBloc>(
                create: (context) => LocationMealBloc(
                  GetMealByLocationUsecase(MealRepositoryImpl()),
                ),
              ),
              BlocProvider<MealDetailBloc>(
                create: (context) =>
                    MealDetailBloc(GetMealByIdUseCase(MealRepositoryImpl())),
              ),
            ],
            child: const OnboardingPage(),
          ),
          routes: {
            '/home': (context) => MultiBlocProvider(
              providers: [
                BlocProvider<CategoryBloc>(
                  create: (context) => CategoryBloc(
                    GetCategoriesUseCase(CategoryRepositoryImpl()),
                  ),
                ),
                BlocProvider<MealBloc>(
                  create: (context) =>
                      MealBloc(GetMealsByCategoryUseCase(MealRepositoryImpl())),
                ),
                BlocProvider<LocationMealBloc>(
                  create: (context) => LocationMealBloc(
                    GetMealByLocationUsecase(MealRepositoryImpl()),
                  ),
                ),
                BlocProvider<MealDetailBloc>(
                  create: (context) =>
                      MealDetailBloc(GetMealByIdUseCase(MealRepositoryImpl())),
                ),
              ],
              child: const HomePage(),
            ),
          },
        );
      },
    );
  }
}
