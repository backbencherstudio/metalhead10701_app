import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../auth_flow/splash/presentation/widgets/custom_button.dart';

class PostJobSection extends StatelessWidget {
  const PostJobSection({super.key, required this.style});

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
                  text: 'Post a job',
                  width: 204.w,
                  onPressed: () {},
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
            SvgPicture.asset(AppIcons.resumeSvg, width: 97.w, height: 93.h),
          ],
        ),
      ),
    );
  }
}