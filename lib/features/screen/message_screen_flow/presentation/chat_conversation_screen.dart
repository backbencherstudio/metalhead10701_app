import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';
import '../../profile_screen/presentation/widgets/message_input_field.dart';
import '../model/message_item_model.dart';

class ChatConversationScreen extends StatelessWidget {
  const ChatConversationScreen({super.key, required this.messageItem});

  final MessageItem messageItem;
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final avatar = messageItem.avatarUrl;
    final name = messageItem.name;
    final isOnline = messageItem.isOnline;

    return Scaffold(
      backgroundColor: AppColors.whiteTextColor,
      body: SafeArea(
        child: Column(
          children: [
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.headlineTextColor,
              ),
            ),
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 22.r,
              backgroundImage: NetworkImage(avatar),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: style.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.headlineTextColor,
                  ),
                ),
                Text(
                  isOnline ? 'Online' : 'Active 1h Ago',
                  style: style.labelMedium?.copyWith(
                    color: isOnline ? AppColors.bgColor7 : AppColors.greyTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: NetworkImage(avatar),
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.bgColor4,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Christy Bergstrom',
                                style: style.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.headlineTextColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Nunc placerat vitae viverra leo blandit non interdum a asdhasf asfha fhas fhaa afashg haafh afsioahs fasfh afsaf fafasfas asfas aefasfas areafafas asfasfas asfasfasf sef f',
                                style: style.bodySmall?.copyWith(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '10:00 AM',
                                  style: style.labelSmall?.copyWith(
                                    color: AppColors.greyTextColor2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 32.w),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  // Outgoing message bubble
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 40.w),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.bgColor8,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                              topLeft: Radius.circular(16.r),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Sit nunc adipiscing purus nulla arcu morbi semper turpis. Integer urna malesuada pretium pretium risus. Tempor molestie eu integer duis eu ipsum. Consequat faucibus neque enim id sapien augue dignissim egestas tristique.',
                                style: style.bodySmall?.copyWith(
                                  color: AppColors.whiteTextColor,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.done_all,
                                      size: 16,
                                      color: AppColors.whiteTextColor,
                                    ), // double tick
                                    SizedBox(width: 4.w),
                                    Text(
                                      '10:00 AM',
                                      style: style.bodySmall?.copyWith(
                                        color: AppColors.whiteTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  // Audio message bubble
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: AppColors.bgColor8,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                            topLeft: Radius.circular(16.r),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.keyboard_voice_rounded,
                              color: AppColors.whiteTextColor,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              '0:05',
                              style: style.bodySmall?.copyWith(
                                color: AppColors.whiteTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Icon(
                              Icons.volume_up,
                              color: AppColors.whiteTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  // Another incoming message bubble
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundImage: NetworkImage(avatar),
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.bgColor4,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Christy Bergstrom',
                                style: style.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.headlineTextColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Nunc placerat vitae viverra leo blandit non interdum a. Sit a elit euismod scelerisque aenean morbi consectetur.',
                                style: style.bodySmall?.copyWith(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 32.w),
                    ],
                  ),
                ],
              ),
            ),
            MessageInputField(),
          ],
        ),
      ),
    );
  }
}
