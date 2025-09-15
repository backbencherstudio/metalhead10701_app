import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/constant/images.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import 'package:metal_head/features/common_widgets/alert_dialogs/personal_info_editing_dialog.dart';
import 'package:metal_head/features/screen/auth_flow/create_account_screen/presentation/widgets/input_label_text.dart';

class PersonalInfoEditingScreen extends StatefulWidget {
  const PersonalInfoEditingScreen({super.key});

  @override
  State<PersonalInfoEditingScreen> createState() =>
      _PersonalInfoEditingScreenState();
}

class _PersonalInfoEditingScreenState extends State<PersonalInfoEditingScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      onPersonalInfoEditingTap(context);
                    },
                    child: Text(
                      'Cancel',
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.headlineTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    'Personal Information',
                    style: style.bodyMedium?.copyWith(
                      color: AppColors.headlineTextColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: style.bodyMedium?.copyWith(
                        color: AppColors.bgColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.profilePng, height: 64.h, width: 64.w,fit: BoxFit.cover,),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.trashSvg,
                              height: 24.h,
                              width: 24.w,
                            ),
                            Text(
                              'Delete photo',
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.redTextColor3,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(labelText: 'Email', style: style),
                        SizedBox(height: 8.h),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'josephine050@gmail.com',
                          ),
                        ),
                        SizedBox(height: 16.h),

                        InputLabel(labelText: 'Address', style: style),
                        SizedBox(height: 8.h),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '1234 Elm Street',
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
                                    labelText: 'City',
                                    optional: ' *',
                                  ),
                                  SizedBox(height: 8.h),
                                  TextFormField(
                                    style: style.bodyMedium?.copyWith(
                                      color: AppColors.headlineTextColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'e.g., Springfield',
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
                                    labelText: 'State',
                                    optional: ' *',
                                  ),
                                  SizedBox(height: 8.h),
                                  TextFormField(
                                    style: style.bodyMedium?.copyWith(
                                      color: AppColors.headlineTextColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'e.g., Illinois',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),
                        InputLabel(style: style, labelText: 'Zip Code',),
                        SizedBox(height: 8.h),
                        TextFormField(
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.headlineTextColor,
                          ),
                          decoration: InputDecoration(hintText: 'e.g., 12345'),
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
                                    labelText: 'Age',
                                  ),
                                  SizedBox(height: 8.h),
                                  TextFormField(
                                    style: style.bodyMedium?.copyWith(
                                      color: AppColors.headlineTextColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '24',
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
                                    labelText: 'Birthday',
                                  ),
                                  SizedBox(height: 8.h),
                                  TextFormField(
                                    style: style.bodyMedium?.copyWith(
                                      color: AppColors.headlineTextColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '14/12/2003',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 16.h),
                        InputLabel(
                          style: style,
                          labelText: 'Bio',
                          color: AppColors.greyTextColor,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.headlineTextColor,
                          ),
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Enthusiastic helper with a passion for supporting people in need.',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(color: AppColors.borderColor),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),

                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h),
                        InputLabel(
                          style: style,
                          labelText: 'Skills',
                          color: AppColors.greyTextColor,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          style: style.bodyMedium?.copyWith(
                            color: AppColors.headlineTextColor,
                          ),
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: 'Furniture moving, Lawn mowing, Grocery pickup, Cleaning services',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(color: AppColors.borderColor),
                            ),

                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),

                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
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
    );
  }
}
