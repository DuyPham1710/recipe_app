import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/features/search/presentation/pages/search_result_page.dart';
import 'package:recipe_app/shared/component/search_input.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> suggestions = [
    "Pizza hến xào",
    "Pipi đút lò",
    "Pizza thơm",
    "Pizza hải sản",
    "Pizza thịt xông khói",
  ];
  List<String> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = suggestions;
  }

  void _onSearchChanged(String value) {
    setState(() {
      filtered = suggestions
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent, // nhận sự kiện tap cả vùng trống
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: SafeArea(
          child: Column(
            children: [
              // Thanh search
              SearchInput(
                controller: _controller,
                autoFocus: true,
                onChanged: _onSearchChanged,
                onSubmitted: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchResultPage(query: value),
                    ),
                  );
                },
              ),
              // Danh sách kết quả
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(filtered[index]),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: AppColors.primary,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                SearchResultPage(query: filtered[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
