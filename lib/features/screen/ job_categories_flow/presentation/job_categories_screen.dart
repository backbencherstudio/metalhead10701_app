import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/models/job_type_model.dart';
import 'package:metal_head/features/screen/dashboard_flow/user/user_home_screen/presentation/widgets/job_items.dart';
import 'package:metal_head/features/screen/search_flow/data/provider/search_controller.dart';

class JobCategoriesScreen extends ConsumerStatefulWidget {
  const JobCategoriesScreen({super.key});

  @override
  ConsumerState<JobCategoriesScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<JobCategoriesScreen> {
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
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.headlineTextColor2,
                    ),
                  ),
                  onTap: () => context.pop(),
                ),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Text(
                    "Categories",
                    style: style.bodyLarge?.copyWith(
                      color: AppColors.headlineTextColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(jobTypes.length, (index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(
                            RouteName.categoriesDetailsScreen,
                          );
                        },
                        child: JobItems(style: style, job: jobTypes[index]),
                      ),
                      if (index != jobTypes.length - 1) SizedBox(height: 12.h),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
