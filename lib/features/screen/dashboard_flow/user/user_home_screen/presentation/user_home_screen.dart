import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/header_sction.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/post_job_section.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/section_title.dart';

import '../../../../../common_widgets/custom_job_card.dart';

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
              SizedBox(height: 24.h,),
              SectionTitle(style: style,showViewAll: true,),
              Column(
                children: List.generate(dummyJobs.length, (jobIndex)=>Padding(
                  padding: EdgeInsets.all(12.r),
                  child: CustomJobCard(job: dummyJobs[jobIndex]),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


