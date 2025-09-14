          import 'package:flutter/material.dart';
          import 'package:flutter_riverpod/flutter_riverpod.dart';
          import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
          import '../../data/provider/provider.dart';

          class CheckBox extends StatelessWidget {
            const CheckBox({super.key});

            @override
            Widget build(BuildContext context) {
              Color getColor(Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.redTextColor;
                }
                return Colors.transparent;
              }


              return Consumer(
                  builder: (_, ref, _) {
                    final isChecked = ref.watch(toggleCheckBox);
                    return Checkbox(
                      checkColor: AppColors.onPrimary,
                      fillColor: WidgetStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        ref.read(toggleCheckBox.notifier).state = !isChecked;
                      },
                    );
                  }
              );
            }
          }