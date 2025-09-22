import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

import 'delete_notification_dialog.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
    required this.style,
    required this.title,
    required this.description,
    this.reviewOffer,
    this.activeStatus,
    required this.isSeen,
  });

  final TextTheme style;
  final String title;
  final String description;
  final String? reviewOffer;
  final String? activeStatus;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:isSeen ? AppColors.bgColor3 : AppColors.bgColor4,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          bottom: BorderSide(
            color: isSeen ? AppColors.bgColor6.withAlpha(30) : AppColors.borderColor,
            width: 1.w,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                   title,
                    style: style.bodyMedium?.copyWith(
                      color: AppColors.blackHeadline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      onDeleteNotificationTap(context);
                      // popup menu
                    },
                    child: SvgPicture.asset(AppIcons.trash2Svg, width: 20.w, height: 20.h)),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              description,
              style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor2,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              reviewOffer ?? '',
              style: style.bodyMedium?.copyWith(
                color: AppColors.redTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                textAlign: TextAlign.end,
                activeStatus ?? '',
                style: style.bodySmall?.copyWith(
                  color: AppColors.greyTextColor2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
