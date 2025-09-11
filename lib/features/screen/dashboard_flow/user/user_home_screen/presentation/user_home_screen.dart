import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/header_sction.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/job_items.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/post_job_section.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/section_title.dart';
import '../../../../../common_widgets/custom_job_card.dart';
import '../models/job_model.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
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
              SizedBox(height: 20.h),
              PostJobSection(style: style),
              SizedBox(height: 24.h),
              SectionTitle(
                title: 'Job Categories',
                style: style,
                showViewAll: true,
              ),
              SizedBox(height: 12.h),
              ...List.generate(jobs.length, (index) {
                return Column(
                  children: [
                    JobItems(style: style, job: jobs[index]),
                    if (index != jobs.length - 1) SizedBox(height: 12.h),
                  ],
                );
              }),

              SizedBox(height: 24.h),

              SectionTitle(title: 'Jobs Near By You',style: style, showViewAll: true),
              Column(
                children: List.generate(dummyJobs.length, (jobIndex)=>Padding(
                  padding: EdgeInsets.all(12.r),
                  child: CustomJobCard(job: dummyJobs[jobIndex]),
                )),
              ),
              SizedBox(height: 24.h),
              SectionTitle(title: 'Urgent and High-priority',style: style, showViewAll: true),
              Column(
                children: List.generate(dummyUrgentJobs.length, (jobIndex)=>Padding(
                  padding: EdgeInsets.all(12.r),
                  child: CustomJobCard(job: dummyUrgentJobs[jobIndex]),
                )),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
