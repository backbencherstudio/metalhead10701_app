import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';

class JobRequirements extends StatelessWidget {
  final JobModel job;
  const JobRequirements({
    super.key,
    required this.job
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.requirementIcon,),
            Text("Job Requirements", style: style.bodyLarge?.copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
        Divider(color: AppColors.headlineTextColor2.withValues(alpha: 0.1), height: 25.h,),
        Text("Experience Needed:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
        Text(job.experience ??
            "Previous experience with furniture moving preferred. Must be able to lift heavy objects and maneuver furniture through tight spaces.",
          style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
        SizedBox(height: 12.h,),
        Text("Tools Needed:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
        Text(job.tools ??
            "Moving straps or dollies (if available), Gloves for protection",
          style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
        SizedBox(height: 12.h,),
        Text("Special Instructions:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
        Text(job.instruction ??
            "The couch may need to be disassembled for easier transportation through the hallway. Please ensure that the dining table is properly padded during the move to avoid scratches.",
          style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
        SizedBox(height: 40.h,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.yellowTextColor.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Text("No counter offers made yet. You can make a counter offer at any time before accepting.",
              style: style.bodyMedium?.copyWith(color: AppColors.yellowTextColor,), textAlign: TextAlign.center,),
          ),
        )
      ],
    );
  }
}