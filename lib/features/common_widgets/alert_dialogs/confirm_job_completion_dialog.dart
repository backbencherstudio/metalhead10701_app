import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

void onConfirmJobCompletionTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return Dialog(
        backgroundColor: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              Container(
                height: 64.h,
                width: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColors.bgColor5.withAlpha(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    AppIcons.alertSvg,
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.center,
                "Confirm Job Completion",
                style: style.bodyLarge?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(textAlign: TextAlign.justify,
                '“The helper has marked this job as completed. Please confirm if the work is done to your satisfaction. Confirming will immediately release the payment. If you don’t confirm within 24 hours, the job will auto-finish and payment will be released automatically.',style: style.bodyMedium?.copyWith(
                  color: AppColors.greyTextColor,
                  height: 1.5
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Cancel',
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    containerColor: AppColors.bgTransparent,
                    textStyle: style.bodySmall?.copyWith(
                      color: AppColors.greyTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    borderColor: AppColors.greyTextColor,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                  SizedBox(height: 5.w),
                  CustomButton(
                    text: 'Confirm & Release Payment',
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                   textStyle: style.bodySmall?.copyWith(
                     color: AppColors.whiteTextColor,
                     fontWeight: FontWeight.w500,
                   ),
                    containerColor: AppColors.bgColor7,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      );
    },
  );
}
