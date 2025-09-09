import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/features/screen/splash/presentation/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';
class RestoreScreen extends StatefulWidget {
  final bool isUser;
  const RestoreScreen({
    super.key,
    required this.isUser
  });

  @override
  State<RestoreScreen> createState() => _RestoreScreenState();
}

class _RestoreScreenState extends State<RestoreScreen> {
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
                "Enter the 4-digit code",
                style: style.headlineMedium?.copyWith(
                  color: AppColors.headlineTextColor2,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'We\'ve sent the code to your email, check your inbox.',
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
                    CustomButton(
                      text: widget.isUser ? 'Reset Username' : 'Reset Password',
                      textColor: AppColors.onPrimary,
                      onPressed: ()=>widget.isUser ? context.go(RouteName.newUserScreen) : context.go(RouteName.newPasswordScreen),
                      isBig: true,
                    ),
                    SizedBox(height: 8.w,),
                    TextButton(onPressed: (){
                      //Resend Code API
                    }, child: Text('Resend code',style: style.bodySmall?.copyWith(
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
