import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';

class ImportantNotes extends StatelessWidget {
  final JobModel job;
  const ImportantNotes({
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
            SvgPicture.asset(AppIcons.noteIcon,),
            Text("Important Notes", style: style.bodyLarge?.copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
        Divider(color: AppColors.headlineTextColor2.withValues(alpha: 0.1), height: 25.h,),
        Text(job.note ??
            "Please ensure all furniture is moved safely and with proper care to prevent injury or damage.",
          style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
      ],
    );
  }
}