import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../../common_widgets/common_search_bar.dart';
import '../../../../../auth_flow/splash/presentation/widgets/custom_button.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: style.labelMedium?.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'John Doe',
                      style: style.bodyLarge?.copyWith(
                        color: AppColors.headlineTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: 'User Mode',
                textColor: AppColors.whiteTextColor,
                onPressed: () {},
                width: 90.w,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                textStyle: style.labelSmall?.copyWith(
                  color: AppColors.whiteTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.w),
              Icon(
                Icons.notifications_none_outlined,
                color: AppColors.iconBorderColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        CommonSearchBar(style: style),
      ],
    );
  }
}
