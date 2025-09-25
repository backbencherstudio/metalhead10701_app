import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme_extension/app_colors.dart';
import '../../auth_flow/create_account_screen/presentation/widgets/input_label_text.dart';

class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text("Cancel", style: style.bodyMedium?.copyWith(
                      color: AppColors.headlineTextColor,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  Text(
                    "Add Card",
                    style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor5,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: (){
                      context.pop();
                    },
                    child: Text(
                      "Save",
                      style: style.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.bgColor1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputLabel(labelText: 'Cardholder name', style: style),
                          SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'josephine',
                            ),
                          ),
                          SizedBox(height: 16.h),

                          InputLabel(labelText: 'Card Number', style: style),
                          SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '**** **** **** ****',
                            ),
                          ),
                          SizedBox(height: 16.h),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InputLabel(
                                      style: style,
                                      labelText: 'Expiration Date',
                                    ),
                                    SizedBox(height: 8.h),
                                    TextFormField(
                                      style: style.bodyMedium?.copyWith(
                                        color: AppColors.headlineTextColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'MM/YY',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InputLabel(
                                      style: style,
                                      labelText: 'CVV',
                                    ),
                                    SizedBox(height: 8.h),
                                    TextFormField(
                                      style: style.bodyMedium?.copyWith(
                                        color: AppColors.headlineTextColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '***',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
