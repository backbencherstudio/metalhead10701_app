import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/features/screen/splash/presentation/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.headlineTextColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Verify Your Account!",
                style: style.headlineMedium?.copyWith(
                  color: AppColors.headlineTextColor2,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'A verification code has been sent to your phone number: Josephine_Towne@hotmail.com. This code will expire in 1 minutes.',
                style: style.bodySmall?.copyWith(color: AppColors.greyTextColor),
              ),
              SizedBox(height: 24.h),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 16.h),
                child: PinCodeTextField(
                  textStyle: style.headlineSmall?.copyWith(
                    color: AppColors.headlineTextColor,
                  ),
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    borderRadius: BorderRadius.circular(1),
                    fieldHeight: 56,
                    fieldWidth: 56,
                    activeFillColor: Colors.white,
                  ),
                  appContext: context,
                  validator: (String? value) {
                    if (value == null || value.length < 4) {
                      return 'Enter a valid OTP';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Text('This OTP will be available during 00:59sec',style: style.bodySmall?.copyWith(
                  color: AppColors.greyTextColor,
                  fontWeight: FontWeight.w400
                ),),
              ),
              Center(child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h,horizontal: 16.w),
                child: Column(
                  children: [
                    CustomButton(text: 'Verify',onPressed: (){
                      context.push(RouteName.completeProfileSetupScreen);
                    },isBig: true,),
                    SizedBox(height: 8.w,),
                    TextButton(onPressed: (){}, child: Text('Resend code',style: style.bodySmall?.copyWith(
                      color: AppColors.redTextColor,
                      fontWeight: FontWeight.w500
                    ),))
                  ],
                ),
              )),

            ],
          ),
        ),
      ),
    );
  }
}
