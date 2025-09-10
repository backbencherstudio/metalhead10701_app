import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/theme_extension/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.style,
    this.showViewAll = true, // default true
  });

  final TextTheme style;
  final bool showViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Job Categories',
            style: style.bodyLarge?.copyWith(
              color: AppColors.headlineTextColor,
            ),
          ),
          if (showViewAll)
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: style.bodySmall?.copyWith(color: AppColors.bgColor1),
              ),
            ),
        ],
      ),
    );
  }
}

