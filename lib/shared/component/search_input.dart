import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/constants/app_colors.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String hintText;
  final bool autoFocus;

  const SearchInput({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText = "Tìm kiếm sản phẩm",
    this.autoFocus = false,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  Timer? _debounceTimer;

  void _onChanged(String value) {
    // Debounce để tránh gọi API quá nhiều
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged?.call(value);
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 38.h,
        child: TextField(
          controller: widget.controller,
          autofocus: widget.autoFocus,
          onChanged: _onChanged,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 12.w,
            ),
            fillColor: AppColors.searchColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
