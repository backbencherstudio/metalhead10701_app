import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';
import '../../auth_flow/create_account_screen/presentation/widgets/input_label_text.dart';
import '../riverpod/payment_card_provider.dart';

class AddCreditCardScreen extends ConsumerStatefulWidget {
  final AddCardList? cardToEdit;
  final int? cardIndex;

  const AddCreditCardScreen({super.key, this.cardToEdit, this.cardIndex});

  @override
  ConsumerState<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends ConsumerState<AddCreditCardScreen> {
  late TextEditingController _cardNumberController;
  late TextEditingController _cardHolderNameController;
  late TextEditingController _expirationDateController;
  late TextEditingController _cvvController;

  @override
  void initState() {
    super.initState();

    if (widget.cardToEdit != null) {
      _cardNumberController = TextEditingController(text: widget.cardToEdit!.cardNumber);
      _cardHolderNameController = TextEditingController(text: widget.cardToEdit!.cardHolderName);
      _expirationDateController = TextEditingController(text: widget.cardToEdit!.expirationDate);
      _cvvController = TextEditingController(text: widget.cardToEdit!.cvv);
    } else {
      _cardNumberController = TextEditingController();
      _cardHolderNameController = TextEditingController();
      _expirationDateController = TextEditingController();
      _cvvController = TextEditingController();
    }
  }

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
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    widget.cardToEdit != null ? "Edit Card" : "Add Card",
                    style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor5,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      final updatedCard = AddCardList(
                        cardNumber: _cardNumberController.text,
                        cardHolderName: _cardHolderNameController.text,
                        expirationDate: _expirationDateController.text,
                        cvv: _cvvController.text,
                      );
                      if (widget.cardToEdit != null && widget.cardIndex != null) {
                        ref.read(cardProvider.notifier).updateCard(widget.cardIndex!, updatedCard);
                      } else {
                        ref.read(cardProvider.notifier).addCard(updatedCard);
                      }

                      context.push(RouteName.paymentSettingScreen);
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
