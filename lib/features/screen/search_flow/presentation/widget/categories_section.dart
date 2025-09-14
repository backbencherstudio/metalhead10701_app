import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metal_head/features/common_widgets/common_check_box.dart';
import 'package:metal_head/features/screen/search_flow/data/provider/checkBoxController.dart';
import '../../../auth_flow/login_screen/presentation/widgets/check_box.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          4,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Row(children: [CommonCheckBox(toggleCheckBoxProvider: clickCheckBoxProvider(index + 5)), Text("Moving")]),
          ),
        ),
      ),
    );
  }
}
