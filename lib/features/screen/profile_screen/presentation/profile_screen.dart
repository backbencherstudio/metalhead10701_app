import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/constant/images.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

import 'widgets/personal_info_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.r),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(RouteName.userHomeScreen);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text("Profile",style: style.bodyMedium?.copyWith(
                    color: AppColors.headlineTextColor5,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.bgColor4,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  AppImages.profilePng,
                                  height: 64,
                                  width: 64,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.r),
                                      color: AppColors.bgColor10,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SvgPicture.asset(
                                        AppIcons.pencilEditSvg,
                                        height: 24,
                                        width: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Josephine_Towne',
                              style: style.bodyLarge?.copyWith(
                                color: AppColors.headlineTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              '1123 Maple Street, Maryland',
                              style: style.bodySmall?.copyWith(
                                color: AppColors.greyTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          'User Mode',
                          style: style.bodyMedium?.copyWith(
                              color: AppColors.bgColor1,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    // ListTile removed—now use dynamic list only!
                    PersonalInfoListScreen(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
