import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/routes/route_name.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../../common_widgets/alert_dialogs/confirm_job_acceptance_dialog.dart';
import '../../../../../auth_flow/splash/presentation/widgets/custom_button.dart';
class FindJobSection extends StatelessWidget {
  const FindJobSection({
    super.key,
    required this.style,
  });

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgColor4,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Help or Land a Hand',
                  style: style.bodySmall?.copyWith(
                    color: AppColors.greyTextColor,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Get things done or offer\nyour skills, it's simple.",
                  style: style.bodyMedium?.copyWith(
                    color: AppColors.headlineTextColor,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Find a job',
                  width: 204.w,
                  onPressed: () {
                   context.push(RouteName.browseJobScreen);
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  textStyle: style.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteTextColor,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(AppIcons.resumeSvg, width: 98.w, height: 93.h),
          ],
        ),
      ),
    );
  }
}
