import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/alert_dialogs/widgets/accept_label_title.dart';
import 'package:metal_head/features/screen/auth_flow/create_account_screen/presentation/widgets/input_label_text.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import '../../../common_widgets/common_custom_header.dart';

class JobCounterOfferOfferScreen extends StatelessWidget {
  const JobCounterOfferOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.r),
              child: CommonCustomHeader(title: "Counter Offer"),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Make a Counter Offer',
                      style: style.headlineSmall?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w600,
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
                    SizedBox(height: 24.h),
                    InputLabel(
                      labelText: 'Counter Offer',
                      optional: ' *',
                      style: style,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your offer amount',
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: SvgPicture.asset(
                            AppIcons.dollarSvg,
                            height: 16.h,
                            width: 8.w,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputLabel(labelText: 'Offer Type', optional: ' *', style: style),
                    SizedBox(height: 8.h),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Select type',
                        suffixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.inputTextColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputLabel(
                      labelText: 'Option Note',
                      optional: ' (Optional)',
                      color: AppColors.greyTextColor,
                      style: style,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor,
                      ),
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter your note here',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 124.w,
                          child: CustomButton(
                            text: 'Cancel',
                            containerColor: AppColors.bgTransparent,
                            borderColor: AppColors.bgColor1,
                            textStyle: style.bodyMedium?.copyWith(
                              color: AppColors.bgColor1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        CustomButton(
                          text: 'Send Counter Offer',
                          containerColor: AppColors.bgColor1,
                          textStyle: style.bodyMedium?.copyWith(
                            color: AppColors.whiteTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
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
