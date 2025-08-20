import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final Widget? icon;
  final bool isOutlined;
  final bool iconLeft;
  final bool isBold;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.isOutlined = false,
    this.iconLeft = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined
              ? Colors.transparent
              : (backgroundColor ?? AppColors.primary),
          foregroundColor:
              textColor ?? (isOutlined ? AppColors.primary : Colors.white),
          side: isOutlined
              ? BorderSide(color: AppColors.primary, width: 2.w)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          //    elevation: isOutlined ? 0 : 2,
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && iconLeft) ...[icon!, SizedBox(width: 8.w)],
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              ),
            ),

            if (icon != null && !iconLeft) ...[SizedBox(width: 8.w), icon!],
          ],
        ),
      ),
    );
  }
}
