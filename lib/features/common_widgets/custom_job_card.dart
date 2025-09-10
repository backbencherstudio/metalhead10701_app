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
    final timeFormat1 = DateFormat('dd MMM, hh:mm');
    final timeFormat2 = DateFormat('hh:mm a');
    final startTime = timeFormat1.format(job.startTime);
    final endTime = timeFormat2.format(job.endTime);
    return Container(
      padding: EdgeInsets.all(16.r),
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: (job.urgency != null) ? AppColors.jobCardBorderColor : AppColors.borderColor),
        color: (job.urgency != null) ? AppColors.jobCardBorderColor.withValues(alpha: 0.05) : (AppColors.bgColor4)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(job.name,
            style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h,),
          //Text("\$${job.price} | ${job.type} | ${job.bargainStatus}"),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$${job.price} ",
                  style: style.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextSpan(
                  text: "| ${job.type} | ${job.bargainStatus}",
                  style: style.bodyMedium?.copyWith(
                      color: AppColors.greyTextColor
                  ),
                )
              ]
            ),
          ),
          SizedBox(height: 12.h,),
          (job.urgency != null) ? Text("Urgency: ${job.urgency}") : const SizedBox(),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Icon(Icons.watch_later_outlined, color: AppColors.greyTextColor),
              Text("$startTime - $endTime", style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor
              ),),
            ],
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.greyTextColor,),
              Text(job.location, style: style.bodyMedium?.copyWith(
                  color: AppColors.greyTextColor
              ),),
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                text: "Counter Offer",
                containerColor: AppColors.bgColor4,
                borderColor: AppColors.bgColor1,
                textColor: AppColors.bgColor1,
                width: 160.w,
                onPressed: (){

                },
              ),
              CustomButton(
                text: 'Accept',
                containerColor: AppColors.bgColor1,
                textColor: AppColors.onPrimary,
                isBig: false,
                width: 110.w,
                onPressed: () {
                  // LOGIC
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
