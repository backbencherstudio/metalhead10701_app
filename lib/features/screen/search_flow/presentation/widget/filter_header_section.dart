import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/theme_extension/app_colors.dart';

class FilterHeaderSection extends StatelessWidget {
  const FilterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: ()=>context.pop(), child: Text("Cancel", style: style.bodyMedium,)),
        Text("Filter", style: style.titleSmall?.copyWith(fontWeight: FontWeight.bold),),
        TextButton(onPressed: ()=>context.pop(), child: Text("Apply", style: style.bodyMedium?.copyWith(
          color: AppColors.bgColor1
        ),)),
      ],
    );
  }
}
