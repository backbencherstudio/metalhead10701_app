import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';

class JobDescription extends StatelessWidget {
  final JobModel job;
  const JobDescription({
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
            SvgPicture.asset(AppIcons.descriptionIcon,),
            Text("Job Description", style: style.bodyLarge?.copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
        Divider(color: AppColors.headlineTextColor2.withValues(alpha: 0.1), height: 25.h,),
        Text(job.description ?? "The job involves moving a large couch and dining table from one room to another. The move should be done carefully to avoid damage to walls and furniture. Assistance with lifting and arranging the furniture is needed.",
          style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),)
      ],
    );
  }
}