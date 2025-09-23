import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/provider/mode_selection.dart';
import '../../../../../../../core/data/provider/userController.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../../common_widgets/common_search_bar.dart';
import '../../../../../auth_flow/splash/presentation/widgets/custom_button.dart';

class HeaderSection extends ConsumerWidget {
  const HeaderSection({super.key, required this.style});

  final TextTheme style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                    userData?.username ?? "N/A",
                    style: style.bodyLarge?.copyWith(
                      color: AppColors.headlineTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (_, ref, _) {
                final currentMode = ref.watch(isUserMode);
                return CustomButton(
                  text: 'User Mode',
                  textColor: AppColors.whiteTextColor,
                  onPressed: () {
                    ref.read(isUserMode.notifier).state = !currentMode;
                   // context.go(RouteName.helperHomeScreen);
                  },
                  width: 90.w,
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  textStyle: style.labelSmall?.copyWith(
                    color: AppColors.whiteTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }
            ),
            SizedBox(width: 12.w),
           GestureDetector(
               onTap: (){
                 context.push(RouteName.notificationScreen);
               },
               child: SvgPicture.asset(AppIcons.notificationSvg,height: 24.h,width: 24.w,))
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}