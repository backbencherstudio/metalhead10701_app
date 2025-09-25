import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme_extension/app_colors.dart';
import '../../auth_flow/create_account_screen/presentation/widgets/input_label_text.dart';

class AddCardList {
  final String cardNumber;
  final String cardHolderName;
  final String expirationDate;
  final String cvv;

  AddCardList({required this.cardNumber, required this.cardHolderName, required this.expirationDate, required this.cvv});



}

List<AddCardList> addCardList = [];


class AddCreditCardScreen extends StatefulWidget {
  const AddCreditCardScreen({super.key});

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

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
                      addCardList.add(
                          AddCardList(cardNumber: _cardNumberController.text, cardHolderName: _cardHolderNameController.text, expirationDate: _expirationDateController.text, cvv: _cvvController.text)
                      );
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
                            controller: _cardHolderNameController,
                            decoration: InputDecoration(
                              hintText: 'josephine',
                            ),
                          ),
                          SizedBox(height: 16.h),

                          InputLabel(labelText: 'Card Number', style: style),
                          SizedBox(height: 8.h),
                          TextFormField(
                            controller: _cardNumberController,
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
                                      controller: _expirationDateController,
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
                                      controller: _cvvController,
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
