import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/features/common_widgets/custom_counter_offer_card.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/header_sction.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/job_items.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/post_job_section.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/section_title.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../../core/routes/route_name.dart';
import '../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../../common_widgets/custom_job_card.dart';
import '../../../data/model/offer_model.dart';
import '../models/job_type_model.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

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
              HeaderSection(style: style),
              TextFormField(
                onTap: () => context.push(RouteName.searchScreen),
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 8.w),
                    child: SvgPicture.asset(
                      AppIcons.searchSvg,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  prefixIconColor: AppColors.greyTextColor,
                  hintText: 'Start typing',
                ),
              ),
              SizedBox(height: 24.h),
              Column(
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: CustomCounterOfferCard(offer: offers[index]),
                  ),
                ),
              ),
              PostJobSection(style: style),
              SizedBox(height: 24.h),
              SectionTitle(
                style: style,
                title: 'Upcoming Appointments',
                showViewAll: false,
              ),
              Column(
                children: List.generate(
                  1,
                  (jobIndex) => Padding(
                    padding: EdgeInsets.all(12.r),
                    child: CustomJobCard(job: jobs[jobIndex]),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SectionTitle(
                title: 'Job Categories',
                style: style,
                showViewAll: true,
              ),
              SizedBox(height: 12.h),
              ...List.generate(3, (index) {
                return Column(
                  children: [
                    JobItems(style: style, job: jobTypes[index]),
                    if (index != jobTypes.length - 1) SizedBox(height: 12.h),
                  ],
                );
              }),

              SizedBox(height: 24.h),

              SectionTitle(
                title: 'Jobs Near By You',
                style: style,
                showViewAll: true,
              ),
              Column(
                children: List.generate(
                  3,
                  (jobIndex) => Padding(
                    padding: EdgeInsets.all(12.r),
                    child: CustomJobCard(job: jobs[jobIndex]),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SectionTitle(
                title: 'Urgent and High-priority',
                style: style,
                showViewAll: true,
              ),
              Column(
                children: List.generate(
                  3,
                  (jobIndex) => Padding(
                    padding: EdgeInsets.all(12.r),
                    child: CustomJobCard(job: urgentJobs[jobIndex]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
