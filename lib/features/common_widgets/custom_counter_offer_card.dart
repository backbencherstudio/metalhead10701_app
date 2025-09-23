import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/features/screen/auth_flow/splash/presentation/widgets/custom_button.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/offer_model.dart';
import '../../core/routes/route_name.dart';
import '../../core/theme/theme_extension/app_colors.dart';
import '../screen/dashboard_flow/data/model/job_model.dart';

class CustomCounterOfferCard extends StatelessWidget {
  final OfferModel offer;
  const CustomCounterOfferCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final elapsedTime = DateTime.now().difference(offer.offerTime);
    int days = elapsedTime.inDays;
    int hours = elapsedTime.inHours.remainder(24);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.jobCardBorderColor.withValues(alpha: 0.05),
        boxShadow: [
          BoxShadow(
            color: AppColors.headlineTextColor.withValues(alpha: 0.05),
            offset: Offset(4, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("New Counter Offer Received", style: style.bodyMedium,),
            SizedBox(height: 4.h,),
            Text("${offer.helperName} has sent you a counter offer of \$${offer.offeredPrice} for the job ${jobs.firstWhere((job) => job.id == offer.jobId).name} Review the offer and decide",
              style: style.bodyMedium?.copyWith(overflow: TextOverflow.ellipsis, color: AppColors.greyTextColor), maxLines: 3,),
            SizedBox(height: 8.h,),
            Align(alignment: Alignment.centerRight,child: Text((days > 0) ? "$days days $hours hours ago" : "$hours hours ago", style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor,),)),
          SizedBox(height: 16.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                padding: EdgeInsets.all(12.r),
                radius: BorderRadius.circular(6.r),
                width: 145.5.w,
                text: "Decline",
                textStyle: style.bodySmall?.copyWith(color: AppColors.bgColor1, fontWeight: FontWeight.bold),
                containerColor: AppColors.bgColor4,
                borderColor: AppColors.bgColor1,
                textColor: AppColors.bgColor1,
                onPressed: (){

                },
              ),
              CustomButton(
                padding: EdgeInsets.all(12.r),
                radius: BorderRadius.circular(6.r),
                width: 145.5.w,
                text: 'Accept',
                textStyle: style.bodySmall?.copyWith(color: AppColors.bgColor4, fontWeight: FontWeight.bold),
                containerColor: AppColors.bgColor1,
                textColor: AppColors.onPrimary,
                isBig: false,
                onPressed: () {
                  context.push(RouteName.afterAcceptCounterOffer);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
