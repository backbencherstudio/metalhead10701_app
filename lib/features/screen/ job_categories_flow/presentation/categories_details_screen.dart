import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/models/job_type_model.dart';
import 'package:metal_head/features/screen/search_flow/data/provider/search_controller.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/routes/route_name.dart';
import '../../../common_widgets/custom_job_card.dart';

class CategoriesDetailsScreen extends ConsumerStatefulWidget {
  const CategoriesDetailsScreen({super.key});

  @override
  ConsumerState<CategoriesDetailsScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<CategoriesDetailsScreen> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        ref.read(searchQuerySuggestionProvider.notifier).state = '';
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final filteredJobs = ref.watch(filteredJobsProvider);
    final filteredSuggestions = ref.watch(filteredJobsSuggestionProvider);
    final isSuggestion = ref.watch(isSuggestionOn);
    final jobList = isSuggestion ? filteredSuggestions : filteredJobs;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Row(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Icon(Icons.arrow_back_ios, color: AppColors.headlineTextColor2,),
                  ),
                  onTap: ()=> context.pop(),
                ),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Text(jobTypes[0].jobTitle, style: style.bodyLarge,),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      AppIcons.connectionIcon,
                      height: 24.h,
                      width: 24.w,
                    ),
                    onTap: () async => await showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.whiteTextColor,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 400.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(child: Text("Sort By", style: style.headlineMedium)),
                                ListTile(
                                  title: Text("Location: nearest first"),
                                  trailing: Icon(Icons.check, color: AppColors.headlineTextColor),
                                ),
                                ListTile(title: Text("Rating: the best first")),
                                ListTile(title: Text("Price: from low to high")),
                                ListTile(title: Text("Alphabet: from A to Z")),
                                CustomButton(
                                  text: "Save",
                                  isBig: true,
                                  onPressed: () => context.pop(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text("Sort By", style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor)),
                  InkWell(
                    child: SvgPicture.asset(
                      AppIcons.filterIcon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(AppColors.bgColor1, BlendMode.srcIn),
                    ),
                    onTap: () => context.push(RouteName.categoriesFilterScreen),
                  ),
                ],
              ),
            ),

            // Job List
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length, // Directly use 'jobs' list
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: CustomJobCard(job: jobs[index]), // Display job card
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
