import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';

class JobSummery extends StatelessWidget {
  final JobModel job;
  const JobSummery({
    super.key,
    required this.job
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.summeryIcon,),
            Text("Job Summery", style: style.bodyLarge?.copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
        Divider(color: AppColors.headlineTextColor2.withValues(alpha: 0.1), height: 25.h,),
        Row(
          children: [
            Text("Price:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text("\$${job.price}(${job.bargainStatus})", style: style.bodyMedium?.copyWith(color: AppColors.redTextColor),),
          ],
        ),
        Row(
          children: [
            Text("Category:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(job.type, style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
          ],
        ),
        Row(
          children: [
            Text("Start Time:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(DateFormat("dd MMM, hh:mm a").format(job.startTime), style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
          ],
        ),
        Row(
          children: [
            Text("End Time:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(DateFormat("dd MMM, hh:mm a").format(job.endTime), style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
          ],
        ),
        Row(
          children: [
            Text("Location:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(jobs[0].location, style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
          ],
        ),
        SizedBox(height: 32.h,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.greenTextColor.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Text("If the job takes longer than expected, the payment will be adjusted according to the hourly rate.",
              style: style.bodyMedium?.copyWith(color: AppColors.greenTextColor,), textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}






