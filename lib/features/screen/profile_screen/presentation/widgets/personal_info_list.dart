import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/job_management_flow/presentation/job_management_screen.dart';

class PersonalInfoListScreen extends StatelessWidget {
  const PersonalInfoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    final List<Map<String, dynamic>> items = [
      {
        'title': 'Personal Information',
        'leading': AppIcons.idSvg,
        'trailing': AppIcons.arrowRightSvg,
        'onTap': () {
          context.push(RouteName.personalInfoEditingScreen);
        },
      },


      {
        'title': 'Job Management',
        'leading': AppIcons.newJobSvg,
        'trailing': AppIcons.arrowRightSvg,
        'onTap': () {
          context.push(RouteName.jobManagementScreenProfile);

        },
      },

      {
        'title': 'Job History',
        'leading': AppIcons.jobSearchSvg,
        'trailing': AppIcons.arrowRightSvg,
        'onTap': () {
          context.push(RouteName.jobHistoryScreen);
        },
      },

      {
        'title': 'Notification settings',
        'leading': AppIcons.notification2Svg,
        'trailing': AppIcons.arrowRightSvg,
        'onTap': () {},
      },

      {
        'title': 'Payment settings',
        'leading': AppIcons.creditSvg,
        'trailing': AppIcons.arrowRightSvg,
        'onTap': () {},
      },

      {
        'title': 'Log out',
        'leading': AppIcons.logoutSvg,
        'trailing': AppIcons.arrowRightSvg,
        'onTap': () {
          context.push(RouteName.loginScreen);
        },
      },
      // Add more items as needed...
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgColor4,
        borderRadius: BorderRadius.circular(16.r),
      ),
      // Remove extra padding here!
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          padding: EdgeInsets.zero, // No internal padding
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: AppColors.borderColor,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: SvgPicture.asset(item['leading'], height: 24, width: 24),
              title: Text(
                item['title'],
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  item['trailing'],
                  height: 24,
                  width: 24,
                ),
              ),
              onTap: item['onTap'],
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              minVerticalPadding: 8.h,
            );
          },
        ),
      ),
    );
  }
}
