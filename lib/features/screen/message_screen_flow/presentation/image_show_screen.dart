import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metal_head/core/constant/icons.dart';
import 'package:metal_head/features/screen/message_screen_flow/presentation/widgets/delete_photo_dialog.dart';
import 'package:metal_head/features/screen/message_screen_flow/presentation/widgets/save_photo_dialog.dart';
import '../../../../core/theme/theme_extension/app_colors.dart';
import '../provider/image_index_provider.dart';

class ImageShowScreen extends ConsumerWidget {
  final List<String> images;

  const ImageShowScreen({super.key, required this.images});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(imageIndexProvider);
    final style = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: AppColors.headlineTextColor,
                    ),
                  ),
                  Text(
                    '${currentIndex + 1}/${images.length}',
                    style: style.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.headlineTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.menuSvg,
                      height: 28.h,
                      width: 28.w,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          height: 300.h,
                          width: 300.w,
                        ),
                      ),
                    );
                  },
                  onPageChanged: (index) {
                    ref.read(imageIndexProvider.notifier).updateIndex(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
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
            Text('More options',style: style.bodyMedium?.copyWith(
              color: AppColors.blackHeadline,
              fontWeight: FontWeight.w500,
            ),),
            SizedBox(height: 16.h),
            ListTile(
              title: Text('Download Photo',style: style.bodyMedium?.copyWith(
                color: AppColors.blackHeadline,
                fontWeight: FontWeight.w400,
              ),),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                onSavePhotoTap(context);
              },
            ),
            ListTile(
              title: Text('Delete Photo',style: style.bodyMedium?.copyWith(
                color: AppColors.redTextColor3,
                fontWeight: FontWeight.w400,
              ),),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                onDeletePhotoTap(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
