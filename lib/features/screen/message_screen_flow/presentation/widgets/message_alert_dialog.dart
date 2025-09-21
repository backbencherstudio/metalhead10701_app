import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

void onMessageLongTap(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.bgColor4,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Christy Bergstrom',
                      style: style.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.headlineTextColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Nunc placerat vitae viverra leo blandit non interdum a asdhasf asfha fhas fhaa afashg haafh afsioahs fasfh afsaf fafasfas asfas aefasfas areafafas asfasfas asfasfasf sef f',
                      style: style.bodySmall?.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '10:00 AM',
                        style: style.labelSmall?.copyWith(
                          color: AppColors.greyTextColor2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              GestureDetector(
                onTap: (){
                  // hide this container and
                  // show another container with delete for all and delete for me
                },
                child: Container(
                  width: 220.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteTextColor,
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.doubleTickSvg,
                              height: 20.h,
                              width: 20.w,
                            ),
                            Text(
                              'Read Today, 12:30',
                              style: style.labelMedium?.copyWith(
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Divider(color: AppColors.borderColor, thickness: 1.h),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Copy message',
                                style: style.bodyMedium?.copyWith(
                                  color: AppColors.headlineTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              AppIcons.copySvg,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Divider(color: AppColors.borderColor, thickness: 1.h),
                        SizedBox(height: 10.h),

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Delete message',
                                style: style.bodyMedium?.copyWith(
                                  color: AppColors.redTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              AppIcons.trashSvg,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
