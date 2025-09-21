import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/core/routes/route_name.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

import '../../search_flow/data/provider/search_controller.dart';
import '../provider/message_search_provider.dart';

class MessageScreen extends ConsumerStatefulWidget {
  const MessageScreen({super.key});

  @override
  ConsumerState<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreen> {
  late TextEditingController _searchController;

  bool _isFileMessage(String message) {
    final lower = message.toLowerCase();
    return lower.contains('file') ||
        lower.endsWith('.pdf') ||
        lower.endsWith('.doc') ||
        lower.endsWith('.docx') ||
        lower.endsWith('.xls') ||
        lower.endsWith('.xlsx') ||
        lower.endsWith('.png') ||
        lower.endsWith('.jpg');
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.text = ref.read(searchQueryProvider);
    _searchController.addListener(() {
      ref.read(searchQueryProvider.notifier).state = _searchController.text;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final filteredMessages = ref.watch(filteredMessageListProvider);
    final messageListNotifier = ref.read(messageListProvider.notifier);
    final fullMessageList = ref.watch(messageListProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.r),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(RouteName.userHomeScreen);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Message",
                    style: style.bodyMedium?.copyWith(
                      color: AppColors.headlineTextColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            if (fullMessageList.isNotEmpty) ...[
              TextFormField(
                controller: _searchController,
                style: style.bodyMedium?.copyWith(
                  color: AppColors.headlineTextColor,
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 8.w),
                    child: SvgPicture.asset(
                      AppIcons.searchSvg,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  prefixIconColor: AppColors.greyTextColor,
                  hintText: 'Search By Name',
                ),
              ),
              SizedBox(height: 12.h),
            ],
            Expanded(
              child: ref.read(messageListProvider).isEmpty
                  ? Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.messageSvg,
                              height: 48.h,
                              width: 48.w,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'No messages yet',
                              style: style.bodyLarge?.copyWith(
                                color: AppColors.blackHeadline,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'You’ll be notified here once\nthere’s something new.',
                              textAlign: TextAlign.center,
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.greyTextColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : filteredMessages.isEmpty
                  ? Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              AppIcons.messageSvg,
                              height: 48.h,
                              width: 48.w,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'No result',
                              style: style.bodyLarge?.copyWith(
                                color: AppColors.blackHeadline,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'There were no results for “${_searchController.text}”.\nTry another search.',
                              textAlign: TextAlign.center,
                              style: style.bodyMedium?.copyWith(
                                color: AppColors.greyTextColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: filteredMessages.length,
                      separatorBuilder: (_, __) =>
                          Divider(height: 0, color: AppColors.borderColor2),
                      itemBuilder: (context, index) {
                        final item = filteredMessages[index];
                        return Dismissible(
                          key: Key(item.name + index.toString()),
                          direction: DismissDirection.endToStart,
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
                          onDismissed: (_) {
                            messageListNotifier.removeMessage(item);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.whiteTextColor,
                                content: Text(
                                  '${item.name} deleted',
                                  style: style.bodyMedium?.copyWith(
                                    color: AppColors.headlineTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            leading: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 24.r,
                                  backgroundImage: NetworkImage(item.avatarUrl),
                                ),
                                if (item.isOnline)
                                  Positioned(
                                    bottom: 2,
                                    right: 2,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: style.bodyMedium?.copyWith(
                                      color: AppColors.headlineTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  item.time,
                                  style: style.labelMedium?.copyWith(
                                    color: AppColors.greyTextColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.h,
                              ),
                              child: Row(
                                children: [
                                  if (_isFileMessage(item.message))
                                    Padding(
                                      padding: EdgeInsets.only(right: 6.w),
                                      child: SvgPicture.asset(
                                        AppIcons.filesSvg,
                                        height: 18.h,
                                        width: 18.w,
                                        color: item.seenMessage ? AppColors.statusContainerColor : AppColors.greyTextColor,
                                      ),
                                    )
                                  else if (item.seenMessage)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 6.0),
                                      child: SvgPicture.asset(
                                        AppIcons.doubleTickSvg,
                                        height: 18.h,
                                        width: 18.w,
                                        color:  AppColors.statusContainerColor,
                                      ),
                                    ),

                                  Expanded(
                                    child: Text(
                                      item.message,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: style.bodyMedium?.copyWith(
                                        color: AppColors.greyTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  // Unread badge or empty space if seen
                                  if (!item.seenMessage && item.isUnread)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.statusContainerColor,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Text(
                                        item.unreadCount.toString(),
                                        style: style.labelMedium?.copyWith(
                                          color: AppColors.whiteTextColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            onTap: () {
                              context.push(
                                RouteName.chatConversationScreen,
                                extra: item, // Pass the entire MessageItem object
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
