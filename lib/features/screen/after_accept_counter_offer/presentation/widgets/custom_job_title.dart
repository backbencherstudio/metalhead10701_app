import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

class CustomJobTitle extends StatelessWidget {
  const CustomJobTitle({super.key, required this.style, this.title, this.icon});

  final TextTheme style;
  final String? title;
  final SvgPicture? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      child: Row(
        children: [
          icon ??
              SvgPicture.asset(AppIcons.summeryIcon, height: 24.h, width: 24.w),
          SizedBox(width: 8.w),
          Text(
            title ?? "Job Summery",
            style: style.titleSmall?.copyWith(
              color: AppColors.headlineTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
