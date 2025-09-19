import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

class JobSummary extends StatelessWidget {
  const JobSummary({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Job Status:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              'Confirmed',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greenTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Accepted Price:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              '\$45 (Fixed Price)',
              style: style.bodyMedium?.copyWith(
                color: AppColors.bgColor1,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Original Offer',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              '\$50 (Fixed Price)',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Date:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              '24th August',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Time:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              '02:00 PM - 04:00 PM',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Location:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              '1123 Maple Street, Maryland',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Estimated Time:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              '2 hours',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Row(
          children: [
            Text(
              'Job Poster:',
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 9.w),
            Text(
              'Josephine Towne',
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          textAlign: TextAlign.center,
          'View Helper Profile',
          style: style.bodyMedium?.copyWith(
            color: AppColors.bgColor1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
