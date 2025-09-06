import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? containerColor;
  final Color? borderColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  CustomButton({
    required this.text,
    this.containerColor,
    this.borderColor,
    this.textColor,
    this.padding,
    this.textStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          color: containerColor ?? Colors.blue,  // Default container color
          border: Border.all(
            color: borderColor ?? Colors.transparent,  // Default to transparent if no border color is provided
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: 14.h,
                  horizontal: 24.w,
                ),
            child: Text(
              text,
              style: textStyle ??
                  TextStyle(
                    fontSize: 16.sp,  // Default font size
                    color: textColor ?? Colors.white,  // Default text color
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
