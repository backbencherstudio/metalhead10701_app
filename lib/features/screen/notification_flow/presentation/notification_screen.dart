import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/notification_flow/model/notification_model.dart';
import 'package:metal_head/features/screen/notification_flow/presentation/widgets/custom_notification.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Notification",
                    style: style.bodyMedium?.copyWith(
                      color: AppColors.headlineTextColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              dummyNotifications.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppIcons.notification2Svg,
                              height: 48.h,
                              width: 48.w,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'No Notifications Yet',
                              style: style.bodyLarge?.copyWith(
                                color: AppColors.headlineTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'You’ll be notified here once there’s\nsomething new.',
                              textAlign: TextAlign.center,
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: dummyNotifications.length,
                        itemBuilder: (context, index) {
                          final item = dummyNotifications[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.r),
                            child: CustomNotification(
                              style: style,
                              title: item.title,
                              description: item.description,
                              reviewOffer: item.reviewOffer,
                              activeStatus: item.activeStatus,
                              isSeen: item.isSeen,
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
