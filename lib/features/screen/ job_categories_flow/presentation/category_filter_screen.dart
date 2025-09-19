import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/common_check_box.dart';
import 'package:metal_head/features/screen/search_flow/data/provider/checkBoxController.dart';
import 'package:metal_head/features/screen/search_flow/presentation/widget/categories_section.dart';
import 'package:metal_head/features/screen/search_flow/presentation/widget/filter_header_section.dart';

class CategoriesFilterScreen extends ConsumerWidget {
  const CategoriesFilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h,),
              FilterHeaderSection(),
              SizedBox(height: 30.h,),
              // Text("Categories"),
              // SizedBox(
              //   height: 200.h,
              //   child: CategoriesSection(),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.headlineTextColor,),
              //     Text("Show All")
              //   ],
              // ),
              // SizedBox(height: 20.h,),
              Text("Payment Type"),
              Row(
                children: [
                  CommonCheckBox(toggleCheckBoxProvider: clickCheckBoxProvider(1)),
                  Text("Fixed Price")
                ],
              ),
              Row(
                children: [
                  CommonCheckBox(toggleCheckBoxProvider: clickCheckBoxProvider(2)),
                  Text("Hourly")
                ],
              ),
              SizedBox(height: 20.h,),
              Text("Urgency"),
              Row(
                children: [
                  CommonCheckBox(toggleCheckBoxProvider: clickCheckBoxProvider(3)),
                  Text("Urgent")
                ],
              ),
              Row(
                children: [
                  CommonCheckBox(toggleCheckBoxProvider: clickCheckBoxProvider(4)),
                  Text("Anytime")
                ],
              ),
              SizedBox(height: 20.h,),
              Center(child: TextButton(child: Text("Reset All", style: style.bodyMedium?.copyWith(color: AppColors.redTextColor)
              ),
                onPressed: ()=>ref.invalidate(clickCheckBoxProvider),
              )
              )
            ],
          )
      ),
    );
  }
}
