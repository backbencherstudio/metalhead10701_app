import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/alert_dialogs/widgets/accept_label_title.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

void onAcceptCounterTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
        child: Container(
          width: 318.w,
          decoration: BoxDecoration(
            color: AppColors.whiteTextColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
            //  mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                  "Accept Counter Offer",
                  textAlign: TextAlign.center,
                  style: style.bodyLarge?.copyWith(
                    color: AppColors.headlineTextColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "You are about to accept this counter offer. Once accepted, the helper will be notified and the job will move forward with the updated terms.",
                  textAlign: TextAlign.justify,
                  style: style.bodyMedium?.copyWith(
                    color: AppColors.greyTextColor,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16.h),
                AcceptLabelTitle(
                  title: 'Job:',
                  description: 'Help Move Couch and Dining Table',
                  style: style,
                ),
                AcceptLabelTitle(
                  title: 'Counter Offer:',
                  description: '\$45 (Fixed Price)',
                  style: style,
                ),
                AcceptLabelTitle(
                  title: 'Original Offer:',
                  description: '\$50 (Fixed Price)',
                  style: style,
                ),
                AcceptLabelTitle(
                  title: 'Date/Time:',
                  description: '24 Aug, 02:00 – 04:00 PM',
                  style: style,
                ),
                AcceptLabelTitle(
                  title: 'Location:',
                  description: '1123 Maple Street, Maryland',
                  style: style,
                ),
                AcceptLabelTitle(
                  title: 'Estimated Time:',
                  description: '2 hours',
                  style: style,
                ),
                SizedBox(height: 32.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Decline',
                        width: 136,
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
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: CustomButton(
                        text: 'Confirm',
                        width: 136,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        textColor: AppColors.whiteTextColor,
                        containerColor: AppColors.bgColor7,
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}
