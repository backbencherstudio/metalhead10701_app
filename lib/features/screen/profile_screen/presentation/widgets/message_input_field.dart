import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metal_head/core/theme/theme_extension/app_colors.dart';

import '../../../../../core/constant/icons.dart';

class MessageInputField extends StatefulWidget {
  const MessageInputField({super.key});

  @override
  MessageInputFieldState createState() => MessageInputFieldState();
}

class MessageInputFieldState extends State<MessageInputField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showSendIcon = _isFocused || _hasText;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: 'Type your message...',
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: SvgPicture.asset(
              AppIcons.attachmentSvg,
              height: 24.h,
              width: 24.w,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: showSendIcon
                ? Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.redTextColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.sendSvg,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  )
                : SvgPicture.asset(AppIcons.micSvg, height: 24.h, width: 24.w),
          ),
        ),
      ),
    );
  }
}
