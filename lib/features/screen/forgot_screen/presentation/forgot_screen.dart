import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';
import '../../create_account_screen/presentation/widgets/input_label_text.dart';
import '../../splash/presentation/widgets/custom_button.dart';

class ForgotScreen extends StatelessWidget {
  final bool isUser;
  const ForgotScreen({
    super.key,
    required this.isUser
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.headlineTextColor,),
            ),
            SizedBox(height: 8.h),
            Text(
              isUser ? "Forgot Username?" : "Forgot Password?",
              style: style.headlineMedium?.copyWith(
                color: AppColors.headlineTextColor2,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              isUser ?
              'Please enter your email to initiate the user name reset process. A 4-digit verification code will be sent to your email, and then you can create a new user name.' :
              'Please enter your email to initiate the password reset process. A 4-digit verification code will be sent to your email, and then you can create a new password.',
              style: style.bodySmall?.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
            SizedBox(height: 20.h),

            InputLabel(labelText: 'Email', style: style),
            SizedBox(height: 8.h),
            TextFormField(
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
              ),
              decoration: InputDecoration(hintText: 'enter username or email'),
            ),
            SizedBox(height: 24.h,),
            Center(child: CustomButton(text: isUser ? 'Reset Username' : 'Reset Password',
              textColor: AppColors.onPrimary,
              onPressed: ()=>isUser ? context.go(RouteName.restoreUserScreen) : context.go(RouteName.restorePasswordScreen),
              isBig: true,)),
          ],
        ),
      ),
    );
  }
}
