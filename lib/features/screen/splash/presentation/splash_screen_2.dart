import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/splash/presentation/widgets/custom_button.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.bgColor1, AppColors.bgColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcons.businessLogo,
                fit: BoxFit.cover,
                height: 250.h, // Adjust this height as per your requirement
              ),
            ),
          ),

          // Bottom Sheet with content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.r),
                  topRight: Radius.circular(32.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 22.h,
                  left: 16.w,
                  right: 16.w,
                  bottom: 48.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.bgColor1, AppColors.bgColor2],
                            ),
                          ),
                          child: SizedBox(height: 16.h, width: 16.w),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.bgColor1, AppColors.bgColor2],
                            ),
                          ),
                          child: SizedBox(height: 16.h, width: 16.w),
                        ),
                      ],
                    ),
                    SizedBox(height: 46.h),
                    Text(
                      'Request Help\nInstantly',
                      style: style.headlineLarge?.copyWith(
                        color: AppColors.headlineTextColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Need someone to move furniture, do yard work,\nor grab groceries? Post your request and set your price!',
                      style: style.bodySmall?.copyWith(
                        color: AppColors.greyTextColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 44.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Skip',
                          containerColor: AppColors.onPrimary,
                          borderColor: AppColors.bgColor1,
                          textColor: AppColors.bgColor1,
                          onPressed: () {
                            print("Skip Button Pressed!");
                          },
                        ),
                        SizedBox(width: 8.w),
                        CustomButton(
                          text: 'Next',
                          containerColor: AppColors.bgColor1,
                          textColor: Colors.white,
                          onPressed: () {
                            print("Next Button Pressed!");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
