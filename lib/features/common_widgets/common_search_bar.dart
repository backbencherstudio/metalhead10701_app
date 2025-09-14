import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/features/screen/search_flow/data/provider/search_controller.dart';
import '../../core/constant/icons.dart';
import '../../core/routes/route_name.dart';
import '../../core/theme/theme_extension/app_colors.dart';

class CommonSearchBar extends ConsumerWidget {
  const CommonSearchBar({super.key, required this.style, required this.controller, required this.focusNode});
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextTheme style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onChanged: (val) {
        ref.read(isSuggestionOn.notifier).state = true;
        ref.read(searchQueryProvider.notifier).state = "";
        ref.read(searchQuerySuggestionProvider.notifier).state = val;
      },
      controller: controller,
      focusNode: focusNode,
      style: style.bodyMedium?.copyWith(color: AppColors.headlineTextColor),
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
    );
  }
}






// late TextEditingController searchController;
// late FocusNode searchFocusNode;
// @override
// void initState() {
//   searchController = TextEditingController();
//   searchFocusNode = FocusNode();
//   searchFocusNode.addListener((){
//     if(searchFocusNode.hasFocus) {
//       // ref.read(isSearchBarActive.notifier).state = true;
//       context.push(RouteName.searchScreen);
//     } else {
//       // ref.read(isSearchBarActive.notifier).state = false;
//       context.pop();
//     }
//   });
//   super.initState();
// }
//
// @override
// void dispose() {
//   searchFocusNode.dispose();
//   searchController.dispose();
//   super.dispose();
// }