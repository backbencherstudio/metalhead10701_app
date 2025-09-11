import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constant/icons.dart';
import '../../../theme/theme_extension/app_colors.dart';

class BottomBarWidget extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const BottomBarWidget({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    // final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    // final isNavBarVisible = ref.watch(navBarVisibilityProvider);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.bgColor4,
        elevation: 0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: style.bodySmall?.copyWith(color: AppColors.bgColor1),
        unselectedLabelStyle: style.bodySmall?.copyWith(color: AppColors.greyTextColor),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeIcon,
              colorFilter: ColorFilter.mode(
                (navigationShell.currentIndex == 0)
                    ? AppColors.bgColor1
                    : AppColors.greyTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.jobIcon,
              colorFilter: ColorFilter.mode(
                (navigationShell.currentIndex == 1)
                    ? AppColors.bgColor1
                    : AppColors.greyTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Job",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.msgIcon,
              colorFilter: ColorFilter.mode(
                (navigationShell.currentIndex == 2)
                    ? AppColors.bgColor1
                    : AppColors.greyTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.profileIcon,
              colorFilter: ColorFilter.mode(
                (navigationShell.currentIndex == 3)
                    ? AppColors.bgColor1
                    : AppColors.greyTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
