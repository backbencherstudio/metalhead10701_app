import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/common_custom_header.dart';
import 'package:metal_head/features/screen/dashboard_flow/common/job_details_screen/presentation/widget/contact_info.dart';
import 'package:metal_head/features/screen/dashboard_flow/common/job_details_screen/presentation/widget/important_notes.dart';
import 'package:metal_head/features/screen/dashboard_flow/common/job_details_screen/presentation/widget/job_description.dart';
import 'package:metal_head/features/screen/dashboard_flow/common/job_details_screen/presentation/widget/job_requirements.dart';
import 'package:metal_head/features/screen/dashboard_flow/common/job_details_screen/presentation/widget/job_summery.dart';
import 'package:metal_head/features/screen/dashboard_flow/common/job_details_screen/presentation/widget/photo_section.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import '../../../../auth_flow/splash/presentation/widgets/custom_button.dart';
import '../data/provider/selectedJobProvider.dart';

class JobDetailsScreen extends ConsumerWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final currentJob = ref.watch(selectedJob) ?? jobs[0];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              CommonCustomHeader(title: "Job Details",),
              SizedBox(height: 24.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.jobCardColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Text(currentJob.name, style: style.headlineSmall,),
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.greyTextColor.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16.r)
                    ),
                    child: Text("job ID: ${currentJob.id}", style: style.bodySmall,),
                  ),
                  SizedBox(width: 8.w,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                        color: AppColors.statusContainerColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16.r)
                    ),
                    child: Text(currentJob.status, style: style.bodySmall?.copyWith(color: AppColors.statusContainerColor),),
                  ),
                ],
              ),
              SizedBox(height: 44.h,),
              JobSummery(job: currentJob),
              SizedBox(height: 32.h,),
              JobDescription(job: currentJob,),
              SizedBox(height: 32.h,),
              ContactInfo(job: currentJob,),
              SizedBox(height: 32.h,),
              JobRequirements(job: currentJob,),
              SizedBox(height: 32.h,),
              ImportantNotes(job: currentJob,),
              SizedBox(height: 32.h,),
              PhotoSection(job: currentJob,),
              SizedBox(height: 100.h,)
            ],
          ),
        ),
      ),

      bottomSheet: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteTextColor,
          borderRadius: BorderRadius.zero
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                padding: EdgeInsets.all(12.r),
                width: 165.w,
                text: "Counter Offer",
                textStyle: style.bodySmall?.copyWith(color: AppColors.bgColor1, fontWeight: FontWeight.bold),
                containerColor: AppColors.bgColor4,
                borderColor: AppColors.bgColor1,
                textColor: AppColors.bgColor1,
                onPressed: (){

                },
              ),
              CustomButton(
                padding: EdgeInsets.all(12.r),
                width: 165.w,
                text: 'Accept',
                textStyle: style.bodySmall?.copyWith(color: AppColors.bgColor4, fontWeight: FontWeight.bold),
                containerColor: AppColors.bgColor1,
                textColor: AppColors.onPrimary,
                isBig: false,
                onPressed: () {
                  // LOGIC
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
