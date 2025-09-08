import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/splash/presentation/widgets/custom_button.dart';
import 'package:metal_head/features/screen/splash/provider/toggleProvider.dart';

class SplashScreen2 extends ConsumerWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextState = ref.watch(toggleNext);
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.bgColor1, AppColors.bgColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Positioned(
            top: 100.h,
            left: 35.w,
            child: SvgPicture.asset(
              (nextState == 0) ?
              AppIcons.welcoming :
              (nextState == 1) ?
              AppIcons.transferMoney :
              AppIcons.businessLogo,
              //fit: BoxFit.cover,
              height: 250.h, // Adjust this height as per your requirement
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (nextState != 2) ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgColor1,
                              borderRadius: BorderRadius.circular(100.r)
                          ),
                          child: SizedBox(height: 16.h, width: 16.w),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                            color: (nextState == 0) ? AppColors.bgColor3 : AppColors.bgColor1,
                            borderRadius: BorderRadius.circular(100.r)
                          ),
                          child: SizedBox(height: 16.h, width: 16.w),
                        ),
                      ],
                    ) : SizedBox(),
                    SizedBox(height: (nextState != 2) ? 46.h : 32.h),
                    Text(
                      (nextState == 0) ?
                      'Request Help\nInstantly' :
                      (nextState == 1) ?
                      'Get Matched with Helpers' :
                      'Welcome to, ',
                      style: style.headlineLarge?.copyWith(
                        color: AppColors.headlineTextColor,
                      ),
                    ),
                    (nextState == 2) ? Text(
                      'Helper',
                      style: style.headlineLarge?.copyWith(
                        color: AppColors.redTextColor,
                      ),
                    ) : SizedBox(),
                    SizedBox(height: 12.h),
                    Text(
                      (nextState == 0) ?
                      'Need someone to move furniture, do yard work,\nor grab groceries? Post your request and set your price!' :
                      (nextState == 1) ?
                      'Our smart system connects you with nearby helpers who can complete your task perfectly!' :
                      'Get help with any task—post your job, set your price, and receive offers from those ready to lend a hand.',
                      style: style.bodySmall?.copyWith(
                        color: AppColors.greyTextColor,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 44.h),
                    (nextState != 2) ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Skip',
                          containerColor: AppColors.onPrimary,
                          borderColor: AppColors.bgColor1,
                          textColor: AppColors.bgColor1,
                          onPressed: () {
                            ref.read(toggleNext.notifier).state = 2;
                          },
                        ),
                        SizedBox(width: 8.w),
                        CustomButton(
                          text: 'Next',
                          containerColor: AppColors.bgColor1,
                          textColor: Colors.white,
                          onPressed: () {
                            ref.read(toggleNext.notifier).state++;
                            //****** NEED TO dispose nextState ******
                          },
                        ),
                      ],
                    ) : Column(
                      children: [
                        CustomButton(
                          text: 'Create an Account',
                          containerColor: AppColors.onPrimary,
                          borderColor: AppColors.bgColor1,
                          textColor: AppColors.bgColor1,
                          isBig: true,
                          onPressed: () {
                            debugPrint("Account Created!");
                          },
                        ),
                        SizedBox(height: 12.h),
                        CustomButton(
                          text: 'Log in',
                          containerColor: AppColors.bgColor1,
                          textColor: Colors.white,
                          isBig: true,
                          onPressed: () {
                            debugPrint("Log in!");
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
