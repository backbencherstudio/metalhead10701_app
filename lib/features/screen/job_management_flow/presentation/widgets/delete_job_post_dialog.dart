import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

void onDeleteJobPostTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return Dialog(
        backgroundColor: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64.h,
                width: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColors.bgColor9.withAlpha(30),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: SvgPicture.asset(
                    AppIcons.trashSvg,
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.center,
                "Are you want\nto Delete this job?",
                style: style.bodyLarge?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      width: 136,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      containerColor: AppColors.bgTransparent,
                      textColor: AppColors.greyTextColor,
                      borderColor: AppColors.greyTextColor,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: CustomButton(
                      text: 'Confirm',
                      width: 136,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      textColor: AppColors.whiteTextColor,
                      containerColor: AppColors.bgColor9,
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
