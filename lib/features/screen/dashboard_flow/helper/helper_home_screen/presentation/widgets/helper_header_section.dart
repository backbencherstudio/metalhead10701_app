import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/common_search_bar.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

import '../../../../../../../core/routes/route_name.dart';
import '../../../../data/provider/mode_selection.dart';

class HelperHeaderSection extends StatelessWidget {
  const HelperHeaderSection({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Josephine",
                      style: style.bodyLarge?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Here’s what’s happening today',
                      style: style.labelMedium?.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Consumer(
                    builder: (_, ref, _) {
                      final currentMode = ref.watch(isUserMode);
                      return CustomButton(
                        text: 'Helper Mode',
                        textColor: AppColors.whiteTextColor,
                        onPressed: () {
                          ref.read(isUserMode.notifier).state = !currentMode;
                          context.go(RouteName.userHomeScreen);
                        },
                        width: 98.w,
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                        textStyle: style.labelSmall?.copyWith(
                          color: AppColors.whiteTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }
                  ),
                  SizedBox(width: 12.w),
                  SvgPicture.asset(
                    AppIcons.notificationSvg,
                    height: 24.h,
                    width: 24.w,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          CommonSearchBar(style: style),
        ],
      ),
    );
  }
}
