import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';

import '../../core/theme/theme_extension/app_colors.dart';

class CustomJobCard extends StatelessWidget {
  final JobModel job;
  const CustomJobCard({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final timeFormat = DateFormat('DD, MMM, hh:mm a');
    final startTime = timeFormat.format(job.startTime);
    final endTime = timeFormat.format(job.endTime);
    return Container(
      width: 328.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: AppColors.jobCardBorderColor),
        gradient: LinearGradient(colors: [
          AppColors.jobCardBorderColor,
          AppColors.whiteTextColor
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        )
      ),
      child: Column(
        children: [
          Text(job.name, style: style.bodyMedium,),
          Text("\$${job.price} | ${job.type} | ${job.bargainStatus}"),
          Text("Urgency: ${job.urgency}"),
          Row(
            children: [
              Icon(Icons.watch_later_outlined),
              Text("$startTime - $endTime"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text(job.location),
            ],
          ),

          CustomButton(
            text: "Counter Offer",

          )
        ],
      ),
    );
  }
}
