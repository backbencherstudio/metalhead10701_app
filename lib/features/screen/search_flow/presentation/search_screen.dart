import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/common_search_bar.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import '../../../../core/constant/icons.dart';
import '../../../../core/routes/route_name.dart';
import '../../../common_widgets/custom_job_card.dart';
import '../data/provider/search_controller.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 50.h,),
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
                    child: Text("Search", style: style.bodyLarge,),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CommonSearchBar(
                style: style,
                controller: _controller,
                focusNode: _focusNode,
              ),
              Expanded(
                child: (filteredSuggestions.isEmpty && filteredJobs.isEmpty) ? SizedBox(
                  height: 500.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_outlined, color: AppColors.bgColor1, size: 50.sp,),
                      Text("Sorry, no results found", style: style.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
                      Text("Please try a different search term.", style: style.bodyMedium,)
                    ],
                  ),
                ) :(isSuggestion) ? ListView.builder(
                  itemCount: filteredSuggestions.length,
                  itemBuilder: (context, index) {
                    final job = filteredSuggestions[index];
                    return ListTile(
                      leading: Icon(Icons.subdirectory_arrow_right_outlined),
                      title: Text(job.name),
                      onTap: () {
                        _controller.text = job.name;
                        ref.read(isSuggestionOn.notifier).state = false;
                        ref.read(searchQueryProvider.notifier).state = job.name;
                        _focusNode.unfocus();
                      },
                    );
                  },
                ) :
                Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(child: SvgPicture.asset(AppIcons.connectionIcon, height: 24.h, width: 24.w,),
                        onTap: () async => await showModalBottomSheet(
                            context: context,
                            backgroundColor: AppColors.whiteTextColor,

                            builder: (BuildContext context) {
                          return SizedBox(
                            height: 300.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Center(child: Text("Sort By")),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Location: nearest first"),
                                      Icon(Icons.check, color: AppColors.headlineTextColor,)
                                    ],
                                  ),
                                  Text("Rating: the best first"),
                                  Text("Price: from low to height"),
                                  Text("Alphabet: from A>Z"),
                                  CustomButton(text: "Save", isBig: true, onPressed: ()=>context.pop(),)
                                ],
                              ),
                            ),
                          );
                        }),
                        ),
                        Text("Sort By", style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
                        SizedBox(width: 176.w,),
                        InkWell(
                            child: SvgPicture.asset(AppIcons.filterIcon, height: 24.h, width: 24.w, colorFilter: ColorFilter.mode(AppColors.bgColor1, BlendMode.srcIn),),
                          onTap: ()=>context.push(RouteName.filterScreen),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: CustomJobCard(job: filteredJobs[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
