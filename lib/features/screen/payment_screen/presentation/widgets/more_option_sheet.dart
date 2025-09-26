import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/theme_extension/app_colors.dart';
import '../../riverpod/payment_card_provider.dart';
import '../add_credit_card_screen.dart';
import 'delete_card.dart';

void showMoreSheet(BuildContext context, AddCardList card, int index) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.whiteTextColor,
    builder: (BuildContext context) {
      final style = Theme.of(context).textTheme;
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'More options',
              style: style.bodyMedium?.copyWith(
                color: AppColors.blackHeadline,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),
            ListTile(
              title: Text(
                'Edit',
                style: style.bodyMedium?.copyWith(
                  color: AppColors.blackHeadline,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCreditCardScreen(
                      cardToEdit: card,
                      cardIndex: index,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Set as default',
                style: style.bodyMedium?.copyWith(
                  color: AppColors.blackHeadline,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implement default functionality
              },
            ),
            ListTile(
              title: Text(
                'Delete',
                style: style.bodyMedium?.copyWith(
                  color: AppColors.redTextColor3,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                onDeleteCardTap(context,index);
              },
            ),
          ],
        ),
      );
    },
  );
}
