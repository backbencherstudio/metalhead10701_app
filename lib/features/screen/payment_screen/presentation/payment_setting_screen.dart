import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/features/screen/payment_screen/presentation/widgets/more_option_sheet.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';
import '../riverpod/payment_card_provider.dart';

class PaymentSettingScreen extends ConsumerWidget {
  const PaymentSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context).textTheme;
    final cardList = ref.watch(cardProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                     context.push(RouteName.profileScreen);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Payment settings ",
                    style: style.bodyMedium?.copyWith(
                      color: AppColors.headlineTextColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(cardList.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Dismissible(
                          key: ValueKey('card_$index'),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            ref.read(cardProvider.notifier).deleteCard(index);
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 20.w),
                            color: Colors.red,
                            child: SvgPicture.asset(
                              AppIcons.deleteSvg,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              AppIcons.paymentMethodsSvg,
                              height: 20.h,
                              width: 20.w,
                            ),
                            title: Text(
                              cardList[index].cardNumber,
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.headlineTextColor6,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Default',
                                  style: style.bodySmall?.copyWith(
                                    color: AppColors.greenTextColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: (){
                                    showMoreSheet(context, cardList[index], index);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 16.h,
                                    color: AppColors.borderColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  context.push(RouteName.addCreditCardScreen);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.creditCardAdd,
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Add credit card",
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.bgColor1,
                        fontWeight: FontWeight.w400,
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
