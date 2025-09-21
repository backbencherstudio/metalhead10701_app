import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

import '../../../../../core/routes/route_name.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({super.key, required this.style, required this.images});

  final TextTheme style;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    int imageCount = images.length;

    return GestureDetector(
      onTap: (){
        if (imageCount >= 1 && imageCount <= 3) {
          // Pass images as arguments to the next screen
          context.push(RouteName.imageShowScreen, extra: images);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 196.w,
            height: (imageCount == 1)
                ? 144.h
                : (imageCount == 2)
                ? 144.h
                : (imageCount == 3)
                ? 160.h
                : 160.h,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.bgColor8,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: (imageCount == 1)
                ? ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(images[0], fit: BoxFit.cover),
            )
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: imageCount == 2 ? 2 : 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: (imageCount == 2)
                    ? 1
                    : 1.3,
              ),
              itemCount: imageCount,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(images[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '10:01 AM',
            style: style.labelMedium?.copyWith(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
