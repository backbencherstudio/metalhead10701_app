import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/home_screen/presentation/widgets/container_box.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/home_screen/presentation/widgets/find_job_section.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/home_screen/presentation/widgets/helper_header_section.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/home_screen/presentation/widgets/line_graph.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/models/job_type_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/job_items.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/section_title.dart';

import '../../../data/model/job_model.dart';

class HelperHomeScreen extends StatelessWidget {
  const HelperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),

              HelperHeaderSection(style: style),

              SizedBox(height: 16.h),
              FindJobSection(style: style),
              SizedBox(height: 24.h),

              ContainerBox(style: style),
              SizedBox(height: 12.h),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ContainerBox(
                      title: '2',
                      subtitle: "Today's Job",
                      titleColor: AppColors.bgColor5,
                      color: AppColors.bgColor5.withAlpha(20),
                      image: AppIcons.filesSvg,
                      imgSize: 32.w,
                      style: style,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ContainerBox(
                      title: '4.8',
                      subtitle: 'Rating',
                      titleColor: AppColors.bgColor8,
                      color: AppColors.bgColor8.withAlpha(20),
                      image: AppIcons.starSvg,
                      imgSize: 32.w,
                      style: style,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              SectionTitle(
                style: style,
                title: 'My Earnings',
                showViewAll: false,
              ),
              LineChartSample2(),
              SizedBox(height: 16.h),
              SectionTitle(
                style: style,
                title: 'Upcoming Appointments',
                showViewAll: false,
              ),
              SizedBox(height: 12.h),

              SectionTitle(
                title: 'Job Categories',
                style: style,
                showViewAll: true,
              ),
              SizedBox(height: 12.h),
              ...List.generate(jobTypes.length, (index) {
                return Column(
                  children: [
                    JobItems(style: style, job: jobTypes[index]),
                    if (index != jobs.length - 1) SizedBox(height: 12.h),
                  ],
                );
              }),

              SizedBox(height: 24.h),
              SectionTitle(
                title: 'Jobs Near By You',
                style: style,
                showViewAll: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
