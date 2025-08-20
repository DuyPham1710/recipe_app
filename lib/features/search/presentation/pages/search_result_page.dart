import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/features/search/presentation/widgets/modal_filter.dart';
import 'package:recipe_app/features/search/presentation/widgets/search_result_item.dart';
import 'package:recipe_app/shared/component/index.dart';
import 'package:recipe_app/shared/component/search_input.dart';

class SearchResultPage extends StatelessWidget {
  final String query;

  const SearchResultPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    // dữ liệu giả để demo UI
    final results = List.generate(
      6,
      (index) => {
        "title": "Salad bò kiểu Thái",
        "author": "By Little Pony",
        "time": "20m",
        "image":
            "https://www.themealdb.com/images/media/meals/quuxsx1511476154.jpg",
      },
    );

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: Column(
          children: [
            // Thanh search + filter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: SearchInput(
                      controller: controller,

                      //  onChanged: _onSearchChanged,
                      onSubmitted: (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchResultPage(query: value),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 8.h),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return ModalFilter();
                        },
                      );
                    },
                    child: Icon(
                      Icons.filter_alt_rounded,
                      color: AppColors.primary,
                      size: 30.r,
                    ),
                  ),
                ],
              ),
            ),

            // Kết quả tìm kiếm
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = results[index];
                  return SearchResultItem(item: item);
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }
}
