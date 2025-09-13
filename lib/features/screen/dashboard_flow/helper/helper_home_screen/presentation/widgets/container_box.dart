import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({
    super.key,
    required this.style,
    this.width,
    this.title,
    this.subtitle,
    this.image,
    this.color,
    this.titleColor,
    this.imgSize,
  });

  final TextTheme style;
  final double? width;
  final String? title;
  final String? subtitle;
  final String? image;
  final Color? color;
  final Color? titleColor;
  final double? imgSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: color ?? AppColors.bgColor7.withAlpha(20),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "\$120",
                    style: style.bodyMedium?.copyWith(
                      color: titleColor ?? AppColors.bgColor7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle ?? 'Earning This Week',
                    style: style.bodySmall?.copyWith(
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              image ?? AppIcons.moneySvg,
              height: imgSize ?? 48.h,
              width: imgSize ?? 48.w,
            ),
          ],
        ),
      ),
    );
  }
}
