import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/repository/auth/auth_repository_implemented.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/services/shared_preference/shared_preference.dart';
import '../../../../../core/theme/theme_extension/app_colors.dart';
import '../../splash/presentation/widgets/custom_button.dart';
import '../provider/countDown.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _otpController;
  late String? _givenEmail;
  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    _givenEmail = await SharedPreference().getEmailId();
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
                'A verification code has been sent to your phone number: $_givenEmail. This code will expire in 2 minutes.',
                style: style.bodySmall?.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: PinCodeTextField(
                  textStyle: style.headlineSmall?.copyWith(
                    color: AppColors.headlineTextColor,
                  ),
                  length: 6,
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
                    if (value == null || value.length < 6) {
                      return 'Enter a valid OTP';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: Consumer(
                  builder: (_, ref, _) {
                    final timer = ref.watch(countdownTimerProvider);
                    return Text(
                      'This OTP will be available during $timer sec',
                      style: style.bodySmall?.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.h,
                    horizontal: 16.w,
                  ),
                  child: Column(
                    children: [
                      CustomButton(
                        text: 'Verify',
                        textColor: AppColors.onPrimary,
                        onPressed: () async {
                            final isMailVerified = await AuthRepoImplemented().verifyMailService(_otpController.text);
                            if(isMailVerified) {
                              context.go(RouteName.successScreen);
                            }
                        },
                        isBig: true,
                      ),
                      SizedBox(height: 8.w),
                      Consumer(
                        builder: (_, ref, _) {
                          final checkTimerFinished = ref.watch(countDownFinished);
                          return (checkTimerFinished) ? TextButton(
                            onPressed: () {
                              AuthRepoImplemented().resendOtpService(_givenEmail.toString());
                              ref.read(countDownFinished.notifier).state = false;
                              ref.read(countdownTimerProvider.notifier).reset();
                            },
                            child: Text(
                              'Resend code',
                              style: style.bodySmall?.copyWith(
                                color: AppColors.redTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ) : SizedBox();
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
