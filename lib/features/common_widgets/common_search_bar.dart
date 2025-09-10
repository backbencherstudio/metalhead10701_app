import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constant/icons.dart';
import '../../core/theme/theme_extension/app_colors.dart';

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style.bodyMedium?.copyWith(color: AppColors.headlineTextColor),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 8.w),
          child: SvgPicture.asset(
            AppIcons.searchSvg,
            height: 24.h,
            width: 24.w,
          ),
        ),
        prefixIconColor: AppColors.greyTextColor,
        hintText: 'Start typing',
      ),
    );
  }
}