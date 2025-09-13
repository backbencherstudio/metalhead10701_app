import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/after_accept_counter_offer/presentation/widgets/custom_job_title.dart';
import 'package:metal_head/features/screen/after_accept_counter_offer/presentation/widgets/job_summary.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

class AfterAcceptCounterOffer extends StatefulWidget {
  const AfterAcceptCounterOffer({super.key});

  @override
  State<AfterAcceptCounterOffer> createState() =>
      _AfterAcceptCounterOfferState();
}

class _AfterAcceptCounterOfferState extends State<AfterAcceptCounterOffer> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  SvgPicture.asset(AppIcons.menuSvg, height: 28.h, width: 28.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Congratulations, your\ncounter offer has been accepted!',
                      style: style.headlineSmall?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "You’ve secured this job. Please review the details below and be ready at the scheduled time.",
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    CustomJobTitle(style: style),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12),
                    Text(
                      'Help Move Couch and Dining Table',
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    JobSummary(style: style),
                    SizedBox(height: 16.h),
                    CustomJobTitle(
                      icon: SvgPicture.asset(
                        AppIcons.descriptionIcon,
                        height: 24,
                        width: 24,
                      ),
                      title: 'Job Description',
                      style: style,
                    ),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12.h),
                    Text(
                      'The job involves moving a large couch and dining table from one room to another. The move should be done carefully to avoid damage to walls and furniture. Assistance with lifting and arranging the furniture is needed.',
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.greyTextColor2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    CustomJobTitle(
                      icon: SvgPicture.asset(
                        AppIcons.noteIcon,
                        height: 24,
                        width: 24,
                      ),
                      title: 'Notes',
                      style: style,
                    ),
                    Divider(height: 1.h, color: AppColors.borderColor),
                    SizedBox(height: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• ',
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Be on time. If you need to reschedule, contact the poster in advance.",
                                style: style.bodyMedium?.copyWith(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• ',
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Payment will be processed once the job is marked as completed and confirmed by the poster.",
                                style: style.bodyMedium?.copyWith(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: 'Message Poster',
                                  borderColor: AppColors.bgColor1,
                                  width: 161.w,
                                  padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
                                  textStyle: style.bodySmall?.copyWith(
                                    color: AppColors.bgColor1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  containerColor: AppColors.bgTransparent,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: CustomButton(
                                  text: 'Mark as Started',
                                  width: 161.w,
                                  padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 12.h),
                                  textStyle: style.bodySmall?.copyWith(
                                    color: AppColors.whiteTextColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
