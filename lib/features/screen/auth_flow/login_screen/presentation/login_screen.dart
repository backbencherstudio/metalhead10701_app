import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/data/provider/userController.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/login_screen/presentation/widgets/check_box.dart';
import '../../../../../core/data/provider/loading_provider.dart';
import '../../../../../core/repository/auth/auth_repository_implemented.dart';
import '../../../../../core/repository/home/home_repository_implemented.dart';
import '../../../../../core/routes/route_name.dart';
import '../../create_account_screen/presentation/widgets/input_label_text.dart';
import '../../splash/presentation/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  dispose(){
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }
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
            SizedBox(height: 8.h),
            Text(
              "Log in",
              style: style.headlineMedium?.copyWith(
                color: AppColors.headlineTextColor2,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Nice to have you back!',
              style: style.bodySmall?.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
            SizedBox(height: 20.h),

            InputLabel(labelText: 'User Name or Email', optional: ' *', style: style),
            SizedBox(height: 8.h),
            TextFormField(
              controller: _emailController,
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
              ),
              decoration: InputDecoration(hintText: 'enter username or email'),
            ),
            SizedBox(height: 12.h),
            InputLabel(labelText: 'Password', style: style),
            SizedBox(height: 8.h),
            TextFormField(
              controller: _passController,
              style: style.bodyMedium?.copyWith(
                color: AppColors.headlineTextColor,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your password',
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.lightGreyTextColor,
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                CheckBox(),
                Text("Keep me signed in", style: style.labelLarge?.copyWith(color: AppColors.headlineTextColor),)
              ],
            ),
            SizedBox(height: 20.h),
            Center(child: Consumer(
              builder: (_, ref, _) {
                final isLoading = ref.watch(loadingProvider);
                return isLoading ? const CircularProgressIndicator(
                  color: Colors.red,
                ) : CustomButton(text: 'Log In',
                  textColor: AppColors.onPrimary,
                  onPressed: () async {
                  ref.read(loadingProvider.notifier).state = true;
                  debugPrint(_emailController.text);
                  debugPrint(_passController.text);
                    final isLoginSuccess = await AuthRepoImplemented().loginService(_emailController.text, _passController.text);
                    debugPrint(isLoginSuccess.toString());
                    if(isLoginSuccess) {
                      final user = await HomeRepoImplemented().loadUser();
                      debugPrint("\n\n\n\n$user\n\n\n\n");
                      ref.read(userProvider.notifier).state = user;
                      context.go(RouteName.userHomeScreen);
                    }
                  ref.read(loadingProvider.notifier).state = false;
                  },
                  isBig: true,);
              }
            )),
            SizedBox(height: 24.h),

            TextButton(onPressed: ()=>context.go(RouteName.forgotUserScreen), child: Text("Forgot Username?", style: style.labelLarge?.copyWith(color: AppColors.headlineTextColor),)),
            TextButton(onPressed: ()=>context.go(RouteName.forgotPassScreen), child: Text("Forgot Password?", style: style.labelLarge?.copyWith(color: AppColors.headlineTextColor),)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have account?',style: style.bodySmall?.copyWith(
                  color: AppColors.headlineTextColor,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width: 4.w),
                TextButton(
                  onPressed: ()=>context.go(RouteName.createAccountScreen),
                  child: Text(
                  'Create Account',
                  style: style.labelMedium?.copyWith(
                      color: AppColors.bgColor6,
                      fontWeight: FontWeight.w600
                ),
                ),
                )

              ]
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("About Us", style: style.labelMedium?.copyWith(color: AppColors.greyTextColor2),),
                Text("Email Support", style: style.labelMedium?.copyWith(color: AppColors.greyTextColor2),),
                Text("Terms and Services", style: style.labelMedium?.copyWith(color: AppColors.greyTextColor2),),
                Text("Guidelines", style: style.labelMedium?.copyWith(color: AppColors.greyTextColor2),)
              ],
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
