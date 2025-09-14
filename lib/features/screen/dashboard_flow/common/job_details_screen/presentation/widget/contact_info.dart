import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/features/screen/dashboard_flow/data/model/job_model.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../../core/theme/theme_extension/app_colors.dart';
import '../../../../data/model/client_model.dart';

class ContactInfo extends StatelessWidget {
  final JobModel job;
  const ContactInfo({
    super.key,
    required this.job
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final client = clients.firstWhere((client)=> client.id == job.clientId);
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.contactIcon,),
            Text("Contact Information", style: style.bodyLarge?.copyWith(fontWeight: FontWeight.bold),)
          ],
        ),
        Divider(color: AppColors.headlineTextColor2.withValues(alpha: 0.1), height: 25.h,),
        Row(
          children: [
            Text("Job Post By:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(client.name, style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
          ],
        ),Row(
          children: [
            Text("Phone Number:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(client.phone, style: style.bodyMedium?.copyWith(color: AppColors.greyTextColor),),
          ],
        ),Row(
          children: [
            Text("Email:", style: style.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
            SizedBox(width: 9.w,),
            Text(client.mail ?? "johndoe@email.com", style: style.bodyMedium?.copyWith(
                color: AppColors.greyTextColor,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
        SizedBox(height: 12.h,),
        TextButton(child: Padding(
          padding: EdgeInsets.all(6.r),
          child: Text("View Profile", style: style.bodyMedium?.copyWith(color: AppColors.redTextColor),),
        ),
        onPressed: (){},)
      ],
    );
  }
}