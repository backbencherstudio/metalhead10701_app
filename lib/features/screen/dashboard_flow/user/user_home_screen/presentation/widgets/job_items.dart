import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../models/job_model.dart';

class JobItems extends StatelessWidget {
  const JobItems({super.key, required this.style, required this.job});

  final TextTheme style;
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgColor4,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(job.iconPath, height: 24.h, width: 24.w),
              SizedBox(width: 8.w),
              Text(
                job.jobTitle,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.blackHeadline,
                ),
              ),
            ],
          ),
          Text(
            job.totalJobs,
            style: style.bodySmall?.copyWith(
              color: AppColors.greyTextColor2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
