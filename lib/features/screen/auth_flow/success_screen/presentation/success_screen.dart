import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/theme/theme_extension/app_colors.dart';
import '../../splash/presentation/widgets/custom_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(AppIcons.completed, fit: BoxFit.cover),
          ),
          SizedBox(height: 70.h),
          Text(
            'Successfully verified',
            style: style.headlineMedium?.copyWith(
              color: AppColors.headlineTextColor3,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            textAlign: TextAlign.center,
            'Fill in your personal information to simplify doctor communication, book appointments faster, and get personalized care.',
            style: style.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.greyTextColor2,
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: 'Complete Profile Setup',
            textColor: AppColors.onPrimary,
            onPressed: () {
             context.go(RouteName.completeProfileSetupScreen);
            },
            isBig: true,
          ),
        ],
      ),
    );
  }
}
