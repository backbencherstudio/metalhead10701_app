import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../../../core/theme/theme_extension/app_colors.dart';

class CounterOfferAcceptedScreen extends StatefulWidget {
  const CounterOfferAcceptedScreen({super.key});

  @override
  State<CounterOfferAcceptedScreen> createState() => _CounterOfferAcceptedScreenState();
}

class _CounterOfferAcceptedScreenState extends State<CounterOfferAcceptedScreen> {
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
            'Counter Offer Accepted',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 161.w,
                child: CustomButton(
                  text: 'Back',
                  containerColor: AppColors.bgTransparent,
                  borderColor: AppColors.bgColor1,
                  textStyle: style.bodyMedium?.copyWith(
                    color: AppColors.bgColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              CustomButton(
                text: 'View Timeline',
                containerColor: AppColors.bgColor1,
                textStyle: style.bodyMedium?.copyWith(
                  color: AppColors.whiteTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
