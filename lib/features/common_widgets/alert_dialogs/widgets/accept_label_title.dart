import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';

class AcceptLabelTitle extends StatelessWidget {
  const AcceptLabelTitle({
    super.key,
    required this.style,
    this.title,
    this.description,
  });

  final TextTheme style;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              title ?? 'title',
              style: style.bodySmall?.copyWith(
                color: AppColors.headlineTextColor,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              description ?? 'description',
              style: style.bodySmall?.copyWith(color: AppColors.greyTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
