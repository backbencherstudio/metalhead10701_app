import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import 'package:metal_head/features/screen/dashboard_flow/helper/home_screen/presentation/widgets/helper_header_section.dart';
import '../../../../../../core/constant/icons.dart';
import '../../../../../common_widgets/line_graph.dart';
import '../../../user/user_home_screen/models/job_model.dart';
import '../../../user/user_home_screen/presentation/widgets/header_sction.dart';
import '../../../user/user_home_screen/presentation/widgets/job_items.dart';
import '../../../user/user_home_screen/presentation/widgets/post_job_section.dart';
import '../../../user/user_home_screen/presentation/widgets/section_title.dart';

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

              // HeaderSection(style: style),
              // SizedBox(height: 20.h),
              // PostJobSection(style: style),
              // SizedBox(height: 24.h),
              // SectionTitle(
              //   title: 'Job Categories',
              //   style: style,
              //   showViewAll: true,
              // ),
              // SizedBox(height: 12.h),
              // ...List.generate(jobs.length, (index) {
              //   return Column(
              //     children: [
              //       JobItems(style: style, job: jobs[index]),
              //       if (index != jobs.length - 1) SizedBox(height: 12.h),
              //     ],
              //   );
              // }),
              //
              // SizedBox(height: 24.h),
              // SectionTitle(
              //   title: 'Jobs Near By You',
              //   style: style,
              //   showViewAll: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


