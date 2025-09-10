import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import '../../../../../core/routes/route_name.dart';
import '../../create_account_screen/presentation/widgets/input_label_text.dart';
import '../../login_screen/presentation/widgets/check_box.dart';
import '../../splash/presentation/widgets/custom_button.dart';

class NewScreen extends StatefulWidget {
  final bool isUser;
  const NewScreen({
    super.key,
    required this.isUser
  });

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
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
              !widget.isUser ? "Enter New Password" : "Enter User Name",
              style: style.headlineMedium?.copyWith(
                color: AppColors.headlineTextColor2,
              ),
            ),
            SizedBox(height: 20.h),

            if(widget.isUser) ...[
              InputLabel(labelText: 'User Name', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  hintText: 'enter new user name',
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.lightGreyTextColor,
                  ),
                ),
              ),
            ]
            else ...[
              InputLabel(labelText: 'Password', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                    hintText: 'enter new password',
                ),
              ),
              SizedBox(height: 12.h),
              InputLabel(labelText: 'Confirm password', style: style),
              SizedBox(height: 8.h),
              TextFormField(
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  hintText: 'enter confirm password',
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.lightGreyTextColor,
                  ),
                ),
              ),
            ],
            SizedBox(height: 20.h),
            Row(
              children: [
                CheckBox(),
                Text("Keep me signed in", style: style.labelLarge?.copyWith(color: AppColors.headlineTextColor),)
              ],
            ),
            SizedBox(height: 20.h),
            Center(child: CustomButton(text: (widget.isUser) ? 'Reset Username' : 'Reset Password',
              textColor: AppColors.onPrimary,
              onPressed: ()=>context.go(RouteName.loginScreen),
              isBig: true,)),
          ],
        ),
      ),
    );
  }
}
