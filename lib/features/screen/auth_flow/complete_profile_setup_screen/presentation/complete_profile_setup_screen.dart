import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_extension/app_colors.dart';
import '../../create_account_screen/presentation/widgets/input_label_text.dart';
import '../../splash/presentation/widgets/custom_button.dart';



class CompleteProfileSetupScreen extends StatefulWidget {
  const CompleteProfileSetupScreen({super.key});

  @override
  State<CompleteProfileSetupScreen> createState() =>
      _CompleteProfileSetupScreenState();
}

class _CompleteProfileSetupScreenState
    extends State<CompleteProfileSetupScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.headlineTextColor,
                      ),
                    ),
                    Text(
                      'Skip',
                      style: style.bodySmall?.copyWith(
                        color: AppColors.headlineTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Complete Your Profile",
                style: style.headlineMedium?.copyWith(
                  color: AppColors.headlineTextColor2,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Complete your profile to unlock all features.',
                style: style.bodySmall?.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),

              SizedBox(height: 16.h),
              InputLabel(style: style, labelText: 'Email', optional: ' *'),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  hintText: 'e.g., example@gmail.com',
                ),
              ),

              SizedBox(height: 16.h),
              InputLabel(style: style, labelText: 'Address', optional: ' *'),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'e.g., 1234 Elm Street'),
              ),

              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(
                          style: style,
                          labelText: 'City',
                          optional: ' *',
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.headlineTextColor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'e.g., Springfield',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(
                          style: style,
                          labelText: 'State',
                          optional: ' *',
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.headlineTextColor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'e.g., Illinois',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              InputLabel(style: style, labelText: 'Zip Code', optional: ' *'),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'e.g., 12345'),
              ),

              SizedBox(height: 16.h),
              InputLabel(
                style: style,
                labelText: 'Bio',
                optional: ' (Optional)',
                color: AppColors.greyTextColor,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'e.g., I am a software engineer.',
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

              SizedBox(height: 16.h),
              InputLabel(
                style: style,
                labelText: 'Skills',
                optional: ' (Optional)',
                color: AppColors.greyTextColor,
              ),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(hintText: 'e.g., ac ripear '),
              ),

              SizedBox(height: 24.h),

              Center(child: CustomButton(text: 'Complete',onPressed: (){},isBig: true,)),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
