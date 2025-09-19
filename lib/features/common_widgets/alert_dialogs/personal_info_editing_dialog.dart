import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

void onPersonalInfoEditingTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64.h,
                width: 64.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColors.bgColor5.withAlpha(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    AppIcons.pencilEditSvg,
                    height: 32.h,
                    width: 32.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.bgColor5,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.center,
                "Discard changes?",
                style: style.bodyLarge?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                textAlign: TextAlign.center,
                'Unsaved changes will be lost.',
                style: style.bodyMedium?.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Yes, discard',
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    textColor: AppColors.whiteTextColor,
                    containerColor: AppColors.bgColor7,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(); // Dismiss dialog first
                      context.go(RouteName.profileScreen); // Then navigate
                    },
                  ),
                  SizedBox(height: 5.w),
                  CustomButton(
                    text: 'No, keep',
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    containerColor: AppColors.bgTransparent,
                    textColor: AppColors.greyTextColor,
                    borderColor: AppColors.greyTextColor,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
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
