import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/job_details_screen/data/provider/selectedJobProvider.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/job_details_screen/presentation/job_details_screen.dart';
import '../../core/routes/route_name.dart';
import '../../core/theme/theme_extension/app_colors.dart';

class CustomJobCard extends StatelessWidget {
  final JobModel job;
  const CustomJobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final timeFormat = DateFormat('dd MMM, hh:mm a');
    final startTime = timeFormat.format(job.startTime);
    final endTime = timeFormat.format(job.endTime);
    return Container(
      padding: EdgeInsets.all(16.r),
      width: 350.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.w,
          color: (job.urgency != null)
              ? AppColors.jobCardBorderColor
              : AppColors.borderColor,
        ),
        color: (job.urgency != null)
            ? AppColors.jobCardBorderColor.withValues(alpha: 0.05)
            : (AppColors.bgColor4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            job.name,
            style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\$${job.price} ",
                  style: style.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "| ${job.type} | ${job.bargainStatus}",
                  style: style.bodySmall?.copyWith(
                    color: AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          (job.urgency != null)
              ? Text("Urgency: ${job.urgency}", style: style.bodySmall)
              : const SizedBox(),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start Time",
                    style: style.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    startTime,
                    style: style.bodySmall?.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "End Time",
                    style: style.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    endTime,
                    style: style.bodySmall?.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: AppColors.greyTextColor),
              Text(
                job.location,
                style: style.bodySmall?.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Consumer(
            builder: (_, ref, _) {
              return Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    padding: EdgeInsets.all(12.r),
                    width: 135.w,
                    text: "Counter Offer",
                    textStyle: style.bodySmall?.copyWith(
                      color: AppColors.bgColor1,
                      fontWeight: FontWeight.bold,
                    ),
                    containerColor: AppColors.bgColor4,
                    borderColor: AppColors.bgColor1,
                    textColor: AppColors.bgColor1,
                    onPressed: () {
                      ref.read(selectedJob.notifier).state = job;
                      context.push(RouteName.jobDetailsScreen);
                    },
                  ),
                  CustomButton(
                    padding: EdgeInsets.all(12.r),
                    width: 135.w,
                    text: 'Accept',
                    textStyle: style.bodySmall?.copyWith(
                      color: AppColors.bgColor4,
                      fontWeight: FontWeight.bold,
                    ),
                    containerColor: AppColors.bgColor1,
                    textColor: AppColors.onPrimary,
                    isBig: false,
                    onPressed: () {
                      ref.read(selectedJob.notifier).state = job;
                      context.push(RouteName.jobDetailsScreen);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
