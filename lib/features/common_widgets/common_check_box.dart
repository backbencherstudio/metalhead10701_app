import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/theme_extension/app_colors.dart';

class CommonCheckBox extends ConsumerWidget {
  final StateProvider toggleCheckBoxProvider;
  const CommonCheckBox({
    super.key,
    required this.toggleCheckBoxProvider
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(toggleCheckBoxProvider);

    Color getColor(Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.redTextColor;
      }
      return Colors.transparent;
    }

    return Checkbox(
      side: BorderSide(color: AppColors.redTextColor, width: 1.w),
      checkColor: AppColors.onPrimary,
      fillColor: WidgetStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        ref.read(toggleCheckBoxProvider.notifier).state = !isChecked;
      },
    );
  }
}
