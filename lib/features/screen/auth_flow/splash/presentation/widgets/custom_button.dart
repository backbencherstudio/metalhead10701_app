import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? containerColor;
  final Color? borderColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final bool? isBig;
  final double? width;
  final BorderRadius? radius;

  const CustomButton({
    super.key,
    required this.text,
    this.containerColor,
    this.borderColor,
    this.textColor,
    this.padding,
    this.textStyle,
    this.onPressed,
    this.isBig,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: (isBig ?? false) ? 327.w : width,
        decoration: BoxDecoration(
          color: containerColor ?? AppColors.bgColor1,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: radius ?? BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Padding(
            padding:
                padding ??
                EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
            child: Text(
              text,
              style:
                  textStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: textColor ?? AppColors.headlineTextColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
