import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';

import '../../../../../core/routes/route_name.dart';
import '../../riverpod/payment_card_provider.dart';

void onDeleteCardTap(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (_) {
      final style = Theme.of(context).textTheme;
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Are you sure you want\nto delete this card?",
                style: style.bodyLarge?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
              ),

              SizedBox(height: 20.h),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Consumer(
                    builder: (context,ref,_) {
                     // final cardList = ref.watch(cardProvider);
                      return CustomButton(
                        text: 'Yes, delete card',
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        textColor: AppColors.whiteTextColor,
                        containerColor: AppColors.bgColor9,
                        onPressed: () {
                          ref.read(cardProvider.notifier).deleteCard(index);
                          Navigator.of(context, rootNavigator: true).pop();
                          context.go(RouteName.paymentSettingScreen);
                        },
                      );
                    }
                  ),

                  SizedBox(height: 5.w),
                  CustomButton(
                    text: 'No, keep',
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    containerColor: AppColors.bgTransparent,
                    textColor: AppColors.greyTextColor,
                    borderColor: AppColors.greyTextColor,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
